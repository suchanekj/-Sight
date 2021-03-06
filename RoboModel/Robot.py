import os
from multiprocessing import Process, Array
from time import sleep
import random
import serial
from enum import Enum
from random import randint

# Our imports
import helperFunctions as hlp


class S(Enum):
    """State of the Robot"""
    normal = 0
    solve_candle = 1
    solve_wall = 2
    solve_line = 3
    after_candle = 4


class Robot:

    def __init__(self):
        self.fire_sen = Array('b', [0] * 5)
        self.line_sen = Array('b', [0] * 5)
        self.ultra_sen = Array('i', [0] * 4)
        self.but = Array('b', [0])
        self.wall = Array('f', [0] * 5)
        self.mot = serial.Serial('/dev/ttyUSB0')
        self.ard = serial.Serial('/dev/ttyACM0')

        # Constants
        ############################
        self.VALID_US = 100
        self.MOTORS_ENABLED = 1

        # Motors
        self.ROTATION_SPEED = 42
        self.ROT_MOD = 0.14  # TODO: make great consts
        self.LEN_MOD = 0.33
        self.SLOW_ROT_MOD = 0.05
        self.SLOW_LEN_MOD = 0.20
        # self.L_R_RATIO = 6.9 / 5
        self.L_R_RATIO = 1.3076923076923077
        self.ACCELERATION = 10
        self.MOTORS_MIN_SPEED = 16
        self.ACC_DELAY = 0.005
        self.ROT_WALL_CHANGE = 10

        # Other
        self.EXC_LEN_TO_WALL = 50
        self.MIN_LEN_TO_WALL = 25
        self.TOLERANCE_US = 4

        self.state = S.normal
        self.left = 0
        self.right = 0
        self.tabs = 0
        self.not_candle = 0
        self.not_wall = 0

        print('Init complete!')

        self.start_listening()

        # self.blow_fans()
        sleep(1)
        self.go()
        sleep(1)
        print('INFO:', 'STARTING THE SEQUENCE' * 10)

        while self.but[0] == 0:
            sleep(0.1)

        ########################
        #
        # self.go_test()
        # print('DOJETO')
        # self.go(-50,10)
        # self.go(0, 50)
        # print('ZKUSIM')
        # self.go(0, 50)
        # print('AHOJ')
        #
        ########################

        # self.go_slow(ln=30, speed=self.MOTORS_MIN_SPEED)

        self.main_cycle()

        # self.solve_line()
        # self.go_slow(rot=90, speed=self.MOTORS_MIN_SPEED)
        # self.go_slow(rot=-270, speed=self.MOTORS_MIN_SPEED)

        ########################
        print('\t' * (self.tabs + 1), 'DEBUG: debug IS DONE')
        # self.go_test()
        # self.go_test(0, 2)

        # sleep(10)
        # TODO: uncomment
        # self.main_cycle()

        print('\t' * self.tabs, 'INFO: end of Robots life')

    def start_listening(self):
        listening = Process(target=self.listen_on_port,
                            args=(
                                self.fire_sen, self.line_sen, self.ultra_sen))
        listening.start()
        print('YayX')

    def start_doing(self):
        doing = Process(target=self.solve_line(),
                        args=())
        doing.start()
        print('YayX')

    def listen_on_port(self, fire_sen, line_sen, ultra_sen):
        print('Listening attemt')
        while 1:
            # sleep(0.01)
            read_serial = self.ard.readline()
            read_serial = self.ard.readline()
            # read_serial = b'0, 1, 1, 1, 0| 1, 1, 1, 1, 0| 120, 20, 20, 20'
            # TODO: complete V

            try:
                # print('\t' * (self.tabs + 1), 'DEBUG: ', str(read_serial, 'ascii'), ' | ',
                #       self.state.name)
                ls, fs, us, but, _ = str(read_serial, 'ascii').split('|')
            except ValueError:
                print('ERROR')
                continue

            self.but[0] = int(but)
            fs = fs.replace(' ', '').split(';')
            ls = ls.replace(' ', '').split(';')
            us = us.replace(' ', '').split(';')
            us = us[::-1]
            temp = us[1]
            us[1] = us[2]
            us[2] = temp

            invalid = 0
            for x in fs + ls:
                if x not in ['0', '1']:
                    print('Invalid', x)
                    invalid = 1
            for x in us:
                if not x.isdigit():
                    print('Invalid', x)
                    invalid = 1
            if invalid:
                print('Invalid input: ', str(read_serial, 'ascii'))
                continue

            for i in range(len(fire_sen)):
                fire_sen[i] = (fs[i] == '1')
                line_sen[i] = (ls[i] == '1')
            for i in range(len(ultra_sen)):
                ultra_sen[i] = int(us[i])

            self.MOTORS_ENABLED = self.but

    # MESSED UP
    def main_cycle(self):
        while 1:
            sleep(0.001)

            print('\t' * (self.tabs + 1), 'DEBUG: State: ', self.state.name)
            print('Sensors: ', self.line_sen[:], ' | ', self.fire_sen[:],
                  ' | ', self.ultra_sen[:])
            if self.state == S.normal:
                # TODO: fix go_while
                self.go_slow(ln=1000, speed=30,
                        end=lambda: max(self.line_sen[:]) == 1
                                    # or self.ultra_sen[
                                    #     1] <= self.EXC_LEN_TO_WALL
                                    # or self.ultra_sen[
                                    #     2] <= self.EXC_LEN_TO_WALL
                                    or max(self.fire_sen[:]) == 1
                        )
                self.get_state()
                continue

            if self.state == S.solve_line:
                self.solve_line()
                self.go(ln=10)
                self.get_state()
                continue

            if self.state == S.solve_candle:
                self.solve_candle()
                continue

            if self.state == S.after_candle:
                self.after_candle()
                continue

            if self.state == S.solve_wall:
                self.solve_wall()
                self.get_state()
                continue

    # SOLVED
    def solve_candle(self):
        self.tabs += 1
        print('\n', '\t' * self.tabs, 'INFO: Entering | solve_candle: ',)
        # TODO: set actual angles DONE?
        ang2candle = {
            0: -90,
            1: -45,
            2: 0,
            3: 45,
            4: 90,
        }
        self.not_candle += 1

        print('\t' * (self.tabs + 1), 'DEBUG: line_sen: ', self.line_sen[:], self.fire_sen[:])
        while max(self.line_sen[:]) == 0 and max(self.fire_sen[:]) == 1:
            sees = 0
            sm = 0
            # TODO: replace with go_while?
            for x in range(len(self.fire_sen[:])):
                if self.fire_sen[x] == 1:
                    sees += 1
                    sm += ang2candle[x]
            if sees == 0:
                print('ERROR: No candle in solve_candle')
                self.tabs -= 1
                return

            angle = sm / sees
            print('\t' * (self.tabs + 1), 'DEBUG: Angle: ', angle, sm, sees)
            # self.go(0, angle)
            if angle != 0:
                self.go_slow(rot = (angle / abs(angle)) * 100,
                             speed=self.MOTORS_MIN_SPEED,
                             end = lambda: self.fire_sen[2] is 1)
            sleep(1)
            self.go_slow(ln=100, speed=30,
                    end=lambda: self.fire_sen[2] is 0
                                or max(self.line_sen[:]) is 1)

        # has to be on the line of the candle
        if max(self.fire_sen[:]) == 0:
            self.go_slow(rot=90, speed=self.MOTORS_MIN_SPEED,
                         end=lambda: max(self.fire_sen[:]) == 1)
            self.go_slow(rot=-180, speed=self.MOTORS_MIN_SPEED,
                         end=lambda: max(self.fire_sen[:]) == 1)
            self.get_state()
            return

        self.blow_fans()
        self.go_slow(rot=10, )
        self.blow_fans()
        self.go_slow(rot=-20, )
        self.blow_fans()
        self.go_slow(rot=10, )

        self.state = S.after_candle

        print('\t' * self.tabs, 'INFO: End of | solve_candle')
        self.tabs -= 1

    # SOLVED
    def after_candle(self):
        self.not_candle = 0
        self.go_slow(rot=(180 + randint(-42, 42)), speed=self.MOTORS_MIN_SPEED)
        self.go_slow(ln=10, speed=self.MOTORS_MIN_SPEED)

        # TODO: change lambdas
        # self.go(0, hlp.randSide() * self.ROTATION_SPEED,
        #         end=lambda: self.ultra_sen[1] < 60
        #                     and self.ultra_sen[2] < 60)
        #
        # self.go(0, hlp.randSide() * randint(0, 25),
        #         end=lambda: self.ultra_sen[1] < 60
        #                     and self.ultra_sen[2] < 60)

        self.get_state()

    def solve_wall(self):
        self.not_wall += 1
        self.tabs += 1
        print('\n', '\t' * self.tabs, 'INFO: Entering | solve_wall: ',
              self.ultra_sen[:])

        self.go()
        wall_ahead = min(self.ultra_sen[1:3])
        side = randint(0, 1) * 3

        # TODO: Try this
        # self.go_slow(ln=max(wall_ahead-10, 10), speed=self.MOTORS_MIN_SPEED,
        #              )
        self.go_slow(ln=max(wall_ahead-self.MIN_LEN_TO_WALL, 0),
                     speed=self.MOTORS_MIN_SPEED,
                     end=lambda: min(self.ultra_sen[1:3])
                                 <= self.MIN_LEN_TO_WALL)
        sleep(0.1)
        wall_ahead = min(self.ultra_sen[1:3])

        # 1 == math side, -1 = anti math side
        rot_sign = (-side // 3)*2 + 1
        print('\t' * self.tabs, 'INFO: !!! chose side: ', side, rot_sign)

        self.go_slow(rot=rot_sign * 120, speed=self.MOTORS_MIN_SPEED,
                     end=lambda: abs(wall_ahead - self.ultra_sen[side])
                                 <= self.TOLERANCE_US)

        # cases: Edge out ; edge in
        while 1:
            while (min(self.ultra_sen[1:3]) >= self.EXC_LEN_TO_WALL
                   and self.ultra_sen[side]
                       <= self.EXC_LEN_TO_WALL-self.MIN_LEN_TO_WALL):

                # break out if candle is seen
                if (max(self.fire_sen[:]) == 1):
                    self.get_state()
                    return

                # go along wall
                # print('')
                self.go_slow(ln=100, speed=30,
                             end=lambda: self.MIN_LEN_TO_WALL - self.TOLERANCE_US
                                         <= self.ultra_sen[side]
                                         <= self.MIN_LEN_TO_WALL - self.TOLERANCE_US)

                # aling with wall
                print('DEBUG: rot', rot_sign, rot_sign * self.ROT_WALL_CHANGE)
                if (self.MIN_LEN_TO_WALL - self.TOLERANCE_US
                        > self.ultra_sen[side]):
                    self.go_slow(rot=rot_sign * self.ROT_WALL_CHANGE,
                                 speed=self.MOTORS_MIN_SPEED)

                elif (self.MIN_LEN_TO_WALL + self.TOLERANCE_US
                        < self.ultra_sen[side]):
                    self.go_slow(rot=-rot_sign * self.ROT_WALL_CHANGE,
                                 speed=self.MOTORS_MIN_SPEED)

            # wall in front
            if (max(self.ultra_sen[1:3]) <= self.EXC_LEN_TO_WALL):
                self.go(ln=-20,speed=30)
                self.get_state()

                print('\t' * self.tabs, 'INFO: End of | solve_wall | wall in front')
                self.tabs -= 1
                return

            # not wall
            elif (self.ultra_sen[side]
                       >= (self.EXC_LEN_TO_WALL-self.MIN_LEN_TO_WALL)):
                print('ERROR!')
        #        TODO: do GO?

                self.go_slow(rot=-rot_sign * 90, speed=self.MOTORS_MIN_SPEED)
                self.go_slow(ln=42, speed=30,
                             end=lambda: self.ultra_sen[side] <= self.EXC_LEN_TO_WALL
                                         or min(self.ultra_sen[1:3]) <= self.EXC_LEN_TO_WALL
                                         or max(self.line_sen[:]) == 1
                                         or max(self.fire_sen[:]) == 1)

            if (self.ultra_sen[side] > (self.EXC_LEN_TO_WALL - self.MIN_LEN_TO_WALL)
                                     and min(self.ultra_sen[1:3]) >= self.EXC_LEN_TO_WALL):
                self.get_state()

                print('\t' * self.tabs, 'INFO: End of | solve_wall | LAST END')
                self.tabs -= 1
                return

        print('\t' * self.tabs, 'INFO: End of | solve_wall')
        self.tabs -= 1

    def go_test(self):
        if not self.MOTORS_ENABLED:
            return
        print('Going')

        self.mot.write(b'L50A')
        self.mot.write(b'R50A')
        sleep(0.1)
        self.mot.write(b'L69A')
        self.mot.write(b'R50A')
        while max(self.line_sen[:]) == 0:
            sleep(0.0001)

        self.mot.write(b'L0A')
        self.mot.write(b'R0A')
        self.blow_fans()
        sleep(6)

    # SOLVED
    def go_basic(self, l, r):
        self.tabs += 1
        print('\n', '\t' * self.tabs, 'INFO: Entering | go_basic: ', l, r)

        if not self.MOTORS_ENABLED:
            self.mot.write(b'L0A')
            self.mot.write(b'R0A')
            return

        if l == 0:
            self.left = 0
        if r == 0:
            self.right = 0

        # l = int(((l / 50) ** 2.32) * 70 / 5)
        l = l * self.L_R_RATIO

        while l != self.left or r != self.right:
            if self.left < l: self.left += self.ACCELERATION
            if self.right < r: self.right += self.ACCELERATION
            if self.left > l: self.left -= self.ACCELERATION
            if self.right > r: self.right -= self.ACCELERATION

            if self.left > l - self.ACCELERATION and self.left < l + self.ACCELERATION:
                self.left = l
            if self.right > r - self.ACCELERATION and self.right < r + self.ACCELERATION:
                self.right = r

            self.mot.write(('L' + str(int(self.left)) + 'A').encode('ascii'))
            self.mot.write(('R' + str(int(self.right)) + 'A').encode('ascii'))
            sleep(self.ACC_DELAY)

        self.mot.write(('L' + str(int(self.left)) + 'A').encode('ascii'))
        self.mot.write(('R' + str(int(self.right)) + 'A').encode('ascii'))

        print('\t' * self.tabs, 'INFO: Leaving | go_basic')
        self.tabs -= 1

    # SOLVED
    def go(self, ln=0, rot=0, speed=50, end=(lambda: 0)):
        # end 1 == END, 0 == CONTINUE
        self.tabs += 1
        print('\n', '\t' * self.tabs, 'INFO:INFO: Entering go')

        if not self.MOTORS_ENABLED:
            return
        step = 0.00001

        if end():
            print('\t' * self.tabs, 'INFO: Insta end of | go')
            self.tabs -= 1
            return
        speedl = 0
        speedr = 0
        time = 0
        if ln == 0:
            if rot > 0:
                print('Jsem v ROT')
                speedl = -speed
                speedr = speed
            else:
                speedl = speed
                speedr = -speed
            time = abs(rot / speed * self.ROT_MOD)
        elif rot == 0:
            if ln < 0:
                speed = -speed
            speedl = speed
            speedr = speed
            time = abs(ln / speed * self.LEN_MOD)
        else:
            print('ERROR LN and ROT' * 100)
            return

        if time == 0:
            speedr = 0
            speedl = 0
        t_left = time

        print('\t' * (self.tabs + 1), 'DEBUG: speedl, speedr: ', speedl, speedr)
        self.go_basic(speedl, speedr)
        print('\t' * (self.tabs + 1), 'DEBUG: GOING: time: ', time)
        # while end() and t_left > 0:
        while not end() and t_left > 0:
            # print('\t' * (self.tabs + 1), 'DEBUG: ', self.state.name, self.line_sen[:], self.fire_sen[:], ' | ', end())
            t_left -= step
            sleep(step)
            # self.get_state()
        print('\t' * (self.tabs + 1), 'DEBUG: STOP: end(): ', end())
        self.go_basic(0, 0)
        print('\t' * (self.tabs + 1), 'DEBUG: STOPPED')

        print('\t' * self.tabs, 'INFO: End of | go')
        self.tabs -= 1

    # SOLVED
    def go_slow(self, ln=0, rot=0, speed=50, end=(lambda: 0)):
        # end 1 == END, 0 == CONTINUE
        self.tabs += 1
        print('\n', '\t' * self.tabs, 'INFO: Entering | go_slow')

        if not self.MOTORS_ENABLED:
            return
        step = 0.00001

        if end():
            print('\t' * self.tabs, 'INFO: Insta end of | go_slow')
            self.tabs -= 1
            self.go()
            return

        if ln == 0:
            if rot > 0:
                print('Jsem v ROT')
                speedl = -speed
                speedr = speed
            else:
                speedl = speed
                speedr = -speed
            time = abs(rot / speed * self.SLOW_ROT_MOD)
        elif rot == 0:
            if ln < 0:
                speed = -speed
            speedl = speed
            speedr = speed
            time = abs(ln / speed * self.SLOW_LEN_MOD)
        else:
            print('ERROR LN and ROT' * 100)
            return

        if time == 0:
            speedr = 0
            speedl = 0
        t_left = time

        self.go_basic((speedl / abs(speedl)) * 65, (speedr / abs(speedr)) * 65)
        print('\t' * (self.tabs + 1), 'DEBUG: speedl, speedr: ', speedl, speedr)
        # sleep()
        self.go_basic(speedl, speedr)
        print('\t' * (self.tabs + 1), 'DEBUG: GOING: time: ', time)
        # while end() and t_left > 0:
        while not end() and t_left > 0:
            # print('\t' * (self.tabs + 1), 'DEBUG: ', self.state.name, self.line_sen[:], self.fire_sen[:], ' | ', end())
            t_left -= step
            sleep(step)
            # self.get_state()
        print('\t' * (self.tabs + 1), 'DEBUG: STOP: end(): ', end())
        self.go_basic(0, 0)

        print('\t' * self.tabs, 'INFO: End of | go_slow')
        self.tabs -= 1

    # SOLVED
    def blow_fans(self):
        # TODO: write code

        self.tabs += 1
        print('\n', '\t' * self.tabs, 'INFO:INFO: Entering blow_fans')

        print('Fenuji')
        step = 0.001
        enable = 'YY'
        disable = 'NN'
        self.ard.write(enable.encode('ascii'))
        sleep(1)

        # self.ard.write(b'nn')
        self.ard.write(disable.encode('ascii'))
        self.ard.write(disable.encode('ascii'))

        print('\t' * self.tabs, 'INFO: End of | blow_fans')
        self.tabs -= 1

    # MESSED UP !!! Just a 1 + kk
    def solve_line(self):
        self.tabs += 1
        print('\n', '\t' * self.tabs, 'INFO:INFO: Entered solve_line')

        it = 0
        angle = 0
        self.go()
        sleep(0.1)
        self.go_slow(ln=-20, speed=self.MOTORS_MIN_SPEED+2)
        self.go_slow(ln=30, speed=self.MOTORS_MIN_SPEED,
                     end=lambda: sum(self.line_sen[:]) >= 2)
        sleep(0.1)
        if sum(self.line_sen[:]) < 2:
            self.go_slow(ln=-40, speed=self.MOTORS_MIN_SPEED,
                    end=lambda: sum(self.line_sen[:]) >= 2)

        self.go()
        sleep(0.1)
        if sum(self.line_sen[:]) < 2:
            print('ERROR: couldnt find normal line: ', self.line_sen[:])
            self.go()
            self.get_state()
            return

        # has to have at least 2 line_sens on
        if sum(self.line_sen[:]) >= 2:
            for a in range(len(self.line_sen[:])):
                if self.line_sen[a] == 1:
                    for b in range(a + 1, len(self.line_sen[:])):
                        if self.line_sen[b] == 1:
                            angle += hlp.angleToLine(a, b)
                            it += 1

        if it == 0:
            print('ERROR: Sees only: ', sum(self.line_sen[:]))
            self.go(rot=180)
            self.go(ln=10)
            self.state = S.normal
            return

        angle = - angle / it

        print('\t' * (self.tabs + 1), 'DEBUG: Final Angle: ', angle)
        print('\t' * (self.tabs + 1), 'DEBUG: Rotation: ', 180 - angle)

        self.go_slow(rot=180 - angle, speed=self.MOTORS_MIN_SPEED)
        self.go_slow(ln=10, speed=self.MOTORS_MIN_SPEED)
        # self.go_slow(rot=angle + (angle / abs(angle)) * randint(-70, 70))
        self.go_slow(rot=randint(-70, 70), speed=self.MOTORS_MIN_SPEED,
                     end=lambda: max(self.fire_sen[:]) == 1)

        self.get_state()

        print('\t' * self.tabs, 'INFO: End of solve_line')
        self.tabs -= 1

    # SOLVED
    def get_state(self):
        if self.not_candle >= 3:
            self.go(ln=30,
                    end=lambda: max(self.line_sen[:]) == 1
                                or min(self.ultra_sen[1:3])
                                   <= self.EXC_LEN_TO_WALL)
            self.not_candle = 0

        if max(self.fire_sen[:]) == 1:
            self.state = S.solve_candle
            return
        if max(self.line_sen[:]) == 1:
            self.state = S.solve_line
            return
        # if min(self.ultra_sen[1:3]) < self.VALID_US:
        #     self.state = S.solve_wall
        #     return

        # print('Else')
        self.state = S.normal


R = Robot()
# print('ROBOTO: ', R.t)

print('Ratatata: ', R.fire_sen[:], R.ultra_sen[:], R.line_sen[:])

sleep(4)

print('Ratatata: ', R.fire_sen[:], R.ultra_sen[:], R.line_sen[:])

sleep(4)

print('Ratatata: ', R.fire_sen[:], R.ultra_sen[:], R.line_sen[:])

print('END ' * 100)

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
        self.t = 0
        self.mot = serial.Serial('/dev/ttyUSB0')
        self.ard = serial.Serial('/dev/ttyACM0')

        # Constants
        ############################
        self.VALID_US = 100
        self.MOTORS_ENABLED = 1

        # Motors
        self.ROTATION_SPEED = 42
        self.ROT_MOD = 0.14 # TODO: make great consts
        self.LEN_MOD = 0.33
        # self.L_R_RATIO = 6.9 / 5
        self.L_R_RATIO = 1.3076923076923077
        self.ACCELERATION = 5
        self.MOTORS_MIN_SPEED = 34

        # Other
        self.MIN_LEN_TO_WALL = 50



        self.state = S.normal
        self.left = 0
        self.right = 0

        print('Init complete!')

        self.start_listening()

        self.blow_fans()

        # while self.but[0] == 0:
        #     print(self.but[0])
        #     sleep(0.1)

        ########################
        # self.go_test()
        # print('DOJETO')
        # self.go(-50,10)
        # self.go(0, 50)
        # print('ZKUSIM')
        # self.go(0, 50)
        # print('AHOJ')
        ########################

        # for _ in range(1):
        #     self.go(0, 40, speed=self.MOTORS_MIN_SPEED)
        #     sleep(1)
        # self.go(0, 60, speed=self.MOTORS_MIN_SPEED)
        # sleep(5)
        # self.go(0, 270, speed=self.MOTORS_MIN_SPEED)


        self.solve_line()

        print('DEBUG: debug IS DONE')
        # self.go_test()
        # self.go_test(0, 2)

        # sleep(10)
        # TODO: uncomment
        # self.main_cycle()

        print('INFO: end of Robots life')

    def start_listening(self):
        listening = Process(target=self.listen_on_port,
                            args=(
                                self.fire_sen, self.line_sen, self.ultra_sen))
        listening.start()
        print('YayX')

    def listen_on_port(self, fire_sen, line_sen, ultra_sen):
        print('Listening attemt')
        while 1:
            # sleep(0.1)
            read_serial = self.ard.readline()
            read_serial = self.ard.readline()
            # read_serial = b'0, 1, 1, 1, 0| 1, 1, 1, 1, 0| 120, 20, 20, 20'
            # TODO: complete B, V

            # print('DEBUG: ', str(read_serial, 'ascii').split('|'))

            try:
                # print('DEBUG: ', str(read_serial, 'ascii'), ' | ', self.state.name)
                ls, fs, us, but, _ = str(read_serial, 'ascii').split('|')
            except ValueError:
                print('ERROR')
                continue

            self.but[0] = int(but)
            fs = fs.replace(' ', '').split(';')
            ls = ls.replace(' ', '').split(';')
            us = us.replace(' ', '').split(';')

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

    # Messed up
    def main_cycle(self):
        while 1:
            sleep(0.001)

            print('DEBUG: State: ', self.state.name)
            print('Sensors: ', self.line_sen[:], ' | ', self.fire_sen[:],
                  ' | ', self.ultra_sen[:])
            if self.state == S.normal:
                # TODO: fix go_while
                self.go(1000, 0,
                              end=lambda: max(self.line_sen[:]) == 1
                                          or self.ultra_sen[1] <= self.MIN_LEN_TO_WALL
                                          or self.ultra_sen[2] <= self.MIN_LEN_TO_WALL
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

    # MESSED
    def solve_candle(self):
        # TODO: set actual angles DONE?
        ang2candle = {
            0: -90,
            1: -45,
            2: 0,
            3: 45,
            4: 90,
        }

        while max(self.line_sen[:]) == 0 and max(self.fire_sen[:]) == 1:
            sees = 0
            sm = 0
            for x in range(len(self.fire_sen[:])):
                if self.fire_sen[x]:
                    sees += 1
                    sm += ang2candle[x]
            if sees == 0:
                print('No candle in solve_candle')
                return
            angle = sm / sees
            print('DEBUG: Angle: ', angle, sm, sees)
            self.go(0, angle)
            self.go(10, 0,
                    end=lambda: self.fire_sen[2] is 0
                                or self.fire_sen[3] is 1
                                or self.fire_sen[4] is 1
                                or self.fire_sen[0] is 1
                                or self.fire_sen[1] is 1)

        # has to be on the line of the candle
        self.blow_fans()
        self.go(0, 10,)
        self.blow_fans()
        self.go(0, -20,)
        self.blow_fans()

        self.state = S.after_candle

    # MESSED
    def after_candle(self):
        self.go(-40)
        self.go(0, 80)

        # TODO: change lambdas
        self.go(0, hlp.randSide() * self.ROTATION_SPEED,
                      end=lambda: self.ultra_sen[1] < 60
                                  and self.ultra_sen[2] < 60)

        self.go(0, hlp.randSide() * randint(0, 25),
                end=lambda: self.ultra_sen[1] < 60
                            and self.ultra_sen[2] < 60)

        self.get_state()

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

    def go_basic(self, l, r):
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
            sleep(0.005)

        self.mot.write(('L' + str(int(self.left)) + 'A').encode('ascii'))
        self.mot.write(('R' + str(int(self.right)) + 'A').encode('ascii'))

    def go(self, ln=0, rot=0, speed=50, end=(lambda: 0)):
        # end 1 == END, 0 == CONTINUE
        print('\nINFO: Entering go')

        if not self.MOTORS_ENABLED:
            return
        step = 0.0001

        if end():
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
            print('ERROR LN and ROT'*100)
            return

        if time == 0:
            speedr = 0
            speedl = 0
        t_left = time

        print('DEBUG: speedl, speedr: ', speedl, speedr)
        self.go_basic(speedl, speedr)
        print('DEBUG: GOING: time: ', time)
        # while end() and t_left > 0:
        while not end() and t_left > 0:
            # print('DEBUG: ', self.state.name, self.line_sen[:], self.fire_sen[:], ' | ', end())
            t_left -= step
            sleep(step)
            self.get_state()
        print('DEBUG: STOP: end(): ', end())
        self.go_basic(0, 0)
        print('DEBUG: STOPPED')

    def go_while(self, ln, rot=0, speed=50, end=(lambda: 0)):
        if not self.MOTORS_ENABLED:
            return
            # TODO: rot == 1 left, rot == -1 right
        t_left = 15
        step = 0.0001

        # self.go(100,)
        while end() and t_left > 0:
            t_left -= step
            sleep(step)
            self.get_state()
        self.go_basic(0, 0)

    def blow_fans(self):
        # TODO: write code
        time_left = 3
        # with serial.Serial('/dev/ttyACM0') as ser:
        #     enbl = b'yy'
        #     ser.write(enbl)
        #     print(enbl)
        #     sleep(3)
        #
        #     ser.write(b'nn')
        # return
        print('Fenuji')
        step = 0.001
        enable = 'YY'
        disable = 'NN'
        self.ard.write(enable.encode('ascii'))
        sleep(3)
        # while time_left > 0:
        #     # self.ard.write('yy')
        #     self.ard.write(enable.encode('ascii'))
        #     sleep(step)
        #     time_left -= step

        # self.ard.write(b'nn')
        self.ard.write(disable.encode('ascii'))
        self.ard.write(disable.encode('ascii'))

    # MESSED UP ???
    def solve_line(self):
        print('\nINFO: Entered solve_line')
        it = 0
        angle = 0
        self.go()
        sleep(1)
        self.go(ln=60, speed=self.MOTORS_MIN_SPEED,
                end=lambda: sum(self.line_sen[:]) >= 2)
        sleep(100)
        if sum(self.line_sen[:]) < 2:
            self.go(ln=-40, speed=self.MOTORS_MIN_SPEED,
                    end=lambda: sum(self.line_sen[:]) >= 2)
        self.go()
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

        angle = angle / it

        print('DEBUG: Final Angle: ', angle)

        self.go(0, angle + (angle / abs(angle)) * randint(20, 160),
                end=lambda: max(self.fire_sen[:]) == 1)

        print('INFO: End of solve_line')

    # SOLVED
    def get_state(self):
        if max(self.fire_sen[:]) == 1:
            self.state = S.solve_candle
            return
        if max(self.line_sen[:]) == 1:
            self.state = S.solve_line
            return
        if min(self.ultra_sen[:]) < self.VALID_US:
            self.state = S.solve_wall
            return

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

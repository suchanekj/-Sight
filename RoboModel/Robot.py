import os
from multiprocessing import Process, Array
from time import sleep
import random
import serial
from enum import Enum

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
        self.wall = Array('f', [0] * 5)
        self.t = 0
        self.mot = serial.Serial('/dev/ttyUSB0')
        self.ard = serial.Serial('/dev/ttyACM0')

        # Constants
        self.VALID_US = 100
        self.MOTORS_ENABLED = 0

        self.state = S.normal

        print('Init complete!')

        self.start_listening()
        self.blow_fans()
        self.go_test(0, 2)
        self.main_cycle()

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
            sleep(0.01)
            read_serial = self.ard.readline()
            read_serial = self.ard.readline()
            # read_serial = b'0, 1, 1, 1, 0| 1, 1, 1, 1, 0| 120, 20, 20, 20'
            # TODO: complete B, V

            # print('DEBUG: ', str(read_serial, 'ascii').split('|'))

            try:
                # print('DEBUG: ', str(read_serial, 'ascii'))
                fs, ls, us, _, _ = str(read_serial, 'ascii').split('|')
            except ValueError:
                print('ERROR')
                continue

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

            print('DEBUG: line_sen: ', self.line_sen[:])

            # print('DEBUG: ', end='')
            # for

    def main_cycle(self):
        max_time = 4  # maximum interupts before shutdown
        while 1:
            print('INFO: entered main_cycle')
            sleep(0.1)
            # print('DEBUG: waiting in main loop, ultra_sen == ',
            #       self.ultra_sen[1])
            # print('DEBUG: State: ', self.state.name)
            # if self.ultra_sen[1] < 15:
            #     print('It should be FUN!')
            #     self.ard.write(b'1\r\n')
            #     sleep(5)
            #     print('End of FUN!')
            #     self.ard.write(b'0\r\n')
            #     sleep(5)
            #     continue
            # else:
            #     continue

            if max_time <= 0:
                self.go_test(0, 0)
                return

            if self.state == S.normal:
                self.go(10, 0,
                        end=lambda: self.ultra_sen[1] > 20
                                    and self.ultra_sen[2] > 20)
                self.get_state()
                continue
            if self.state == S.solve_line:
                self.solve_line()
                self.get_state()
                continue
            else:
                max_time -= 1
                sleep(5)
                self.state = S.normal
                continue
            if self.state == S.solve_candle:
                self.solve_candle()
            if self.state == S.after_candle:
                self.after_candle()


    def solve_candle(self):
        # TODO: set actual angles
        ang2candle = {
            0: 60,
            1: 45,
            2: 0,
            3: -45,
            4: -60,
        }

        while not max(self.line_sen[:]):
            sees = 0
            sm = 0
            for x in range(self.fire_sen[:]):
                if self.fire_sen[x]:
                    sees += 1
                    sm += ang2candle[x]
            if sees == 0:
                print('No candle in solve_candle')
                return
            angle = sm / sees
            self.go(0, angle)
            self.go(10, 0, 100,
                    lambda: self.fire_sen[2] is 1
                            and self.fire_sen[3] is 0
                            and self.fire_sen[1] is 0)

        # has to be on the line of the candle
        self.blow_fans()
        self.state = S.after_candle

    def after_candle(self):
        self.go(-40)
        self.go(0, 80)

        self.go_while(0, -1, lambda: self.ultra_sen[1] < 60
                                     and self.ultra_sen[2] < 60)

    def go_test(self, l, r):
        if not self.MOTORS_ENABLED:
            return
        print('Going')

        self.mot.write(b'L200A')
        self.mot.write(b'R200A')
        sleep(0.1)
        self.mot.write(b'L200A')
        self.mot.write(b'R200A')
        sleep(0.5)
        self.mot.write(b'L0A')
        self.mot.write(b'R0A')
        sleep(6)

    def go(self, ln, rot=0, speed=100, end=(lambda: 1)):
        if not self.MOTORS_ENABLED:
            return
        t_left = ln  # TODO: well calculated time
        step = 0.05

        if not end():
            return
        self.mot.write(b'L50A')
        self.mot.write(b'R50A')
        while end() and t_left > 0:
            t_left -= step
            sleep(step)
            self.get_state()
        self.mot.write(b'L0A')
        self.mot.write(b'R0A')

    def go_while(self, ln, rot=0, end=(lambda: 0)):
        if not self.MOTORS_ENABLED:
            return
            # TODO: rot == 1 left, rot == -1 right
        t_left = 15
        step = 0.05

        self.mot.write(b'L50A')
        self.mot.write(b'R50A')
        while end() and t_left > 0:
            t_left -= step
            sleep(step)
            self.get_state()
        self.mot.write(b'L0A')
        self.mot.write(b'R0A')

    def blow_fans(self):
        # TODO: write code
        self.ard.write(b'yy')
        sleep(3)
        self.ard.write(b'nn')
        pass

    def solve_line(self):
        it = 0
        angle = 0
        self.go(10, 0, 50, lambda: sum(self.line_sen[:]) >= 2)
        if sum(self.line_sen[:]) < 2:
            self.go(-20, 0, 50, lambda: sum(self.line_sen[:]) >= 2)

        if sum(self.line_sen[:]) >= 2:
            for a in range(len(self.line_sen[:])):
                if self.line_sen[a] == 1:
                    for b in range(a+1, len(self.line_sen[:])):
                        if self.line_sen[b] == 1:
                            angle += hlp.angleToLine(a, b)
                            it += 1

        if it == 0:
            print('DEBUG: Sees only: ', it)
            self.go(0, 180)
            self.state = S.normal
            return

        angle = angle / it
        print('DEBUG: Angle: ', angle)

    def get_state(self):
        if max(self.fire_sen[:]):
            self.state = S.solve_candle
            return
        if max(self.line_sen[:]):
            self.state = S.solve_line
            return
        if min(self.ultra_sen[:]) < self.VALID_US:
            self.state = S.solve_wall
            return


R = Robot()
# print('ROBOTO: ', R.t)

print('Ratatata: ', R.fire_sen[:], R.ultra_sen[:], R.line_sen[:])

sleep(4)

print('Ratatata: ', R.fire_sen[:], R.ultra_sen[:], R.line_sen[:])

sleep(4)

print('Ratatata: ', R.fire_sen[:], R.ultra_sen[:], R.line_sen[:])

print('END '*100)

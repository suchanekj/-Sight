import os
from multiprocessing import Process, Array
from time import sleep
import random
import serial
from enum import Enum


class S(Enum):
    """State of the Robot"""
    normal = 0
    solve_candle = 1
    solve_wall = 2
    solve_line = 3
    after_candle = 4


def loop_b(fire_sen):
    while 1:
        sleep(2)
        fire_sen[0] += 1
        print("b")


processes = []


class Robot:

    def __init__(self):
        self.fire_sen = Array('b', [0] * 5)
        self.line_sen = Array('b', [0] * 5)
        self.ultra_sen = Array('i', [0] * 4)
        self.wall = Array('f', [0] * 5)
        self.port = 4200
        self.t = 0

        # Constants
        self.VALID_US = 100

        self.state = S.normal

        self.start_listening()
        self.go_test(0, 2)
        # self.main_cycle()

        print('Init complete!')

    def start_listening(self):
        listening = Process(target=self.listen_on_port,
                            args=(
                                self.fire_sen, self.line_sen, self.ultra_sen))
        listening.start()
        print('YayX')

    def listen_on_port(self, fire_sen, line_sen, ultra_sen):
        print('Listening attemt')
        # with serial.Serial('/dev/ttyACM0', self.port) as ser:
        if 1:
            print('Listening successful')
            while 1:
                sleep(1)
                # read_serial = ser.readline()
                read_serial = b'0, 1, 1, 1, 0| 1, 1, 1, 1, 0| 120, 20, 20, 20'
                fs, ls, us = str(read_serial, 'ascii').split('|')

                fs = fs.replace(' ', '').split(',')
                ls = ls.replace(' ', '').split(',')
                us = us.replace(' ', '').split(',')

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

    def main_cycle(self):
        while 1:

            if self.state == S.normal:
                self.go(10, 0)
                self.get_state()
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
            self.go(10, 0,
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
        print('Going')
        with serial.Serial('/dev/ttyUSB0', self.port) as mot:
            mot.write('L512A')
            mot.write('R256A')
            sleep(5)
            mot.write('L0A')
            mot.write('R0A')

    def go(self, ln, rot=0, end=(lambda: 1)):
        t_left = 1  # TODO: well calculated time
        step = 0.05

        with serial.Serial('/dev/ttyUSB0', self.port) as mot:
            mot.write(b'L512A')
            mot.write(b'R256A')
            while end() and t_left > 0:
                t_left -= step
                sleep(step)
                self.get_state()
            mot.write(b'L0A')
            mot.write(b'R0A')

    def go_while(self, ln, rot=0, end=(lambda: 0)):
        # TODO: rot == 1 left, rot == -1 right
        t_left = 15
        step = 0.05

        with serial.Serial('/dev/ttyUSB0', self.port) as mot:
            mot.write('L512A')
            mot.write('R256A')
            while end() and t_left > 0:
                t_left -= step
                sleep(step)
                self.get_state()
            mot.write('L0A')
            mot.write('R0A')

    def blow_fans(self):
        # TODO: write code
        pass

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
print('ROBOTO: ', R.t)

print('Ratatata: ', R.fire_sen[:], R.ultra_sen[:], R.line_sen[:])

sleep(4)

print('Ratatata: ', R.fire_sen[:], R.ultra_sen[:], R.line_sen[:])

sleep(4)

print('Ratatata: ', R.fire_sen[:], R.ultra_sen[:], R.line_sen[:])

print('Nice')

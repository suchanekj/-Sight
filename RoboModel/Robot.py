import os
from multiprocessing import Process, Array
from time import sleep
import random
import serial


def loop_b(fire_sen):
    while 1:
        sleep(2)
        fire_sen[0] += 1
        print("b")


processes = []



class Robot:

    def __init__(self):
        self.fire_sen = Array('b', [0]*5)
        self.line_sen = Array('b', [0]*5)
        self.ultra_sen = Array('i', [0]*4)
        self.wall = Array('f', [0]*5)
        self.port = 4200
        self.t = 0

        self.start_listening()



        print('Wow!')

    def start_listening(self):
        listening = Process(target=self.listen_on_port,
                            args=(self.fire_sen, self.line_sen, self.ultra_sen))
        listening.start()
        # runtime = Process(target=run_cyclus(self), args=())
        # runtime.start()
        print('YayX')

    def listen_on_port(self, fire_sen, line_sen, ultra_sen):
        print('Listening attemt')
        with serial.Serial('/dev/ttyACM0', self.port) as ser:
            print('Listening successful')
            while 1:
                sleep(1)
                # read_serial = ser.readline()
                read_serial = b'0, 1, 1, 1, 0| 1, 1, 1, 1, 0| 120, 20, 20, 20'
                fs, ls, us = str(read_serial, 'ascii').split('|')

                invalid = 0
                for x in fs + ls:
                    if x not in ['0', '1']:
                        invalid = 1
                for x in us:
                    if x.isdigit():
                        invalid = 1
                if invalid:
                    print('Invalid input: ', str(read_serial, 'ascii'))
                    continue

                for i in range(len(fire_sen)):
                    fire_sen[i] = bool(fs.split(',')[i])
                    line_sen[i] = bool(ls.split(',')[i])
                for i in range(len(ultra_sen)):
                    ultra_sen[i] = int(us.split(',')[i])



R = Robot()
print('ROBOTO: ', R.t)

print('Ratatata: ', R.fire_sen[:], R.ultra_sen[:], R.line_sen[:])

sleep(4)

print('Ratatata: ', R.fire_sen[:], R.ultra_sen[:], R.line_sen[:])

sleep(4)

print('Ratatata: ', R.fire_sen[:], R.ultra_sen[:], R.line_sen[:])



print('Nice')

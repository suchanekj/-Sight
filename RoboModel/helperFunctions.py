import math
from random import randint


class Point:

    def __init__(self, x, y):
        self.x = x
        self.y = y


LINE_POS = [  # from right to left
    Point(0.7, 0.7),
    Point(0.38, 0.92),
    Point(0, 1),
    Point(-0.38, 0.92),
    Point(-0.7, -0.7),
]


def randSide():
    return (randint(0, 1) * 2 - 1)

# SOLVED
def angleToLine(a, b):
    # print('DEBUG: AngleToLine: ', a, b)

    if LINE_POS[a].x == LINE_POS[b].x:
        print('ERROR: dividing by zero: ', a, b)
        return 0

    angle = math.atan2((LINE_POS[a].y - LINE_POS[b].y), (LINE_POS[a].x - LINE_POS[b].x))
    print('DEBUG: angle radian: ', angle)
    angle = angle * 180 / math.pi
    print('DEBUG: angle celsius: ', angle)

    return angle
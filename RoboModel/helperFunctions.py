import math


class Point:

    def __init__(self, x, y):
        self.x = x
        self.y = y


LINE_POS = [  # from right to left
    Point(6, 0),
    Point(3, 3),
    Point(0, 6),
    Point(-3, 3),
    Point(-6, 0),
]


def angleToLine(a, b):
    print('DEBUG: AngleToLine: ', a, b)
    k = (LINE_POS[a].y - LINE_POS[b].y) / (LINE_POS[a].x - LINE_POS[b].x)

    return math.asin(k / math.sqrt(
        pow(k, 2) - pow(LINE_POS[a].x - LINE_POS[b].x, 2))) * 180 / math.pi

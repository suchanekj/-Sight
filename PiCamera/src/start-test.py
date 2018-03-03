import numpy as np
import cv2

from visual_odometry import PinholeCamera, VisualOdometry

cam = PinholeCamera(1280.0, 720.0, 718.8560, 718.8560, 607.1928, 185.2157)
# cam = PinholeCamera(4032.0, 3024.0, 0, 0, 0, 0)
vo = VisualOdometry(cam)

traj = np.zeros((1200, 1200, 3), dtype=np.uint8)

cam = cv2.VideoCapture()
cam.open('/home/ron/documents/programovani/projekty/StarSight/PiCamera/camera/longNew.mp4')

results_dir = 'results'
print('Start')

mn = 0
mx = 10000
skip = 2
scale = 20
show_skip = 50

for img_id in range(mn, mx):
    # img = cv2.imread(
    #     '/home/ron/documents/programovani/projekty/StarSight/PiCamera/zatacka/' + str(
    #         img_id) + '.jpg', 1)

    # img = None
    # for _ in range(skip):
    #     _, img = cam.read()
    # print(img)

    # img = cv2.resize(img, None, fx=0.5, fy=0.5, interpolation = cv2.INTER_CUBIC)
    # img = cv2.imread('')
    # while img is None:
    #     _, img = cam.read()

    _, img = cam.read()
    # print(img_id, ' | ', len(img))

    # img = cv2.rotate(img, cv2.ROTATE_180)

    vo.update(img, img_id)

    cur_t = vo.cur_t
    if img_id > mn+2:
        x, y, z = cur_t[0], cur_t[1], cur_t[2]
    else:
        x, y, z = 0., 0., 0.
    draw_x, draw_y = int((skip+1)*x/scale) + traj.shape[0]//2, int((skip+1)*z/scale) + traj.shape[1]//2
    true_x, true_y = int(vo.trueX) + traj.shape[0]//2, int(vo.trueZ) + traj.shape[1]//2

    cv2.circle(traj, (draw_x, draw_y), 1,
               (img_id * 255 / 4540, 255 - img_id * 255 / 4540, 0), 1)
    cv2.circle(traj, (true_x, true_y), 1, (0, 0, 255), 2)
    cv2.rectangle(traj, (10, 20), (600, 60), (0, 0, 0), -1)
    text = "Coordinates: x=%2fm y=%2fm z=%2fm" % (x, y, z)
    cv2.putText(traj, text, (20, 40), cv2.FONT_HERSHEY_PLAIN, 1,
                (255, 255, 255), 1, 8)


    if (img_id % show_skip == 0):
        print(img_id)
        cv2.imwrite(results_dir + '/' + str(img_id).zfill(6) + '.png', traj)

    # cv2.imshow('Road facing camera', img)
    # cv2.imshow('Trajectory', traj)
    # cv2.waitKey(1)

print('Done')
cv2.imwrite(results_dir + '/map.png', traj)

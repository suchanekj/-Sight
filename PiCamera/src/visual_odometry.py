import numpy as np
import cv2

STAGE_FIRST_FRAME = 0
STAGE_SECOND_FRAME = 1
STAGE_DEFAULT_FRAME = 2
kMinNumFeature = 1500

lk_params = dict(winSize=(21, 21),
                 # maxLevel = 3,
                 criteria=(
                 cv2.TERM_CRITERIA_EPS | cv2.TERM_CRITERIA_COUNT, 30, 0.01))


def featureTracking(image_ref, image_cur, px_ref):
    kp2, st, err = cv2.calcOpticalFlowPyrLK(image_ref, image_cur, px_ref, None,
                                            **lk_params)  # shape: [k,2] [k,1] [k,1]
    # print(st.shape)
    # print(st)
    st = st.reshape(st.shape[0])
    kp1 = px_ref[st == 1]
    kp2 = kp2[st == 1]

    return kp1, kp2


class PinholeCamera:
    def __init__(self, width, height, fx, fy, cx, cy,
                 k1=0.0, k2=0.0, p1=0.0, p2=0.0, k3=0.0):
        self.width = width
        self.height = height
        self.fx = fx
        self.fy = fy
        self.cx = cx
        self.cy = cy
        self.distortion = (abs(k1) > 0.0000001)
        self.d = [k1, k2, p1, p2, k3]


class VisualOdometry:
    def __init__(self, cam):
        self.frame_stage = 0
        self.cam = cam
        self.new_frame = None
        self.last_frame = None
        self.cur_R = None
        self.cur_t = None
        self.px_ref = None
        self.px_cur = None
        self.focal = cam.fx
        self.pp = (cam.cx, cam.cy)
        self.trueX, self.trueY, self.trueZ = 0, 0, 0
        self.detector = cv2.FastFeatureDetector_create(threshold=10,
                                                       nonmaxSuppression=True)
        # with open(annotations) as f:
        #     self.annotations = f.readlines()

    def getAbsoluteScale(self,
                         frame_id):  # specialized for KITTI odometry dataset
        ss = self.annotations[frame_id - 1].strip().split()
        x_prev = float(ss[3])
        y_prev = float(ss[7])
        z_prev = float(ss[11])
        ss = self.annotations[frame_id].strip().split()
        x = float(ss[3])
        y = float(ss[7])
        z = float(ss[11])
        self.trueX, self.trueY, self.trueZ = x, y, z
        return np.sqrt(
            (x - x_prev) * (x - x_prev) + (y - y_prev) * (y - y_prev) + (
                    z - z_prev) * (z - z_prev))

    def processFirstFrame(self):
        self.px_ref = self.detector.detect(self.new_frame)
        self.px_ref = np.array([x.pt for x in self.px_ref], dtype=np.float32)

        print('First found features: ', len(self.px_ref))
        self.frame_stage = STAGE_SECOND_FRAME

    def processSecondFrame(self):
        self.px_ref, self.px_cur = featureTracking(self.last_frame,
                                                   self.new_frame, self.px_ref)
        E, mask = cv2.findEssentialMat(self.px_cur, self.px_ref,
                                       focal=self.focal, pp=self.pp,
                                       method=cv2.RANSAC, prob=0.999,
                                       threshold=1.0)
        _, self.cur_R, self.cur_t, mask = cv2.recoverPose(E, self.px_cur,
                                                          self.px_ref,
                                                          focal=self.focal,
                                                          pp=self.pp)
        self.frame_stage = STAGE_DEFAULT_FRAME
        self.px_ref = self.px_cur

    def processFrame(self, frame_id):
        self.px_ref, self.px_cur = featureTracking(self.last_frame,
                                                   self.new_frame, self.px_ref)
        if frame_id % 50 == 0:
            print(self.px_cur.shape)
        if len(self.px_cur) < 1000:
            print('Short on features: ', self.px_cur.shape)
            # self.frame_stage = STAGE_FIRST_FRAME

        E, mask = cv2.findEssentialMat(self.px_cur, self.px_ref,
                                       focal=self.focal, pp=self.pp,
                                       method=cv2.RANSAC, prob=0.999,
                                       threshold=1.0)
        _, R, t, mask = cv2.recoverPose(E, self.px_cur, self.px_ref,
                                        focal=self.focal, pp=self.pp)

        # TODO: write proper absoluteScale
        # absolute_scale = self.getAbsoluteScale(frame_id)
        absolute_scale = 10
        if absolute_scale > 0.1:
            self.cur_t = self.cur_t + absolute_scale * self.cur_R.dot(t)
            self.cur_R = R.dot(self.cur_R)
        if self.px_ref.shape[0] < kMinNumFeature:
            self.px_cur = self.detector.detect(self.new_frame)
            self.px_cur = np.array([x.pt for x in self.px_cur],
                                   dtype=np.float32)
        self.px_ref = self.px_cur

    def update(self, img, frame_id):
        # cv2.color
        img = cv2.cvtColor(img, cv2.COLOR_RGBA2GRAY)
        # cv2.imwrite('test.png', img)
        # cv2.imshow('Nice', img)
        # cv2.waitKey()

        # assert (img.ndim == 2 and img.shape[0] == self.cam.height and
        #         img.shape[1] == self.cam.width), "Frame: provided image has not the same size as the camera model or image is not grayscale"
        self.new_frame = img
        if self.frame_stage == STAGE_DEFAULT_FRAME:
            self.processFrame(frame_id)
        elif self.frame_stage == STAGE_SECOND_FRAME:
            print('Second!')
            self.processSecondFrame()
        elif self.frame_stage == STAGE_FIRST_FRAME:
            print('First!')
            self.processFirstFrame()
        self.last_frame = self.new_frame

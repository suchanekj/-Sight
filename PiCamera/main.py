# from picamera import PiCamera
from time import sleep
import cv2
import numpy as np
from matplotlib import pyplot as plt

img0 = cv2.imread('BEOl.png', 0)
cam = cv2.VideoCapture()
cam.open('camera/long.mp4')

_, image = cam.read()
plt.imshow(image)

for _ in range(50):
    cam.read()

_, image = cam.read()
plt.imshow(image)

# converting to gray scale
# gray = cv2.cvtColor(img0, cv2.COLOR_BGR2GRAY)

# # remove noise
# img = cv2.GaussianBlur(img0,(3,3),0)
#
# # convolute with proper kernels
# laplacian = cv2.Laplacian(img,cv2.CV_64F)
# sobelx = cv2.Sobel(img,cv2.CV_64F,1,0,ksize=5)  # x
# sobely = cv2.Sobel(img,cv2.CV_64F,0,1,ksize=5)  # y
#
# laplacian1 = cv2.adaptiveThreshold(laplacian,100,cv2.ADAPTIVE_THRESH_MEAN_C,
#             cv2.THRESH_BINARY,11,2)
# plt.subplot(2,2,1),plt.imshow(img, cmap='gray')
# plt.title('Original'), plt.xticks([]), plt.yticks([])
# plt.subplot(2,2,2),plt.imshow(laplacian1, cmap='gray')
# plt.title('Laplacian'), plt.xticks([]), plt.yticks([])
# plt.subplot(2,2,3),plt.imshow(sobelx, cmap='gray')
# plt.title('Sobel X'), plt.xticks([]), plt.yticks([])
# plt.subplot(2,2,4),plt.imshow(sobely, cmap='gray')
# plt.title('Sobel Y'), plt.xticks([]), plt.yticks([])


plt.show()
import cv2
import numpy as np

input_f = 'letter.data'

img_resize_factor = 12
start, end = 6, -1
height, width = 16, 8

with open(input_f, 'r') as f:
    for line in f.readlines():
        data = np.array([255*float(x) for x in line.split('\t')[start:end]])
        img = np.reshape(data, (height, width))
        img_scaled = cv2.resize(img, None, fx=img_resize_factor, fy=img_resize_factor)
        print(line)
        cv2.imshow('Img', img_scaled)
        
        c = cv2.waitKey()
        if c == 27:
            break

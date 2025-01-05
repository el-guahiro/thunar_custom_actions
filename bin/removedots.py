    import cv2
    import numpy as np
    import sys

    img = cv2.imread(sys.argv[1], 0)
    _, blackAndWhite = cv2.threshold(img, 127, 255, cv2.THRESH_BINARY_INV)


    nlabels, labels, stats, centroids = cv2.connectedComponentsWithStats(blackAndWhite, 4, cv2.CV_32S)
    sizes = stats[1:, -1] #get CC_STAT_AREA component
    img2 = np.zeros((labels.shape), np.uint8)

    for i in range(0, nlabels - 1):
        if sizes[i] >= 8:   #filter small dotted regions
            img2[labels == i + 1] = 255

    res = cv2.bitwise_not(img2)

    cv2.imwrite('res.jpg', res)
% [t1, t2] = getPoints();

t1 = load('cc1');

t2 = load('cc2');

H = computeH(t1.cc1, t2.cc2);

warpImage(imread('crop1.jpg'), imread('crop2.jpg'), H);

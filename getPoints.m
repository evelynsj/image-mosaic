function [t1, t2] = getPoints(img1, img2)
imshow(img1, 'InitialMagnification', 200);
[x1,y1] = ginput();
t1 = [x1 y1]';

imshow(img2, 'InitialMagnification', 200);
[x2,y2] = ginput();
t2 = [x2 y2]';
end

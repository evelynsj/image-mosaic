% t1=cc1;
% t2=cc2;
imshow('crop1.jpg');
[x1,y1] = ginput();
t1 = [x1 y1]';
% t1 = [x2 y1];

imshow('crop2.jpg');
[x2,y2] = ginput();
t2 = [x2 y2]';
% t2 = [x2 y2];
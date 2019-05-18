imshow('crop1.jpg');
[x,y] = ginput();
t1p = [x y]';
% t1p=cc1;
hold on;
plot(x,y,'r.', 'MarkerSize', 25);

n = size(t1p,2);
pts1 = t1p';
disp(pts1);
t2p = zeros(3,1);
% disp(t2p);
for i=1:n
    x = pts1(i,1);
    y = pts1(i,2);
    t2p(:,i) = H * [x y 1]';
    last = t2p(end,i); % value of the last row of each column
    scale = 1/last; 
%     disp(t2p(:,i));
    t2p(:,i) = t2p(:,i) * scale; % scales each column so that last row = 1
%     disp(last);
end   
% t2p(end,:) = []; %removes last row
disp(t2p);

figure;
imshow('crop2.jpg');
hold on;
plot(t2p(1,:),t2p(2,:),'r.', 'MarkerSize', 25);


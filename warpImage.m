function [warpIm, mergeIm] = warpImage(inputIm, refIm, H)
%% do forward warp for all four corners on input image

[r,c,~] = size(inputIm);
pts = [1 1; c 1; 1 r; c r]'; % four corners of input image

for i=1:size(pts,2)
    x = pts(1,i);
    y = pts(2,i);
    res = H * [x y 1]';
    scale = 1/res(end);
    res = res * scale;
    fwdWarp(:,i) = res(1:2,:);
end

% imshow(refIm)
% hold on;
% plot(fwdWarp(1,:), fwdWarp(2,:),'r.', 'MarkerSize', 25);

%% determine bounding box
[r,c,~] = size(refIm);
pts = [1 1; c 1; 1 r; c r]'; % four corners of ref image
x = [fwdWarp(1,:) pts(1,:)];
y = [fwdWarp(2,:) pts(2,:)];

% order: top-left, top-right, bottom-left, bottom-right
box_x = [min(x) max(x) min(x) max(x)];
box_y = [min(y) min(y) max(y) max(y)];

box = [box_x; box_y];

% imshow(refIm)
% hold on;
% plot(pts(1,:), pts(2,:),'r.', 'MarkerSize', 25);
% plot(box_x, box_y,'b.', 'MarkerSize', 25);

%% do inverse warp

%% get ref image pixel values in corresponding pixels

end


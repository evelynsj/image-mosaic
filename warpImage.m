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
% 
% imshow(refIm)
% hold on;
% plot(fwdWarp(1,:), fwdWarp(2,:),'r.', 'MarkerSize', 25);
% axis on 

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
% axis on

%% do inverse warp

% y = no. rows, x = no. cols

max_x = ceil(max(box_x));
min_x = ceil(min(box_x));
max_y = ceil(max(box_y));
min_y = ceil(min(box_y));

width = (max_x - min_x) + 1;
height = (max_y - min_y) + 1;

offset_x = min_x - 1;
offset_y = min_y - 1;

[X, Y] = meshgrid(1:width, 1:height);
X = X + offset_x;
Y = Y + offset_y;
box_pts = [X(:)'; Y(:)']; % Create homogeneous coordinates
box_pts(3,:) = 1;

invWarp = inv(H) * box_pts; % do inverse warp
invWarp = invWarp(1:2,:) ./ invWarp(3,:); % get the image coordinates

% Description from Piazza:
% interp2(V,X1,Y1)
% V = separated R,G,or B values of input image converted to double form
% X1, Y1 = points transformed by inverse homography matrix

x_pts = invWarp(1,:);
y_pts = invWarp(2,:);
inputImDouble = im2double(inputIm);
warpIm = zeros(height, width, 3);

for channel=1:3
    color = interp2(inputImDouble(:,:,channel), x_pts, y_pts);
    nan_idx = isnan(color);
    color(nan_idx) = 0;
    warpIm(:,:,channel) = reshape(color, height, width);
end

% imshow(warpIm)
% axis on;

%% get ref image pixel values in corresponding pixels
end


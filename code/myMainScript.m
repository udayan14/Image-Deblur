%% CS663 Digital Image Processing
%  
%
% This project has been done by:
% 
% * Udayan Joshi    150070018
% * Pranav Kulkarni 15D070017
% 


%% Blurring the image

image = imread('../data/barbara256.png');
%image = checkerboard;
[m ,n] = size(image);
figure('Name','Original Image');
imshow(mat2gray(image))

% sigma = 2.4495;
% blur_image = im2double(imgaussfilt(image,sigma));
% figure('Name','Blurred Image using convolution');
% imshow(mat2gray(blur_image))
% 
% c = 1;
% iter = 15;
% blur_image = blur_heat(im2double(image),c,iter);
% figure('Name',strcat('Heat Equation with c = ',int2str(c)));
% imshow(mat2gray(blur_image))

c = 1;
iter = 15;
blur_image = blur_heat_space_vary(im2double(image),c,iter);
figure('Name',strcat('Heat Equation space vary with c = ',int2str(c)));
imshow(mat2gray(blur_image))



%% Deblurring using shock filter
c = 1;
iter = 10 ;
output_shock = deblur_shock(blur_image,c,iter);
figure('Name',strcat('Shock Filter with c = ',int2str(c)));
imshow(mat2gray(output_shock))

%% Deblurring using reverse heat equation

c = 1;
beta = 0;
iter = 22;
output_reverse_heat = deblur_heat(blur_image,c,beta,iter);
% figure('Name',strcat('rhe c = ',int2str(c),', b = ',int2str(beta),', i= ',int2str(iter)));
% imshow(mat2gray(output_reverse_heat));

%% Deblurring using reverse mean shift

% patch_size = 14;
% hr = 5;
% iter = 8;
% output_reverse_mean = deblur_mean_shift(blur_image,patch_size,hr,iter);
% figure('Name',strcat('Reverse Mean Shift with hs = ',int2str(hs),'and hr = ',int2str(hr)));
% imshow(mat2gray(output_reverse_mean));

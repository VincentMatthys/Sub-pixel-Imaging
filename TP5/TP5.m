%% TP 5 : Imagerie sous-pixellique

% addpath('images/')    
addpath('../images/')
addpath('../iptools/')

%% Crop cameraman
u_cam = double(imread('crop_cameraman.pgm'));
imshow(u_cam, []);
% visualisation de sa transformée de Fourier
figure(); imshow(log(1 + abs(fftshift(fft2(u_cam)))), []);

%% Crop bouc
u_bouc = double(imread('crop_bouc.pgm'));
imshow(u_bouc, []);
% visualisation de sa transformée de Fourier
figure() ; imshow(log(1 + abs(fftshift(fft2(u_bouc)))), []);

%% Superposition des deux images : plus proche voisin et interpolation bicubique keys
v_bouc_1 = fzoom(u_bouc, 16, 0);
v_bouc_2 = fzoom(u_bouc, 16, -3);
imshow(v_bouc_1, []);
figure() ; imshow(v_bouc_2, []);

%% Visualisation de leur spectre en Fourier
imshow(log(1+abs(fftshift(fft2(v_bouc_1)))), []);
figure(); imshow(log(1+abs(fftshift(fft2(v_bouc_2)))), []);

%% Superposition des deux images : plus proche voisin et linéaire
v_bouc_1 = fzoom(u_bouc, 16, 0);
v_bouc_2 = fzoom(u_bouc, 16, 1);
imshow(v_bouc_1, []);
figure() ; imshow(v_bouc_2, []);

%% Visualisation de leur spectre en Fourier
imshow(log(1+abs(fftshift(fft2(v_bouc_1)))), []);
figure(); imshow(log(1+abs(fftshift(fft2(v_bouc_2)))), []);

%% Superposition des deux images : linéaire et spline 3
v_bouc_1 = fzoom(u_bouc, 16, 1);
v_bouc_2 = fzoom(u_bouc, 16, 3);
imshow(v_bouc_1, []);
figure() ; imshow(v_bouc_2, []);

%% Visualisation de leur spectre en Fourier
imshow(log(1+abs(fftshift(fft2(v_bouc_1)))), []);
figure(); imshow(log(1+abs(fftshift(fft2(v_bouc_2)))), []);

%% Superposition des deux images : spline 3 et spline 5
v_bouc_1 = fzoom(u_bouc, 16, 3);
v_bouc_2 = fzoom(u_bouc, 16, 5);
imshow(v_bouc_1, []);
figure() ; imshow(v_bouc_2, []);

%% Visualisation de leur spectre en Fourier
% imshow(log(1+abs(fftshift(fft2(v_bouc_1)))), []);
% figure(); imshow(log(1+abs(fftshift(fft2(v_bouc_2)))), []);

imshow(log(1+abs(fftshift(fft2(v_bouc_2)))), []);
figure() ; imshow(log(1+abs(fftshift(fft2(v_bouc_1)))), []);

% while(true)
%     imshow(log(1+abs(fftshift(fft2(v_bouc_2)))), []);
%     pause;
%     imshow(log(1+abs(fftshift(fft2(v_bouc_1)))), []);
%     pause;
% end;
% 

%% Superposition des deux images : splines
v_bouc_3 = fzoom(u_bouc, 16, 3);
v_bouc_5 = fzoom(u_bouc, 16, 5);
v_bouc_7 = fzoom(u_bouc, 16, 7);
v_bouc_9 = fzoom(u_bouc, 16, 9);
v_bouc_11 = fzoom(u_bouc, 16, 11);
imshow(v_bouc_3, []); title('3');
figure() ; imshow(v_bouc_5, []); title('5');
figure() ; imshow(v_bouc_7, []); title('7');
figure() ; imshow(v_bouc_9, []); title('9');
figure() ; imshow(v_bouc_11, []); title('11');

%% Superposition des spectres splines
imshow(v_bouc_3, []); title('3');
figure() ; imshow(log(1+abs(fftshift(fft2(v_bouc_3)))), []); title('5');
figure() ; imshow(log(1+abs(fftshift(fft2(v_bouc_5)))), []); title('7');
figure() ; imshow(log(1+abs(fftshift(fft2(v_bouc_7)))), []); title('9');
figure() ; imshow(log(1+abs(fftshift(fft2(v_bouc_9)))), []); title('11');

%% Partie avec le cameraman
%% Superposition des deux images : plus proche voisin et interpolation bicubique keys
v_came_1 = fzoom(u_cam, 16, 0);
v_came_2= fzoom(u_cam, 16, -3);
imshow(v_came_1, []);
figure() ; imshow(v_came_2, []);


%% Visualisation de leur spectre en Fourier
imshow(log(1+abs(fftshift(fft2(v_came_1)))), []);
figure(); imshow(log(1+abs(fftshift(fft2(v_came_2)))), []);

%% Superposition des deux images : plus proche voisin et linéaire
v_came_1 = fzoom(u_cam, 16, 0);
v_came_2 = fzoom(u_cam, 16, 1);
imshow(v_came_1, []);
figure() ; imshow(v_came_2, []);

%% Visualisation de leur spectre en Fourier
imshow(log(1+abs(fftshift(fft2(v_came_1)))), []);
figure(); imshow(log(1+abs(fftshift(fft2(v_came_2)))), []);

%% Superposition des deux images : linéaire et spline 3
v_came_1 = fzoom(u_cam, 16, 1);
v_came_2 = fzoom(u_cam, 16, 3);
imshow(v_came_1, []);
figure() ; imshow(v_came_2, []);

%% Visualisation de leur spectre en Fourier
imshow(log(1+abs(fftshift(fft2(v_came_1)))), []);
figure(); imshow(log(1+abs(fftshift(fft2(v_came_2)))), []);

%% Superposition des deux images : spline 3 et spline 5
v_came_1 = fzoom(u_cam, 16, 3);
v_came_2 = fzoom(u_cam, 16, 5);
imshow(v_came_1, []);
figure() ; imshow(v_came_2, []);

%% Superposition des deux images : splines
v_came_3 = fzoom(u_cam, 16, 3);
v_came_5 = fzoom(u_cam, 16, 5);
v_came_7 = fzoom(u_cam, 16, 7);
v_came_9 = fzoom(u_cam, 16, 9);
v_came_11 = fzoom(u_cam, 16, 11);
imshow(v_came_3, []); title('3');
figure() ; imshow(v_came_5, []); title('5');
figure() ; imshow(v_came_7, []); title('7');
figure() ; imshow(v_came_9, []); title('9');
figure() ; imshow(v_came_11, []); title('11');
%% Superposition des spectres splines
imshow(v_came_3, []); title('3');
figure() ; imshow(log(1+abs(fftshift(fft2(v_came_3)))), []); title('5');
figure() ; imshow(log(1+abs(fftshift(fft2(v_came_5)))), []); title('7');
figure() ; imshow(log(1+abs(fftshift(fft2(v_came_7)))), []); title('9');
figure() ; imshow(log(1+abs(fftshift(fft2(v_came_9)))), []); title('11');

%% Transformées de Fourier initiales
%% cameraman
cam = double(imread('cameraman.pgm'));
imshow(cam, []);
% visualisation de sa transformée de Fourier
figure(); imshow(log(1 + abs(fftshift(fft2(cam)))), []);

%% Crop bouc
bouc = double(imread('bouc.pgm'));
imshow(bouc, []);
% visualisation de sa transformée de Fourier
figure() ; imshow(log(1 + abs(fftshift(fft2(bouc)))), []);

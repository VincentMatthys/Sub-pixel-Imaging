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

while(true)
    imshow(log(1+abs(fftshift(fft2(v_bouc_2)))), []);
    pause;
    imshow(log(1+abs(fftshift(fft2(v_bouc_1)))), []);
    pause;
end;


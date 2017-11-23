addpath('../images/');
addpath('../iptools/');

% -------------------------------------------------------------------------
%% Exercice 19
% -------------------------------------------------------------------------
% Préparation de Lena
u = double(imread('lena.pgm'));
% Limitation à un disque
um = u.* contrast(distcenter(u,'n'),[0,0.8,0.85],[1,1,0])/255;

%% 35 rotations de 10 degrés par interpolation aux plus proches voisins
m(:,:,1) = um;
for i=1:35
m(:,:,i+1) = frot(m(:,:,i),10,0);
end
cmview(m);

%% 36 rotations de 10 degrés par interpolation aux plus proches voisins
v = um;
for i=1:36; v = frot(v,10, 0); end
flip2(um,v);

%% Spectre en Fourier :
figure() ; imshow(log(1+abs(fftshift(fft2(um)))), []);
title('Sectre 10x36 plus proches voisins');
figure() ; imshow(log(1+abs(fftshift(fft2(v)))), []);
title('Image initiale dans le disque');

%% 36 rotations de 10 degrés par interpolation spline 3
v3 = um;
for i=1:36; v3 = frot(v3,10, 3); end
flip2(um,v3);
%% Spectre en Fourier :
figure() ; imshow(log(1+abs(fftshift(fft2(v3)))), []);
title('Sectre 10x36 spline 3');
figure() ; imshow(log(1+abs(fftshift(fft2(um)))), []);
title('Image initiale dans le disque');

%% 36 rotations de 10 degrés par interpolation spline -3
v_3 = um;
for i=1:36; v_3 = frot(v_3,10, -3); end
flip2(um,v_3);
%% Spectre en Fourier :
figure() ; imshow(log(1+abs(fftshift(fft2(v_3)))), []);
title('Sectre 10x36 spline -3');
figure() ; imshow(log(1+abs(fftshift(fft2(um)))), []);
title('Image initiale dans le disque');

%% Comparaison entre les interpolations de spline 3 et bicubique en Fourier
figure() ; imshow(log(1+abs(fftshift(fft2(v_3)))), []);
title('Spectre 10x36 spline -3');
figure() ; imshow(log(1+abs(fftshift(fft2(v3)))), []);
title('Spectre 10x36 spline 3');

%% Mise en évidence de la différence :
figure() ; title('Valeur absolue de la différence par l''image de départ');
imshow([abs(um - v3), abs(um - v_3)]/255, []);

% %% 35 rotations de 10 degrés par interpolation spline 5
% v = um;
% for i=1:36; v = frot(v,10, 5); end
% flip2(um,v);
% 
% 
% %% 35 rotations de 10 degrés par interpolation spline 7
% v = um;
% for i=1:36; v = frot(v,10, 7); end
% flip2(um,v);

%% 35 rotations de 10 degrés par interpolation aux plus proches voisins
v_shannon = um;
for i=1:36; v_shannon = fftrot(v_shannon,10); end
flip2(um,v_shannon);

%% spectre de la rotation par interpolée de Shannon
figure() ; imshow(log(1+abs(fftshift(fft2(v_shannon)))), []);
title('Spectre interpolée de Shannon');
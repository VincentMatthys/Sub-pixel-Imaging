addpath('../images/')
addpath('../iptools/')

%% Exercice 7 : transformme de Fourier
u = double(imread('lena.pgm'));
f = fft2(u);
%% Tranformee de Fourier : partie reelle
imshow(f, 'InitialMagnification', 100);
axis on;
%% Module de la transformee de Fourier
imshow(abs(f), 'InitialMagnification', 100);
axis on;
%% Module de la transformee de Fourier, ramenee dans l'echelle
imshow(abs(f),[]);
axis on;
%%  
imshow(normsat(abs(f),1));
%%
imshow(normsat(fftshift(abs(f)),1));

%% Exercice 8 : Periodisation implicite de la transformee de Fourier discrete
u = double(imread('lena.pgm'));
imshow(u,[]);
v = fshift(u,-30,-30);
figure();imshow(v,[]);
v = fshift(u,-300,-300);
figure();imshow(v,[]);

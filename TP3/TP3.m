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
%% Visualistions efficaces :
% de la partie réelle
imshow(log(1 +abs(real(fftshift(f)))), [])
% de la partie imaginaire
imshow(log(1 +abs(imag(fftshift(f)))), [])
% de la phase
imshow(angle(fftshift(f)), [])
% du module
imshow(log(1 + abs(fftshift(f))), [])

% -------------------------------------------------------------------------
%% Exercice 8 : Periodisation implicite de la transformee de Fourier discrete
% -------------------------------------------------------------------------
u = double(imread('lena.pgm'));
imshow(u,[]);
v = fshift(u,-30,-30);
figure();imshow(v,[]);
% v = fshift(u,-300,-300);
% figure();imshow(v,[]);
%% Transformée de Fourier en module
% de u
imshow(log(1 + abs(fftshift(fft2(u)))), [])
% de v
figure ; imshow(log(1 + abs(fftshift(fft2(v)))), [])
%% Transformée de Fourier en phase
% de u
imshow(angle(fftshift(fft2(u))), [])
% de v
figure ; imshow(angle(fftshift(fft2(v))), [])

% -------------------------------------------------------------------------
%% Exercice 10 : Synthèse de microtextures
% -------------------------------------------------------------------------
a = double(imread('bouc.pgm'));
b = double(imread('baobab2.pgm'));
imshow(b, [])

[c,d] = exchange_phase(a, b);

imshow(d, []);
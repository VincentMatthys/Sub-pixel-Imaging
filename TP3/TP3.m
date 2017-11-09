addpath('images/')
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
imshow([u, v], []);
%% Transformée de Fourier en module
% de u
imshow(log(1 + abs(fftshift(fft2(u)))), [])
% de v
figure ; imshow(log(1 + abs(fftshift(fft2(v)))), [])
imshow([log(1 + abs(fftshift(fft2(u)))), log(1 + abs(fftshift(fft2(v))))], []);
%% Transformée de Fourier en phase
% de u
imshow(angle(fftshift(fft2(u))), [])
% de v
figure ; imshow(angle(fftshift(fft2(v))), [])
% imshow([angle(fftshift(fft2(u))), angle(fftshift(fft2(v)))], []);

% -------------------------------------------------------------------------
%% Exercice 10 : Synthèse de microtextures
% -------------------------------------------------------------------------
%% Question 1 : échange de phase
a = double(imread('room.pgm'));
b = double(imread('saturne.pgm'));
imshow(b, [])

[c,d] = exchange_phase(a, b);

imshow([a,b], []);
figure ; imshow([c,d], []);

%% Autre couple d'image pour échange de phase
a2 = double(imread('room.pgm'));
b2 = double(imread('lena.pgm'));
imshow(b, [])

[c2,d2] = exchange_phase(a2, b2);

imshow([a2,b2], []);
figure ; imshow([c2,d2], []);

%% Autre couple d'image pour échange de phase
a2 = imread('cameraman.jpg');
b2 = imread('47.gif');
imshow(b, [])

[c2,d2] = exchange_phase(a2, b2);

imshow([a2,b2], []);
figure ; imshow([c2,d2], []);

%% Question 2 : phase aléatoire
u = double(imread('lena.pgm'));
% imshow(u, []);
p = perdecomp(u);
r = randphase(p);
imshow([u, r], []);

%% Ecorce
e = double(imread('Bark.tiff'));
pe = perdecomp(e);
re = randphase(pe);
imshow([e, re], []);

%% Paille
e = double(imread('Straw.tiff'));
pe = perdecomp(e);
re = randphase(pe);
imshow([e, re], []);
%% Briques
e = double(imread('Brick_wall.tiff'));
pe = perdecomp(e);
re = randphase(pe);
imshow([e, re], []);
%% Bulles plastiques
e = double(imread('Plastic_bubbles.tiff'));
pe = perdecomp(e);
re = randphase(pe);
imshow([e, re], []);

%% Tissu écossais => marche bien
e = double(imread('Weave.tiff'));
pe = perdecomp(e);
re = randphase(pe);
imshow([e, re], []);

%% Sable
e = double(imread('Beach_sand.tiff'));
pe = perdecomp(e);
re = randphase(pe);
imshow([e, re], []);

%% Raffia
e = double(imread('raffia.tiff'));
pe = perdecomp(e);
re = randphase(pe);
imshow([e, re], []);
%% noise
e = double(imread('noise.png'));
pe = perdecomp(e);
re = randphase(pe);
imshow([e, re], []);
%% image de départ noise
e = double(imread('noise.png'));
% pe = perdecomp(e);
re = randphase(e);
imshow([e, re], []);

%% image de départ texture
e = double(imread('Weave.tiff'));
% pe = perdecomp(e);
re2 = randphase(e);
imshow([e, re2], []);
%% question 3
obj = double(imread('texture.pgm'));
fft_obj = log(1 + abs(fftshift(fft2(obj))));
% transformée de Fourier de l'objectif
figure; imshow(fft_obj, []);
% imshow(obj, []);

%%
n = 512; I = -n/2:-n/2+n-1;
[X,Y] = meshgrid(I,I);
R = sqrt(X.^2+Y.^2);
u = (R<30);
% imshow(u);


% transformée de fourier
% imshow(log(1 + abs(fftshift(fft2(u)))), [], 'XData', -256:255, 'YData', -256:255);

% image synthétisée
imshow([u, randphase(u)],[]);

%% Ellipse
n = 512; I = -n/2:-n/2+n-1;
[X,Y] = meshgrid(I,I);
a = 5;
b = 5;
theta = 0.02 * pi;
E =((X.*cos(theta) - Y.*sin(theta))./a).^2 + (X.*sin(theta) + Y.*cos(theta)./b).^2;
u = (E<30);
imshow(u);

%% transformée de fourier
imshow(log(1 + abs(fftshift(fft2(u)))), [], 'XData', -250:249, 'YData', -150:149);
%% image synthétisée
imshow([u, randphase(u)],[]);
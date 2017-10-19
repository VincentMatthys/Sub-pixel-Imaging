% exercice 4
%% Image initiale
u=double(imread('room.pgm'))/255;
imshow(u);


lambda=4;
v = u(1:lambda:end,1:lambda:end);
w = kron(v,ones(lambda));
[ny,nx] = size(u);
imshow([u,w(1:ny,1:nx)], 'InitialMagnification',100);
axis on
%% Pour trouver les coordonnees des pixels
ax(1) = subplot(1, 2, 1)
imshow(u, 'InitialMagnification', 100);
% daspect([1 1 1]);
axis on;
ax(2) = subplot(1, 2, 2)
imshow(w(1:ny,1:nx), 'InitialMagnification', 100);
% daspect([1 1 1]);
axis on;
linkaxes(ax);
%% Image onde
f = zeros(512);
f(190,50)=2;
onde = real(ifft2(f));
imshow(onde, [], 'InitialMagnification', 100)
%% module transformée de Fourier de l'onde
onde_fft = fftshift(fft2(onde));
imshow(abs(onde_fft),'XData', -256:255, 'YData', -256:255)
title('Module de la transformée')
axis on
%% Ajout des axes adaptes au domaine de Fourier
% quand la fenetre est impaire
f3 = zeros(513);
f3(190,50)=2;
onde3 = real(ifft2(f3));
% imshow(onde, [])
onde3_fft = fftshift(fft2(1 + onde3));
[X_len, Y_len] = size(onde3);
Xscale = (floor(X_len)/2):(X_len - floor(X_len/2));
imshow(abs(onde3_fft),'XData', -256:256, 'YData', -256:256)
title('Module de la transformée')
axis on
%% Onde downsamplee
% downsampling of factor 2
lambda=2;
onde_down = onde(1:lambda:end,1:lambda:end);
onde_w = kron(onde_down,ones(lambda));
[ny,nx] = size(onde);
imshow([onde,onde_w(1:ny,1:nx)], [], 'InitialMagnification',100);
title('Onde pure downsamplée')
%% Visualisation des deux transformees de Fourier
onde_down_fft=fftshift(fft2(onde_down));
subplot(211);
imshow(abs(onde_fft), 'XData', -256:256, 'YData', -256:256);
axis on;
subplot(212);
imshow(100 * log(1 + abs(onde_down_fft)), 'XData', -128:128, 'YData', -128:128);
axis on

%% Position des pics de la TF dans l'image downsamplee
f = abs(onde_down_fft);
[m, pos] = max(f(:));
[x, y] = ind2sub(size(f), pos);

% exercice 5
%% Question 1 : onde initiale
f = zeros(512);
f(140,50)=2;
onde = real(ifft2(f));
imshow(onde, []);
daspect([1 1 1]);
title('Onde pure originelle');
%% Onde au carre
imshow(onde.* onde, [])
daspect([1 1 1]);
title('Carré de l''intensité');
%% Fourier onde originelle
imshow(abs(fftshift(fft2(onde))));
%% Fourier onde au carre
imshow(abs(fftshift(fft2(onde.*onde))), []);

%% question 2
onde_zoom = fftzoom(onde, 2);
% size(onde_zoom)
% imshow(onde_zoom, []);
imshow(onde_zoom(1:256, 1:256), [], 'InitialMagnification', 100);
daspect([1 1 1]);
title('Onde pure avec fftzoom');
%% Question 2 onde au carre
onde_zoom_squared = onde_zoom.* onde_zoom;
imshow(onde_zoom_squared(1:256, 1:256), [], 'InitialMagnification', 100)
daspect([1 1 1])
title('Onde fftzoom au carre');
%% DFT d'onde fftzoom
fft_onde_zoom = abs(fftshift(fft2(onde_zoom)));
imshow(fft_onde_zoom(1:512, 1:512));
%% DFT d'onde carre fftzoom
imshow(100 * abs(fftshift(fft2(onde_zoom_squared))));

%% question 3 : nimes
nimes = double(imread('nimes.pgm'))/256;
imshow(nimes);
daspect([1 1 1]);
axis on;
%% Le gradient
grad = gradn(nimes);
imshow(grad, []);
daspect([1 1 1]);
axis on;
%% Les deux en meme temps
ax(1) = subplot(1, 2, 1)
imshow(nimes, []);
axis on;
daspect([1 1 1]);
ax(2) = subplot(1, 2, 2)
imshow(grad, []);
axis on;
daspect([1 1 1]);
linkaxes(ax);
%% tentative pour remedier a l'alising du gradient
nimes_zoom = fftzoom(nimes, 2);
% imshow(nimes_zoom, []);
grad_zoom = gradn(nimes_zoom);
ax(1) = subplot(1, 2, 1);
imshow(nimes_zoom, []);
axis on;
ax(2) = subplot(1, 2, 2);
imshow(grad_zoom, []);
axis on;
linkaxes(ax);
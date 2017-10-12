% exercice 4
%%
u=double(imread('room.pgm'))/255;
imshow(u);


lambda=2;
v = u(1:lambda:end,1:lambda:end);
w = kron(v,ones(lambda));
[ny,nx] = size(u);
imshow([u,w(1:ny,1:nx)]);

%%
f = zeros(512);
f(190,50)=2;
onde = real(ifft2(f));
imshow(onde, [])
%%
% module de sa transformée de Fourier
onde_fft = fftshift(fft2(onde));
imshow(abs(onde_fft),'XData', -256:256, 'YData', -256:256)
title('Module de la transformée')
axis on
% %%
% % quand la fenetre est impaire
% f3 = zeros(513);
% f3(190,50)=2;
% onde3 = real(ifft2(f3));
% % imshow(onde, [])
% onde3_fft = fftshift(fft2(1 + onde3));
% [X_len, Y_len] = size(onde3);
% Xscale = (floor(X_len)/2):(X_len - floor(X_len/2));
% imshow(abs(onde3_fft),'XData', floor(X_scale/2):(X_scale - floor(X_scale/2), 'YData', -256:256)
% title('Module de la transformée')
% axis on
%%
% downsampling of factor 2
lambda=2;
onde_down = onde(1:lambda:end,1:lambda:end);
onde_w = kron(onde_down,ones(lambda));
[ny,nx] = size(onde);
imshow([onde,onde_w(1:ny,1:nx)], []);
title('Onde pure downsamplée')
%%
onde_down_fft=fftshift(fft2(onde_down));
subplot(211);
imshow(abs(onde_fft), 'XData', -256:256, 'YData', -256:256);
axis on;
subplot(212);
imshow(abs(onde_down_fft), 'XData', -128:128, 'YData', -128:128);
axis on
%%
f = abs(fft2(onde_down));
[m, pos] = max(f(:));
[x, y] = ind2sub(size(f), pos);

% exercice 5
%%
% question 1
f = zeros(512);
f(140,50)=2;
onde = real(ifft2(f));
imshow(onde, []);
daspect([1 1 1]);
title('Onde pure originelle');
%%
imshow(onde.* onde, [])
daspect([1 1 1]);
title('Carré de l''intensité');

%%
% Fourier space
imshow(abs(fftshift(fft2(onde))));
%%
imshow(abs(fftshift(fft2(onde.*onde))), []);

%%
% question 2
onde_zoom = fftzoom(onde, 2);
% size(onde_zoom)
% imshow(onde_zoom, []);
imshow(onde_zoom(1:512, 1:512), []);
daspect([1 1 1]);
title('Onde pure originelle');
%%
onde_zoom_squared = onde_zoom.* onde_zoom;
imshow(onde_zoom_squared(1:512, 1:512), [])
daspect([1 1 1])
%%
% Fourier space
imshow(abs(fftshift(fft2(onde_zoom))));
%%
imshow(100 * abs(fftshift(fft2(onde_zoom_squared))));
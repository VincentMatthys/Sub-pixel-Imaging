%%
%Question 1
r=linspace(0,10,1000);
f=(2.*besselj(1,r)./r).^2;
figure('Name', 'Noyau de diffraction J1')
subplot(211)
plot(r, f);
title("Sans saturation");
subplot(212)
plot(r,min(f,0.1));
title("Saturé à 0.1");

%%
%Question 2
[X,Y]=meshgrid(linspace(-10,10,1000),linspace(-10,10,1000));
R=sqrt(X.^2+Y.^2);
M=(2.*besselj(1,R)./R).^2;
figure('Name', 'Tache d''Airy')
subplot(211)
imshow(M);
title('Sans saturation')
subplot(212), imshow(min(100 * M, ones(size(M))))
title('Avec saturation à 0.01')

%%
%Question 3
[X,Y]=meshgrid(linspace(-10,10,1000),linspace(-10,10,1000));
R=sqrt(X.^2+Y.^2);
M2=(acos(R)-R.*sqrt(1-min(R,1).^2)).*(R<=1);
figure('Name', 'Fonction de transfert de modulation')
subplot(211)
Q=linspace(-10, 10, 1000);
plot(Q(501:1000), M2(501, 501:1000))
title('Profil radial')
subplot(212)
imshow(M2, 'XData', [-10, 10], 'YData', [-10, 10]);
axis on
title('Image bidimensionnelle')
%%
[X3,Y3]=meshgrid(linspace(-10,10,1000),linspace(-10,10,1000));
R3=sqrt(X3.^2+Y3.^2);
M3=(2.*besselj(1,R3)./R3).^2;
%%
figure
DFT=log(abs(fftshift(fft2(M3))));
imshow(DFT)
title('Log DFT tache d''Airy')
% A=fftshift(fft2(M3));
% B=sqrt(A.*conj(A));
% imshow(B)

%%
%Question 6
[X6,Y6]=meshgrid(linspace(-10,10,1000),linspace(-10,10,1000));
R6=sqrt(X6.^2+Y6.^2);
M6=(2.*besselj(1,R6)./R6 - 2.*besselj(1, R6.*0.25)./(R6.*0.25)).^2;
figure('Name', 'Tache du telescope')
subplot(211)
imshow(M6);
title('Sans saturation')
subplot(212), imshow(min(100 * M6, ones(size(M))))
title('Avec saturation à 0.01')
%%
figure
DFT6=log(abs(fftshift(fft2(M6))));
figure('Name', 'Comparaison télescope et lunette')
subplot(211)
imshow(DFT)
title('FTM lunette')
subplot(212)
imshow(DFT6)
title('FTM télescope')
%% TP 4 : Imagerie sous-pixellique

% addpath('images/')
addpath('../images/')
addpath('../iptools/')

% -------------------------------------------------------------------------
%% Exercice 11
% -------------------------------------------------------------------------
u = double(imread('lena.pgm'));
[p, s] = perdecomp(u);
u_sym = fsym2(u);

% imshow(p, []);
% imshow(s, []);

%% Vérification de la décomposition
test = norm(p + s - u, 2);
fprintf('Différence en norme 2 : %d\n', test);
%% Différences u et p
% imshow(u - p, []); % c'est exactement s
% imshow([u, p], []); % on voit qu'on perd nettement en contraste sur les bords de la composante périodique
imshow(u, [1, 255]);
figure(); imshow(p, [1 255]);
% En alternant rapidement, on constate bien une différence dans le
% contraste sur les bords de l'image

%% Visualisation des versions périodisées de u, p, s et sym(u)
% figure();imshow(kron(ones(2,2),u),[ ]);
% figure();imshow(kron(ones(2,2),p),[ ]);
figure();imshow(kron(ones(2,2),s),[ ]);
% figure();imshow(u_sym, []);

%% Visualisation du module des transformées de Fourier et sym(u)
% figure(); imshow(log(1 + abs(fftshift(fft2(u)))), []);
% figure(); imshow(log(1 + abs(fftshift(fft2(p)))), []);
% figure(); imshow(log(1 + abs(fftshift(fft2(s)))), []);
% figure(); imshow(log(1 + abs(fftshift(fft2(u_sym)))), []);
% Spectre symétrisé pour u_sym, paire

%% Visualisation de la phase des transformées de Fourier et sym(u)
figure(); imshow(angle(fftshift(fft2(u))), []);
figure(); imshow(angle(fftshift(fft2(p))), []);
figure(); imshow(angle(fftshift(fft2(s))), []);
figure(); imshow(angle(fftshift(fft2(u_sym))), []); % paire

%% Translation d'un demi-pixel -> ne marche pas
% Nouvelle symétrisation sans recopier les bords
u_super_sym = [u,u(:,end-1:-1:1);u(end - 1:-1:1,:),u(end-1:-1:1,end-1:-1:1)];
% imshow(u_super_sym, []);
u_super_sym_fft = log(1 + abs(fftshift(fft2(u_super_sym))));
% imshow(u_super_sym_fft, []); % module de la tf super sym
% angle de la TF
angle_super_sym = angle(fftshift(fft2(u_super_sym)))
imshow(angle_super_sym, []);

%% Différences entre u et p dans le domaine initial
% on voit qu'on perd nettement en contraste sur les bords de la composante périodique
imshow([u, p], []); 

%% Différences entre u et p dans le domaine de Fourier
% En module
u_fft = log(1 + abs(fftshift(fft2(u))));
p_fft = log(1 + abs(fftshift(fft2(p))));
imshow([u_fft, p_fft], []);
% On perd essentiellement la croix, effet de la périodisation forcée
% En phase
imshow([angle(fftshift(fft2(u))), angle(fftshift(fft2(p)))], []);
% On perd encore essentiellement l'information de la croix


% -------------------------------------------------------------------------
% -------------------------------------------------------------------------
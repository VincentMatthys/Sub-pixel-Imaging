% ---------------------------  TP 8  --------------------------------------

% -------------------------------------------------------------------------
%% Exercice 25 :
% -------------------------------------------------------------------------
s = [3,2,0,1,4,0,4,1,0,2,3]/20;

%% Pour des signaux positifs => iteration = Gaussienne
title('t0 = s');
plot(s);
t = s;
for i=1:1:1:10
    t = conv(t, s);
    figure();
    plot(t);
    title('t');
end

%% Pour des signaux négatifs

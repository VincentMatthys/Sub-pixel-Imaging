% ---------------------------  TP 8  --------------------------------------

% -------------------------------------------------------------------------
%% Exercice 25 :
% -------------------------------------------------------------------------

%% Pour des signaux positifs cas 1 => iteration = Gaussienne
s = [3,2,0,1,4,0,4,1,0,2,3]/20;
title('t0 = s');
plot(s);
t = s;
for i=1:1:1:10
    t = conv(t, s);
    figure();
    plot(t);
    title('t');
end

%% Pour des signaux positifs cas 2 => iteration = Gaussienne
s_2 = [1,1,1,1,1,1,1,1,1,1,1]/11;
title('t0 = s_2');
plot(s_2);
t_2 = s_2;
for i=1:1:1:10
    t_2 = conv(t_2, s_2);
    figure();
    plot(t_2);
    title('t_2');
end

%% Pour des signaux négatifs - cas 1
s_neg = [3,2,0,1,-4,0,-4,1,0,2,3]/4;

plot(s_neg);
t_neg = s_neg;
for i=1:1:1:10
    t_neg = conv(t_neg, s_neg);
    figure();
    plot(t_neg);
    title('t_{neg}');
end


%% Pour des signaux négatifs - cas 2 : itération : gaussiennes +/-
s_neg_2 = -1 * [1,1,1,1,1,1,1,1,1,1,1]/11;

plot(s_neg_2);
t_neg_2 = s_neg_2;
for i=1:1:1:10
    t_neg_2 = conv(t_neg_2, s_neg_2);
    figure();
    plot(t_neg_2);
    title('t_{neg_2}');
end

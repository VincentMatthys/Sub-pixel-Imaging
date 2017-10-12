function [ v ] = gradn(u)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    u_sub = u(1:end -1, 1:end -1);
    u_bot = u(2:end, 1:end-1);
    u_right = u(1:end-1, 2:end);
    v = sqrt((u_bot - u_sub).*(u_bot - u_sub) + (u_bot - u_sub).*(u_bot - u_sub));
end


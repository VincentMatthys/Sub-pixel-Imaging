function [U,V] = exchange_phase(u,v)
%exchange_phase Exchange phase between two images

if size(u) ~= size(v)
    U = u;
    V = v;
else
    A = fft2(u);
    B = fft2(v);

    U = real(ifft2(exp(j*angle(A)).*abs(B)));
    V = real(ifft2(exp(j*angle(B)).*abs(A)));
end


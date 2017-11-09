function [U,V] = exchange_phase(u,v)
%exchange_phase Exchange phase between two images

A = fft2(u);
B = fft2(v);

U = real(ifft(exp(i*angle(B)).*abs(A)));
V = real(ifft(exp(i*angle(A)).*abs(B)));
end


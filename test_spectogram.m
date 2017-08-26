%%
N = 1024;
n = 0:N-1;

w0 = 2*pi/5;
x = sin(w0*n)+10*sin(2*w0*n);
%%
Nx=length(x);
nsc= floor(Nx/4.5);
nov=floor(nsc/2);
nff=max(256,2^nextpow2(nsc));

t= spectrogram(x, hamming(nsc),nov,nff);

spectrogram(x,'yaxis')

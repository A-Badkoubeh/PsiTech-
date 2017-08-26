% LOAD DATA
	%  load mtlb;
	 % x = mtlb;
%% Creat a simulated signal 

Fs=2500;  %sampling frequency 2.5KHz
T=1/Fs;   % Sampling Period 0.4msec
L=10000;   % Length of signal
t=(0:L-1)*T;   % Time vector

%S1=0.7*sin(2*pi*35*t)+ sin(2*pi*165*t)+.5*randn(size(t));
x=[10.0*sin(2*pi*35*t)+ 12.0*sin(2*pi*165*t)+4.7*t.*heaviside(t-0.4).*sin(2*pi*130*t)+20.7*heaviside(t-0.8).* chirp(t,100,max(t),400,'quadratic')+1*randn(size(t))]';

figure(1), clf
	  plot(10*t,x)
	  xlabel('n')
	  ylabel('x(n)')

%% SET PARAMETERS
	  R = 256;               % R: block length
	  window = hamming(R);   % window function of length R
	  N = 512;               % N: frequency discretization
	  L = 35;                % L: time lapse between blocks
	  fs = 7418;             % fs: sampling frequency
	  overlap = R - L;

	  % COMPUTE SPECTROGRAM
	  [B,f,t1] = specgram(x,N,fs,window,overlap);

	  % MAKE PLOT
	  figure(2), clf
	  imagesc(10*t,f,log10(abs(B)));
      %surf(t,f,log10(abs(B)));
	  colormap('jet')
	  axis xy 
	  xlabel('time')
	  ylabel('frequency')
	  title('SPECTROGRAM, R = 256')
% gch version

Fs  = 5e3; % sampling frequency
beep = 1/Fs:1/Fs:0.15; % 0.15s to simulate one touch-tone
t   = [0];
x   = [0];

for key = [" 5 1 4  2 5 4  6 0 1 1 "]
  x = [x, pressKey(key,t(end)+beep)];
  t = [t, t(end)+beep];
endfor

figure(1), clf
plot(t,x)


% Naive spectral analysis
[X,f]=didacticfft(x,t);
figure(2), clf
plot(f,real(X),'b-',f,imag(X),'r-');
legend('real part','imaginary part')
grid on


% Windowed spectral analysis
pkg load signal
windowWidth = 0.06; % window's width in second
N = 1 + round(windowWidth * Fs); % Nr of points in each fft
figure(3), clf
specgram(x, N, Fs)
daspect("auto")

% Clipped signal
lowerBound = -.3;
upperBound =  .3;
xClipped = min( max(x,lowerBound), upperBound );
figure(1),clf
plot(t,xClipped)
[XClipped,f] = didacticfft(xClipped,t);
figure(3), clf
plot(f,abs(X),'b-',f,abs(XClipped),'r-');
legend('original signal','clipped signal')
grid on

figure(4), clf
specgram(xClipped, N, Fs)
daspect("auto")



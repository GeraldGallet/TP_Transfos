%close all
clear all
pkg load signal


% Time settings
tI = 0;          % Init time
tE = 10;         % Ending time (acquisition stops just before tE)
N  = 32;         % nr. of points
Te = (tE-tI)/N;  % sampling period
Fe = 1/Te;       % sampling frequency
t = tI:Te:tE-Te; % last point: tEnd, is NOT in t

% Signal setting
lambda = .2;

x = exp(-lambda*t) .* heaviside(t);

[X,f]=didacticfft(x,t);



% Plot signal VS time
figure(1), clf, grid on, hold on
title('signal temporel')
plot(t,x,'b');

% Plot signal VS freq
figure(2), clf, grid on, hold on
title('spectres')
plot(f,real(X),'bo-',f,imag(X),'rs-');
legend('real','imag')

% Plot theoretical spectrum
nu = f(1)+[0:64*N-1]/64*Fe/N;    % 64 times faster
Xtheory = 1./(lambda+2*j*pi*nu);
plot(nu,real(Xtheory),'k',nu,imag(Xtheory),'g');
legend('real','imag','real theory','imag theory')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%
%%%%%%%                  QUESTION 3
%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Insight into sampling freq effect
%NN  = 2*N;           % new nr. of points
%TTe = (tE-tI)/NN;    % sampling period
%tt  = tI:TTe:tE-TTe; % idem
%
%xx = upsample(x,2);
%[XX,ff]=didacticfft(xx,tt);
%XX *= Te/TTe;        % compensation factor 
%
%figure(2), clf, grid on, hold on
%plot(ff,real(XX),'co-',ff,imag(XX),'ms-');
%plot(f,real(X),'bo-',f,imag(X),'rs-');
%plot(nu,real(Xtheory),'k',nu,imag(Xtheory),'g');
%legend('real upsampled','imag upsampled','real','imag','real theory','imag theory')




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%
%%%%%%%                  QUESTION 4
%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Insight into window size effect
%tEE = tI+128*(tE-tI); % multiply by 128
%tII = tI;
%NN  = 128*N;          % accordingly
%TTe = (tEE-tII)/NN;  % sampling period
%tt  = tII:TTe:tEE-TTe; 
%
%% Zero padding is automatically done by fft...
%[XX,ff]=didacticfft(x,tt);
%
%figure(2), clf, grid on, hold on
%plot(ff,real(XX),'c-',ff,imag(XX),'m-');
%plot(f,real(X),'bo-',f,imag(X),'rs-');
%plot(nu,real(Xtheory),'k',nu,imag(Xtheory),'g');
%legend('real padded','imag padded','real','imag','real theory','imag theory')
%




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%
%%%%%%%                  QUESTION 5
%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Modulation by a sine carrier
%f0 = .93;
%x = x .* exp(2*j*pi*f0*t);
%[X,f]=didacticfft(x,t);
%Xtheory = 1./(lambda+2*j*pi*(nu-f0));
%
%figure(1), clf, grid on, hold on
%plot(t,real(x),'b',t,imag(x),'r');
%legend('real','imag');
%
%figure(2), clf, grid on, hold on
%plot(f,real(X),'bo-',f,imag(X),'rs-');
%%Theoretical spectrum!
%plot(nu,real(Xtheory),'k',nu,imag(Xtheory),'g');
%legend('real','imag','real theory','imag theory')


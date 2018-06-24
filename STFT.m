% Title: Write a program for STFT and plot spectrogram.
% Aim: To learn STFT and Spectrogram.
% Programmer name: Ashish Ashok Gopal, 1702005, FY MTech
% Department: Department of Electronics Engineering
% Mentor: Dr. Nirmal, HOD
% Department: Department of Electronics Engineering
% Date: 27/09/2017

% ***************Program starts here*************************

% Frequency signals declarations
fs = 1000;  % Sampling frequency
f1 = 10;    % 10 Hz
f2 = 100;   % 50 Hz
f3 = 200;   % 100 Hz

% Signal duration declarations
ts = 1/fs;                          % Sampling period or signal duration
dt = 0:ts:2-ts;                     % Signal duration

% Amplitude [V] declarations
A = 10;     % in Volts
B = 20;     % in Volts
C = 30;     % in Volts

% Signal description
% Generating Signal I
X = A*sin(2*pi*f1*dt) + B*sin(2*pi*f2*dt) + C*sin(2*pi*f3*dt);

% Calculating STFT and plotting Spectrogram
Nx = length(X);                 % Length of the signal x
nsc = floor(Nx/4.5);            % Window length in integer
nov = floor(nsc/2);             % No. of overlapped samples
nfft = max(256,2^nextpow2(nsc)); % No. of DFT points

t = spectrogram(X,hamming(nsc),nov,nfft);       % Calculating STFT
% here hamming(nsc) provides window of length nsc
% this instruction uses nfft sampling points to calculate the discrete Fourier transform

figure('Name','Spectrogram of Signal X');
spectrogram(X,hamming(nsc),nov,nfft,'yaxis');   % Plotting Spectrogram 
axis tight;
% view(0, );

% Calculating FFT of signal X
nfftX = length(X);
nfftX1 = 2^nextpow2(nfftX);
Y = fft(X,nfftX1);     
xY = fs*(0:nfftX1/2-1)/nfftX1;
Y1 = Y(1:nfftX1/2);

% Plotting Signal X in time domain and frequency domain
figure('Name','FFT of Signal X');
subplot(2,1,1);
plot(dt,abs(X),'r');
axis tight;
xlabel("Time [S]");
ylabel("Amplitude [V]");
title("Signal X in Time Domain");
subplot(2,1,2);
plot(xY, abs(Y1),'r');
axis tight;
xlabel("Frequency [Hz]");
ylabel("Magnitude");
title("FFT of Signal X");

% ***************Program ends here*************************
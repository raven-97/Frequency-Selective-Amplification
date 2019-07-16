[y1,Fs] = audioread('replaceME.mp3');       % replace replaceME.mp3 with the name of your audio file
y1 = y1(:, 1);
% Breaking points for frequencies
o1 = 2 * 2000 / Fs;
o2 = 2 * 4000 /Fs;
o3 = 2 * 8000 / Fs; 
o4 = 2 * 12000 / Fs; 
o5 = 2 * 16000 / Fs; 
o6 = 2 * 20000 / Fs; 
o7 = 2 * 22000 / Fs; 
o8 = 2 * 22000 / Fs; 
y2 = denoise(y1);
b = firls(10, [0 o1 o2 o3 o4 o5 o6 o7 o8 1], [4 4 3 3 2.5 2.5 3 0.5 0.25 0.25]);
fvtool(b,1,'OverlayedAnalysis','phase')

freqz(b, 1, 2048, Fs)                                   % Filter Bode Plot
y3 = filtfilt(b, 1, y1);                                % The ‘filtfilt’ Function Is Phase Neutral
soundsc(y3, Fs);


Length_audio=length(y1);
df=Fs/Length_audio;
frequency_audio=-Fs/2:df:Fs/2-df;
figure
FFT_audio_in=fftshift(fft(y1))/length(fft(y1));
subplot(2,1,1);
plot(frequency_audio,abs(y1));
title('FFT of Original Signal y1');
xlabel('Frequency(Hz)');
ylabel('Amplitude');

FFT_audio_out=fftshift(fft(y3))/length(fft(y3));
subplot(2,1,2);
plot(frequency_audio,abs(y3));
title('FFT of Adjusted Signal y3');
xlabel('Frequency(Hz)');
ylabel('Amplitude');












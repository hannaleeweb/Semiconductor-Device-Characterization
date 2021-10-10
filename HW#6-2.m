% HW # 6-2
% Sound Editing
% Extract first 'Alleluia' and final 'Alleluia' from 'handel'.
% Concatenate them to forge a new voice.
% Play the sound and plot the waveform

load handel; % y (signal), Fs (sampling frequency)

% [y Fs] = wavread ('handel.wav');

plot(y);

soundsc(y,Fs) % play the sound


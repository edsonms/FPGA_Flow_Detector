clc;
clear;

N=256;

set(0, 'DefaultAxesFontSize', 16);
x=csvread('/Users/edson/Documents/MATLAB/Sensor_MATLAB/Analise Dados/0/SAMPLES.CSV',0,1);
x=x-mean(x);

[L,R] = size(x);

y=fft(x(1:256),N);

y2 = csvread('fft_output.CSV');
y2 = y2./32767;
y2 = y2.*(max(x)*100);
y2_real=y2(:,1);
y2_imag=y2(:,2);
y2=complex(y2_real,y2_imag);
dif=y-y2;
plot(1:1:length(dif),dif);

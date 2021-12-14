clear
clc
close

time = linspace(0,49,100);
x_r = zeros(100,1);
%Vitesse constante égale à 1
y_r = linspace(-10,89,100);
x_time = timeseries(x_r,time);
y_time = timeseries(y_r,time);
save('x2_input.mat', 'x_time', '-v7.3')
save('y2_input.mat', 'y_time', '-v7.3')
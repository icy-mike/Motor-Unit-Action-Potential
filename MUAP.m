clear all
close all
%constants
t = 0:0.01:15; %ms
a = 0.01; %cm
b = 0.1; %cm
x_0 = 3; %cm
I_1 = 0.2; %mA*cm
I_2 = 0.14; %mA*cm
sigma = 1/3.6; %mho*cm
phi = 0.410; %cm/ms

x = x_0-(phi*t);
r = sqrt(x.^2+b.^2);
theta = atan(b./x)+pi/2; %rad

x1 = (x_0+b)-(phi*t);
r1 = sqrt(x1.^2+b.^2);
theta1 = atan(b./x1)+pi/2

Vdepol = I_1/(4*pi*sigma) * (cos(theta)./r.^2);
Vrepol = I_2/(4*pi*sigma) * (cos(theta1)./r1.^2);

figure()
plot(t,-Vdepol)
title('Single dipole model')
ylabel('Millivolts (mV)')
xlabel('Time (ms)')
figure()
plot(t,-Vdepol+Vrepol)
title('Two dipole model')
ylabel('Millivolts (mV)')
xlabel('Time (ms)')

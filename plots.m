clear
s = tf('s');
%% Gp
R = 991;
L = 33*10^-3;
C = 47*10^-9;
Gp = R/(L*R*C*s*s+L*s+R)
R1 = 21000;
R2 = 5800;
C1 = 1*10^-9;
Gclead = ((20*(1+s*C1*R1))/(1+((s*R1*R2*C1)/(R1+R2))))
figure()
subplot(1,2,1)
rlocus(Gp)
grid on
title('Root locus of uncompensated system')
subplot(1,2,2)
rlocus(Gclead*Gp);
grid on
title('Root locus of compensated system')
figure()
subplot(1,2,1)
nyquist(Gp)
grid on
title('Nyquist plot of uncompensated system')
subplot(1,2,2)
nyquist(Gclead*Gp)
grid on
title('Nyquist plot of compensated system')
figure()
bode(Gp,'r',Gclead*Gp,'b')
grid on
legend('Uncompensated','Compensated')
figure()
step(feedback(Gp,1),'r'); hold on
step(feedback(Gp*Gclead,1),'b');
legend('Uncompensated','Compensated')
grid on
hold off
clear
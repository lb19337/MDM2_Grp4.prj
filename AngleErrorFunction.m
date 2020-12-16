function [] = AngleErrorFunction(initTheta)

syms x
theta = ((initTheta)*exp(-x*(1/(initTheta))))*cos((pi*x)/(initTheta));
fplot(theta,'color','m')
xlim([0 (initTheta*4)])
ylim([(-initTheta*1.5) (initTheta*1.5)])
ylabel('Phi in Degrees') 
xlabel('Time(s)') 
grid on
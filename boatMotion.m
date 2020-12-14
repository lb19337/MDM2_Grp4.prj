function [] = boatMotion(alpha,alphaComp,h,a,p,v,m,r)

theta00 = ((h*a*p*(v^2)*(2^(1/2))/(2*m*r))*((cos(alpha)-(cos(alpha))^3)/(cos(alpha)+(2^(1/2))-1)));
theta00Comp = ((h*a*p*(v^2)*(2^(1/2))/(2*m*r))*((cos(alphaComp)-(cos(alphaComp))^3)/(cos(alphaComp)+(2^(1/2))-1)));
syms x
y1 = theta00*(x^2);
y2 = theta00Comp*(x^2);

fplot(y1,'color','m')
hold on
fplot (y2,'color', 'b')
xlim([0 20])
ylim([0 20])
ylabel('Theta in Degrees') 
xlabel('Time(s)') 
hold off

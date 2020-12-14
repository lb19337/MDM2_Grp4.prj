function [alphaMax] = rudderAngle(h,a,p,v,m,r,thetaOO,t0,t1)
% h - rudder height
% a - rudder length
% p - fluid density
% v - velocity of boat
% alpha - angle of rudder
% m - mass of boat
% r - distance from rudder to centre of rotation
% thetaOO - angular acceleration of boat
k = (2*m*r*thetaOO)/(h*a*p*(v^2)*(2^(1/2)));
% 0 = z^3 + z*(k-1)+ k*(2*(1/2)-1));  <--- our equation where z=cos(alpha)
p = [1 0 (k-1) k*(2*(1/2)-1)];
alphaRoots = roots(p);
correctedAlphaRoots = alphaRoots(alphaRoots>=(1/(2^(1/2))) & alphaRoots<1);
if isempty(correctedAlphaRoots)
    correctedAlphaRoots = [(1/(2^(1/2)))];
end
alphaMax = (acos(correctedAlphaRoots))*(360/(2*pi));
%------------Second Equation--------------
A = alphaMax/(t0^2);
t2 = t0 + t1;

% Piecewise equations:
% y = A*(t^2)
% y = alphaMax
% y = A*((t - t2)^2)

%b=(0.2636+(20^2))/20;
syms t
y = piecewise(0<=t & t<=t0,A*(t^2), t0<t & t<=t1, alphaMax, t1<t & t<=t2 ,A*((t - t2)^2), t2<t, 0);
fplot(y,'color','m')
xlim([0,(t2+(0.1*t2))])
ylim([0 (alphaMax+(0.1*alphaMax))])
ylabel('alpha in Degrees') 
xlabel('Time(s)') 
grid on


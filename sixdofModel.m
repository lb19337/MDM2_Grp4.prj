function [MRB] = sixdofModel()

% Force:
% X = m(u-v*r+w*q);
% Y = m(v-w*p+u*r);
% Z = m(w-u*q+v*p);
% Moment:
% K = Ix*p + (Iz-Iy)*qr;
% M = Iy*q +(Ix-Iz)*rp;
% N = Iz*r +(Iy-Ix)*pq;
r_g = [10 0 1]';
nu = [10 0 1 0 0 1]';
I_g = 10000*eye(3);
m = 1000;

MRB = [m*eye(3)     -m*Smtrx(r_g) 
       m*Smtrx(r_g)    I_g];
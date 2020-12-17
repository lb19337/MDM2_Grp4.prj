%rigid-body sysytem inertia matrix (r.g = CoGrav rel to Corotation = 0 vec)

% MRB = system inertia = [m*eye(3) -m*Smtrx(r.g)
%                           m*Smtrx(r.g) I.g]
% m = mass = 1000, I.g = inertia tensor
m = 1000;

MRB = [m*eye(3) zeros(3,3)
        zeros(3,3) 10000*eye(3)];
    
%rigid-body Coriolis and centripetal matrix. nu is velocity vector. CRB =
%Coriolis vector term

nu = [10 1 1 1 2 3]'

CRB = m2c(MRB,nu)

% Asigning physical specification
param.g = 9.8;  % gravity
param.l = 1;    % pendulum length
param.m = 1;    % pendulum mass
param.b = 0.25; % damp ratio

% Initial position q0 = [q dq]
q0 = [pi/8 0];
tbegin = 0;
tfinal = 30;

% ODE solving
[T,Q] = ode45(@(t,Q)Pendulum(t, Q, param), [tbegin, tfinal], q0);

PendulumSimulation(T, Q, param)

% Equation of motion ****************
function dQ = Pendulum(t, Q, param)
    % State Q = [q dq]
    % States output dQ = [dq ddq]
    dQ = zeros(2,1);
    dQ(1) = Q(2);
    dQ(2) = -param.g/param.l*sin(Q(1)) - (param.b*Q(2))/param.m;
end

%Labb3

%Exercise 2.2

f = @(x) [(x(1) +3)*(x(2)^3 - 7) + 18 ; sin(x(2)*exp(x(1)) -1)];
Jf = @(x) [ (x(2)^3 -7) , (3*x(1) +9)*x(2)^2 ; x(2)*exp(x(1))*cos(x(2)*exp(x(1)) -1) , exp(x(1))*cos(x(2)*exp(x(1)) -1)];
x0 = [-0.5, 1.4]';
EqSolveNewton(f, Jf, x0);

%Exercise 3.1
Pe = [23 6 0]';
P0 = [0 0 0]';
[solv, k] = EqSolveNewton( @(x) FindFinalPosition(P0, x) - Pe, @(x) BallJacobian(P0, x), [28, 5, 6]');
disp(solv); disp(k); FindFinalPosition(P0, solv)

%Exercise 3.2
v0 = [28, 5, 6]'; 
[solv, k] = EqSolveNewton( @(x) FindFinalPosition(P0, x) - Pe, @(x) BallJacobian(P0, x), v0);
disp(solv); disp(k); FindFinalPosition(P0, solv)

%Exercise 4.2

FitCircle();
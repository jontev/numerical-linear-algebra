%EqSolveNewton: Solve nonlinear system of equations f(x)=0 using the 
% Newton method. 
%
% Usage:
%   >> [ Xk , k ] = EqSolveNewton( f , Jf , X0  )
%
% where f(x) is the function, Jf is the Jacobian function, and 
% X0 is the starting approximation.
%
%
function [ xk , k ] = EqSolveNewton( f , Jf , x0  )
       % f = @(x) [(x(1) +3)*(x(2)^3 - 7) + 18 ; sin(x(2)*exp(x(1)) -1)];
       %Jf = @(x) [ (x(2)^3 -7) , (3*x(1) +9)*x(2)^2 ; x(2)*exp(x(1))*cos(x(2)*exp(x(1)) -1) , exp(x(1))*cos(x(2)*exp(x(1)) -1)];
       %x0 = [-0.5, 1.4]';
   tol=10^-10;
      
   k = 0; %Iteration number
   sk = 1; % Step size
   xk = x0;
   
   %residuals = []; %Collect errors
   %optimum = [0, 1]'; %Optimal solution, for computing the errors
   optimum = [2.7841e+01
   4.3830e+00
   6.8630e+00];
   B = eye(3); %Initial Jacobian approximation
   residuals = [];
   while norm( sk )>tol
       %
       % Evaluate function f(Xk), Jacobian Jf(Xk), and compute
       % the next Newton step Sk. Use feval() to evaluate functions.
       %
       xold = xk;
       %sk = - Jf(xk) \ f(xk); %Solves Jf(xk)*sk = -f(xk), the step
       sk = - B \ f(xk);
       xk = xk + sk; %Take step
       
       k = k + 1;
       residuals(k) = norm(optimum - xk);
       
%        p = xk - xold;
%        q = f(xk) - f(xold);
%        tau = q'*B*q;
%        v = p/(p'*q) - (B*q)/tau;
%        B = B + (p*p')/(p'*q) - (B*(q*q')*B)/(q'*B*q) + 1*tau*(v*v');
       B = B + (1/(sk'*sk))*((f(xk) - f(xold) - B*sk))*sk';
   end
   % [solv, k] = EqSolveNewton( @(x) FindFinalPosition(P0, x) - Pe, @(x) BallJacobian(P0, x), [20, 2, 5]')
   disp(residuals)
   disp(sk);
   end

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
      
   tol=10^-10;
      
   k = 0; %Iteration number
   sk = 1; % Step size
   xk = x0;
   
   residuals = [];
   %optimum = [0 1]';
   B = eye(length(x0));
   xold = zeros(size(x0));
   while norm( sk )>tol
       %
       % Evaluate function f(Xk), Jacobian Jf(Xk), and compute
       % the next Newton step Sk. Use feval() to evaluate functions.
       %
       
       %sk = - Jf(xk) \ f(xk); %Solves Jf(xk)*sk = -f(xk), the step
       sk = - B \ f(xk); %Broydens method
       
       xold = xk;
       xk = xk + sk; %Take step
       
       B = B + ( f(xk)-f(xold) - B*sk)*sk'/norm(sk);
       
       k = k + 1;
       
       
       %residuals(k+1) = norm(xk - optimum);
       
       
      
       
       
       
   end
   %disp(residuals)
   
   end

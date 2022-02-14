%EigPower: Compute the largest eigenvalue of a matrix A using the
% power method. Perform N iterations using x0 as a starting vector.
%
% Usage:
%
%   >>[x,rho]=EigPower(A,x0,N);
%
% where rho is the computed eigenvalue (Rayliegh quotient) and x is
% the approximate eigenvector. 
%
function [x,rho]=EigPower(A,x0,N); 
  
  % Normalize the starting vector

    q=x0/norm(x0);
    rho = 0;
    A_rho = 0;
    B = inv((A - 4*eye(length(A))) );
    
 for k=1:N
   
   %
   % Perform one step of the power method. When doing
   % inverse iteration you need to use a matrix 
   % inv(A-s*I) instead of A. 
   %
   % Note that for inverse iteration we compute the eigenvalues
   % of inv(A-s*I) and not of A. So the computation of the
   % Rayleigh quitient needs to change accordingly.
   % 
    rho_old = rho;
    A_rho_old = A_rho;
    
    
    w=B*q; %B för inverseshift, A för vanliga powermethod
    rho=q'*w;
    q=w/norm(w);
    
    A_rho = (1/rho) + 4;
    disp(abs(A_rho-3.964906355385796)/abs(A_rho_old -3.964906355385796));
    
   
  
 end;
 
 % Return the eigenvector as x.
 x=q;
  

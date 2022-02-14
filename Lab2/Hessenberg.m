%Hessenberg: Transform a square matrix B into Hessenberg form using
% Householder reflections. 
%
% Usage:
%   >> H = Hessenberg(B);
%
function [B]=Hessenberg(B);
  
  [N,M]=size(B);
  HB = B;
  for k=1:N-1
    %
    % Select a Householder reflection such that H*B(k+1:N,1)=alpha*e1. 
    % This Householder reflection needs to be applied from the left
    % and from the right to the appropriate part of the matrix B.
    %
    %
    % Note: Even though the ApplyReflection subrouting is written to
    % apply the reflection from the left its possible to use the same
    % subroutine to apply the reflection from the right. How?
    %
    
    %Från vänster H*A
    %Från höger A*H^-1 = AH^T = (HA^T)^T
    %dvs tillämpa en ny householder med samma subroutine
    %från vänster på A^T, H*(A^T) och ta transponatet av resultatet
    %1) HA = H*A;
    HB((1+k):end, 1:end) = ApplyReflection(B((1+k):end, 1:end), B((1+k):end, k));
    %2) HAH^T = (H*(HA'))'
    HB = HB';
    HB((1+k):end, 1:end) = ApplyReflection(HB((1+k):end, 1:end), HB((1+k):end,k));
    HB = HB';

    B = HB;
  end;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% LOCAL SUBROUTINES 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
%ApplyReflection: Compute the product H*A where H is a 
% Householder reflection matrix such that H*x=norm(x)*e1.
%
function [HA]=ApplyReflection(A,x);
  
% 
% Find the vector v so that H(v)*x=alpha*e1. 
%
  
    
%
% Apply the reflection H to all the columns A(:,k) one at a time.
%
 
    [r, c] = size(A); 
    disp(x); disp(size(x));
    v = x; v(1) = v(1) + sign(x(1))*norm(x);
    H = eye(r) - 2*(v*v')/(v'*v);
    HA = zeros(r,c);
    for i=1:c
      
        HA(:,i) = H*A(:,i);
    end

A = [2 -1 0 0 0 0; -1 3 -1 0 0 0; 0 -1 4 -1 0 0; 0 0 -1 5 -1 0; 0 0 0 -1 6 -1; 0 0 0 0 -1 7]

%Labb2

%Exercise 2.1
eigenvalues = eig(A);
eigenvalues = sort(eigenvalues,'desc')

%Exercise 2.2
x = [1 1 1 1 1 1]';
q = x/norm(x);
for i=1:30
   w = A*q; 
   rho = q'*w; %Rayleigh quotient
   q = w/norm(w);
   x = x/norm(x);
end
lambda = eigenvalues(1)
x = [1 1 1 1 1 1]';
q = x/norm(x);
rayleighs = zeros(3,1);
oldrho = 0;
for i=1:30
   w = A*q; 
   rho = q'*w; %Rayleigh quotient
   if i==3 || i==4 || i == 5
       rayleighs(i-2) = abs(rho - lambda)/abs(oldrho-lambda);
   end
   oldrho=rho;
   q = w/norm(w);
   x = x/norm(x);
end

%Exercise 2.3
B = inv((A-4*eye(size(A))))
x = [1 1 1 1 1 1]';
q = x/norm(x);
for i=1:30
   w = B*q; 
   rho = q'*w; 
   q = w/norm(w);
   x = x/norm(x);
end
%eigenvalue for B
mu = rho;
%corresponding eigenvalue for A
lambda = 1/mu +4;
%real eigenvalue of A
eigenvalues(4)

x = [1 1 1 1 1 1]';
q = x/norm(x);
rayleighs = zeros(3,1);
oldrhoA = 0;
for i=1:3
   w = B*q; 
   rho = q'*w; 
   rhoA = 1/rho +4;
   rayleighs(i) = abs(rhoA - lambda)/abs(oldrhoA-lambda);
   
   oldrho=rho;
   q = w/norm(w);
   x = x/norm(x);
end


%Exercise 3.1
B = [1 2 3 4; 2 2 -1 -4; 3 -1 3 1; 4 -4 1 4];
N = 10;
B1 = B;
for k=1:N
    [Q,R] = qr(B1);
    B1 = R*Q;
end

qrEigs = sort(diag(B1), 'desc');
actualEigs = sort(eigs(B), 'desc');

%Exercise 3.2
N = 3;
B1 = B;
for k=1:N
    s = B1(4,4);
    B1 = B1 -s*eye(4); 
    [Q,R] = qr(B1);
    B1 = R*Q  + s*eye(4);
end
shiftEigs = sort(diag(B1), 'desc');
abs(B1(4,4) - actualEigs(2))
eig(B1(1:3,1:3)); %same as remaining eigenvalues

%Exercise 3.3
H = Householder(B);
eig(H);

%Exercise 3.5
HessEigQR(B);

%Exercise 4.2
A = [10 -35 50 -24; 1 0 0 0; 0 1 0 0; 0 0 1 0];
roots = eig(A);

%Exercise 5.1
A = [1/3 0 1/3 0 1/2 0; 1/3 0 1/3 0 0 0; 0 1 0 1/2 0 1/3; 0 0 1/3 0 0 1/3; 1/3 0 0 0 0 1/3; 0 0 0 1/2 1/2 0];
















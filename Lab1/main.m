%Labb1

%Exercise 2.3
A = [2 -5 3; -1 8 5; 4 -1 7; -1 3 2];
b = [3; 5; -2; 4];
HouseholderQR(A)

%Exercise 2.4
[Q,R] = qr(A)
HouseholderQR(A)
%samma R-matris


%Exercise 2.5
C = HouseholderQR( [A,b]);
R = C(1:3, 1:3);
Qb = C(1:3, 4);
x = R\Qb;
C(4,4)
norm(A*x-b)

%Exercise 3.3
R = HouseholderQR( [A,b]);
R = R(1:3,:);
x = R(:,1:3)\R(:,4)
%adding measurement
R = [R ; 1 2 6 5];
R = QRUpdate(R); 
R=R(1:3,:); 
x = R(:,1:3)\R(:,4);

%Exercise 4.2
CometTracking()
%did plots in commandline


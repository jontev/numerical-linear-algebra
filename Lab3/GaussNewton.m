
function [ u ] = GaussNewton( f , Jf , u0 );

   tol=10^-10;
   k=0;
   uk = u0;
   sk = 1;
   while norm(sk) > tol
        k=k+1;
        sk = (Jf(uk)*Jf(uk)' + 10*eye(3)) \ (Jf(uk)*f(uk));
        uk = uk - sk;
   end

fprintf(1,'After k=%i steps we have norm(Sk)=%7.2e.\n',k,norm(sk));
u=uk;
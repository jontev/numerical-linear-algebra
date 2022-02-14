P0 = [0 0 0]';
Pe = [23;6;0];

kBest = 8;
for x=10:40
    disp(x);
   for y=2:40
       disp(y);
      for z=2:40
         [v, k] = EqSolveNewton( @(x) FindFinalPosition(P0, x) - Pe, @(x) BallJacobian(P0, x), [x, y, z]');
         if k <= kBest
             disp([x,y,z]);
         end
         
      end
       
   end
end



function [] = FitCircle()

   %x,y coordinates of center, r radius, m simulated samples
   [X, Y] = CircleData([8 11], 7, 200, 0.5);
    
   ri = @(x,y,u) sqrt( (u(1) - x)^2 + (u(2) - y)^2) - u(3);
   grad_ri = @(x,y,u) [(u(1) - x)/(sqrt((u(1) - x)^2 + (u(2) - y)^2)) ;(u(2) - y)/(sqrt((u(1) - x)^2 + (u(2) - y)^2)); -1];

   r_cell = cell(length(X), 1);
   for i=1:length(X)
       r_cell{i} = @(u) ri(X(i), Y(i), u);
   end
   r = @(u) cellfun(@(f) f(u), r_cell);
   
   grad_r_cell = cell(1, length(X));
   for i =1:length(X)
       grad_r_cell{i} = @(u) grad_ri(X(i), Y(i), u);
   end
   grad_r = @(u) cell2mat(cellfun(@(f) f(u), grad_r_cell, 'UniformOutput', false));
   
   u0 = [100,-10, 3]';
   u_star = GaussNewton(r, grad_r, u0);
   disp(u_star);

   viscircles([u_star(1), u_star(2)], u_star(3));
   hold on
   scatter(X,Y);
   title('Fitted circle with Gauss-Newton, center=[8,11], radius=7')
end

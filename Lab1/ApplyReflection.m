function [ product ] = ApplyReflection (A)

    [r, c] = size(A); 
    
    a1 = A(:,1);
    
    v = a1; v(1) = v(1) + sign(a1(1))*norm(a1);
    
    %H = eye(r) - 2*(v*v')/(v'*v);
    
    product = zeros(r,c);
    for i=1:c
        %product(:,i) = H*A(:,i);
        product(:,i) = (A(:,i) - 2/(v'*v)*(v*(v'*A(:,i))));
    end
    
end
function [ R ] = HouseholderQR (A)
  
    [r,c] = size(A);
   
    R = A;
    for i=1:min(r,c) 
        R(i:end, i:end) = ApplyReflection(R(i:end, i:end));
        
    end
    
end
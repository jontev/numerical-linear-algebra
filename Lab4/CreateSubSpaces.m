%CreateSubSpace: Computes the low-rank (k-rank) approximations for each
%digit j.
% Usage example:
%
%  >>TheSubSpaces = CreateSubspace( RefSet , RefAns , k );
%
%
function [ subspaces ] = CreateSubSpaces( RefSet, RefAns, k )
    subspaces = cell(1,10);
    for j=0:9   
        Rj = ExtractDigits(RefSet, RefAns, j);
        [Uj, Sj, Vj] = svd(Rj);
      
        Uj_hat = Uj(:, 1:k);
        
        subspaces{j+1} = Uj_hat;
        
    end
    
end
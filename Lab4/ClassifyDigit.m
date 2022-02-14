%ClassifyDigit: Computes the orthogonal distances from the subspaces spanned
%by the low rank approximations for each digit to the test digit and
%classifies the test digit as being the digit with the shortest distance. 
%
% Usage example:
%
%  >>Type = ClassifyDigit( S , TheSubspaces );
%Type is an int (0-9), the classified image S
%
function [ Type ] = ClassifyDigit( S, TheSubspaces )
    distances = zeros(1,10);
    for j=0:9
        subspace_j = TheSubspaces(j+1);
        distances(j+1) = DistanceFromSubspace(subspace_j, S);
    end
    [~, idx] = (min(distances));
    Type=idx-1;
    
    
end
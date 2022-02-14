%DistanceFromSubspace: Computes the orthogonal distance from
%unknown digit(image/vector) D to space spanned by the low rank approximation.
%
% Usage example:
%
%  >>d = DistanceFromSubspace( Rj , D );
%
%
function [ d ] = DistanceFromSubspace( Uj , D )
    Uj = cell2mat(Uj);
   
    d = norm(D - Uj*(Uj'*D));
    
    
end
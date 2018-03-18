function [M] = Update(M, Elements_matrix, e, A)
% -------- INPUT ------------
% Interaction    : matrix to be modified
% Elements_matrix: matrix of the mesh
% e              : number of the global element
% A              : matrix of the local contributions
% 
% -------- OUTPUT -----------
% M: Matrix modified

if size(A) ~= [4,4]
    error('Local Matrix dimension are not 4x4')
    M = zeros(4);
    return
end

for i=1:4
    for j=1:4
        M(Elements_matrix(e,i),Elements_matrix(e,j)) = M(Elements_matrix(e,i),Elements_matrix(e,j))+A(i,j);
    end
end



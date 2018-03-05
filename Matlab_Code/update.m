function [M] = update(M, Elements_matrix, e, A)
% -------- INPUT ------------
% Interaction    : matrix to be modified
% Elements_matrix: matrix of the mesh
% e              : number of the global element
% A              : matrix of the local contributions
% 
% -------- OUTPUT -----------
% M: Matrix modified


for i=1:4
    for j=1:4
        M(Elements_matrix(e,i),Elements_matrix(e,j)) = M(Elements_matrix(e,i),Elements_matrix(e,j))+A(i,j);
    end
end



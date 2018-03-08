function [M] = Update_boundary(M, b_elements_matrix, f, B)
% -------- INPUT ------------
% Interaction    : matrix to be modified
% Elements_matrix: matrix of the mesh
% e              : number of the global element
% A              : matrix of the local contributions
% 
% -------- OUTPUT -----------
% M: Matrix modified

if size(B) ~= [2,2]
    error('Local Matrix dimension are not 2x2');
    M = zeros(2);
    return
end



for i=1:2
    for j=1:2
        M(b_elements_matrix(f,i),b_elements_matrix(f,j)) = M(b_elements_matrix(f,i),b_elements_matrix(f,j))+B(i,j);
    end
end

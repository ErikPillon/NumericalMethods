function [M] = Update_boundary(M, b_ele_m, f, B)
% algorithm for the updating of the buondary elements
% -------- INPUT ------------
% M       : matrix to be modified
% b_ele_m : matrix of the mesh
% e       : number of the global element
% B       : matrix of the local contributions
% -------- OUTPUT -----------
% M: Matrix modified

if size(B) ~= [2,2]
    error('Local Matrix dimension are not 2x2');
    M = zeros(2);
    return
end



for i=1:2
    for j=1:2
        M(b_ele_m(f,i),b_ele_m(f,j)) = M(b_ele_m(f,i),b_ele_m(f,j))+B(i,j);
    end
end

function [rhs] = Update_rhs(rhs, b_ele_m, f, B)
% algorithm for the updating of the right hand side of the equation
% -------- INPUT ------------
% rhs     : vector to be modified
% b_ele_m : matrix of the mesh
% e       : number of the global element
% B       : matrix of the local contributions
% -------- OUTPUT -----------
% M: Matrix modified

s = length(B(:,1));
if size(B) ~= [s,1] % check for matrix dimensions mismatch
    error('Local Matrix dimension are not correct');
    return
end

for i=1:s
    rhs(b_ele_m(f,i)) = rhs(b_ele_m(f,i))+B(i);
end

function [E,e] = mesh_electric(M)
% algorithm for the creation of the mesh for the electrical part
% -----   INPUT   ----------
% M : Matrix in which are stored the x and y coordinates of the points 
% -----   OUTPUT   ---------
% E : Matrix in which are stored all the points of each element
% e : number of elements

dx = 0.01; dy = 0.01;
e = 1;
y=0;
while y <= 0.02
    x = 0;
    while x <= 0.04
        nx = 0.04/dx;
        E(e,:) = [e,e+1,e+1+nx,e+nx];
        x = x+dx;
        e = e+1;
    end
    y = y+dy;
end

% material
while y <= 0.4
    x = 0;
    while x <= 0.1
        nx = 0.1/dx;
        E(e,:) = [e,e+1,e+1+nx,e+nx];
        x = x+dx;
        e = e+1;
    end
    y = y+dy;
end

% top electrod
while y <= 0.1
    x = 0;
    while x <= 0.02
        nx = 0.02/dx;
        E(e,:) = [e,e+1,e+1+nx,e+nx];
        x = x+dx;
        e = e+1;
    end
    y = y+dy;
end
end
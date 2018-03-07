function [E,e] = mesh(lx,ly,nx,ny,M)
dx = lx/nx; dy = ly/ny;
e = 1;
x=0; y=0;
for iter=1:length(M)
    if M(iter,1)<lx & M(iter,2)<ly
        E(e,:) = [iter,iter+1,iter+1+nx,iter+nx];
        e = e+1;
    end
end
% we want to return the number of the elements we've generated
e = length(E);



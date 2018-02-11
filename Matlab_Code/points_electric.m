% point for the electric part 
dx=0.01;  dy=0.01;  R=0.1;  L=0.3;
m=R/dx+1; n=L/dy +1;

% bottom electrod
for j=1:(nb-1)
    for i=1:mb
        N=N+1;
        Px(N)=dr*(i-1);
        Py(N)=dz*(j-1);
    end
end                         
 % material
for j=1:n1
    for i=1:m
        N=N+1;
        Px(N)=dr*(i-1);
        Py(N)=dz*(j-1)+0.02;
    end
end                              
No=N;

%top electrod points 
for j=2:nt
    for i=1:mt
        N=N+1;
        Px(N)=dr*(i-1);
        Py(N)=dz*(j-1)+0.32;
    end
end

% build the mesh for the electrical part
% bottom element
for j=1:(nb-1)
    for i=1:(mb-1)
        e=e+1;
        ele(e,1)=i+mb*(j-1);       
        ele(e,2)=i+1+mb*(j-1);
        ele(e,3)=i+1+mb*j;
        ele(e,4)=i+mb*j;
    end
end                              
Nb=e;
% material element 
for j=1:(n1-1)
    for i=1:(m-1)
        e=e+1;
        ele(e,1)=i+m*(j-1)+(nb-1)*mb;       
        ele(e,2)=i+1+m*(j-1)+(nb-1)*mb;
        ele(e,3)=i+1+m*j+(nb-1)*mb;
        ele(e,4)=i+m*j+(nb-1)*mb;
    end
end                            
Nm=e;
 
for i=1:(mt-1)
    e=e+1;
    ele(e,1)=i+No-m;       
    ele(e,2)=i+1+No-m;
    ele(e,3)=i+1+No;
    ele(e,4)=i+No;
end
% top element    
for j=2:(nt-1)
    for i=1:(mt-1)
        e=e+1;
        ele(e,1)=i+No+mt*(j-2);       
        ele(e,2)=i+1+No+mt*(j-2);
        ele(e,3)=i+1+mt*(j-1)+No;
        ele(e,4)=i+mt*(j-1)+No;
    end
end                             
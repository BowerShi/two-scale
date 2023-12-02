function rho = intersection_calculation(x,y,vector0,delta)
vector = vector0 * delta;
if vector(1)~=0 && vector(2) ~=0
    
    k= vector(2)/vector(1);
    p1=[1,k*(1-x)+y];
    p2=[0,-k*x+y];
    p3=[x-y/k,0];
    p4=[(1-y)/k+x,1];
    if is_in_domain(x+vector(1),y+(vector(2)))
        fprintf('%g,%g',x,y);
        fprintf('%g,%g',vector0(1),vector0(2));
        error('in domian error')
    end 
    if is_in_boundary(p1) && (p1(1)-x)*(p1(1)-x-vector(1))<=0
        rho = norm(p1-[x,y],2)/norm(vector,2);
    elseif is_in_boundary(p2) && (p2(1)-x)*(p2(1)-x-vector(1))<=0
        rho = norm(p2-[x,y],2)/norm(vector,2);
    elseif is_in_boundary(p3) && (p3(1)-x)*(p3(1)-x-vector(1))<=0
        rho = norm(p3-[x,y],2)/norm(vector,2);
    elseif is_in_boundary(p4) && (p4(1)-x)*(p4(1)-x-vector(1))<=0
        rho = norm(p4-[x,y],2)/norm(vector,2);
    else
        
        fprintf('%g,%g',x,y);
        fprintf('%g,%g',vector0(1),vector0(2));
        error('calculation error');
    end
elseif vector(1) ==0
    if vector(2)>0
        rho = abs(1-y)/norm(vector,2);
    else
        rho = abs(y)/norm(vector,2);
    end
elseif vector(2) ==0
    if vector(1)>0
        rho = abs(1-x)/norm(vector,2);
    else
        rho = abs(x)/norm(vector,2);
    end
end
end
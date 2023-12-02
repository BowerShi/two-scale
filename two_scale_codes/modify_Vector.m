function modified_vector = modify_Vector(vector,delta,x,y)
rho1 = 1;
rho2 = 1;
if ~ is_in_domain(x+vector(1)*delta,y+vector(2)*delta)
    rho1 = intersection_calculation(x,y,vector,delta)-1e-3;
    if ~ is_in_domain(x+rho1*vector(1)*delta,y+rho1*vector(2)*delta)
        disp(x);
        disp(y);
        disp(vector);
        fprintf('%g,%g',x+rho1*vector(1)*delta,y+rho1*vector(2)*delta);
        error('intersection calculation error')
    end
end
if ~ is_in_domain(x-vector(1)*delta,y-vector(2)*delta)
    rho2 = intersection_calculation(x,y,-vector,delta)-1e-3;
    if ~ is_in_domain(x-rho2*vector(1)*delta,y-rho2*vector(2)*delta)
        disp(x);
        disp(y);
        disp(vector);
        fprintf('%g,%g',x-rho2*vector(1)*delta,y-rho2*vector(2)*delta);
        error('intersection calculation error')
    end
end
rho = min(rho1,rho2);

modified_vector = rho*vector;
end
function value = interp(U,N,x0,y0)

h=1/N;
j_base = floor(N*x0);
i_base = floor(N*y0);
if i_base == N
    i_base = i_base-1;
end
if j_base == N
    j_base = j_base-1;
end
x1 = j_base*h;
y1 = i_base*h;
if i_base+2>N+1 || j_base+2>N+1
    fprintf('%g,%g',x0,y0);
    fprintf('%g,%g',i_base,j_base);
    error('index error')
end
if y0-y1>= x0-x1
    value=calculate_interpolation_value(x0,y0,x1,y1,x1,y1+h,x1+h,y1+h,U(i_base+1,j_base+1),U(i_base+2,j_base+1),U(i_base+2,j_base+2));
else
    value=calculate_interpolation_value(x0,y0,x1,y1,x1+h,y1,x1+h,y1+h,U(i_base+1,j_base+1),U(i_base+1,j_base+2),U(i_base+2,j_base+2));
end
end
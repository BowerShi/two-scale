function pos=interp_coeffs(N,x0,y0)
h=1/N;
j_base = floor(N*x0);
i_base = floor(N*y0);
if j_base ==N
    j_base = j_base-1;
end
if i_base ==N
    i_base = i_base-1;
end
x1 = j_base*h;
y1 = i_base*h;
if y0-y1>= x0-x1
    [co1,co2,co3]=calculate_interpolation_coeffs(x0,y0,x1,y1,x1,y1+h,x1+h,y1+h);
    pos = [(i_base+1-1)*(N+1)+j_base+1,co1;(i_base+2-1)*(N+1)+j_base+1,co2;(i_base+2-1)*(N+1)+j_base+2,co3];
else
    [co1,co2,co3]=calculate_interpolation_coeffs(x0,y0,x1,y1,x1+h,y1,x1+h,y1+h);
    pos = [(i_base+1-1)*(N+1)+j_base+1,co1;(i_base+1-1)*(N+1)+j_base+2,co2;(i_base+2-1)*(N+1)+j_base+2,co3];
end
end
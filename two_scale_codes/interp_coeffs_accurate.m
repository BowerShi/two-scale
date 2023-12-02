function pos = interp_coeffs_accurate(N0,x0,y0)
N=N0/2;
h=1/N; %粗网格尺度
j_base = floor(N*x0);
i_base = floor(N*y0);
if i_base == N
    i_base = i_base-1;
end
if j_base == N
    j_base = j_base-1;
end
if i_base+2>N+1 || j_base+2>N+1
    fprintf('%g,%g',x0,y0);
    fprintf('%g,%g',i_base,j_base);
    error('index error')
end
x1 = j_base*h;
y1 = i_base*h; % (x0,y0) 
i1= 2*(i_base+1)-1;
j1 = 2*(j_base+1)-1;
h0=h/2;
if y0-y1>= x0-x1
    data=[x1,y1;
          x1,y1+h0;
          x1,y1+2*h0;
          x1+h0,y1+2*h0;
          x1+2*h0,y1+2*h0;
          x1+h0,y1+h0];
    coeffs=calculate_interpolation_coeffs_accurate(x0,y0,data);
    pos=[(i1-1)*(N0+1)+j1,(i1-1+1)*(N0+1)+j1,(i1-1+2)*(N0+1)+j1,(i1-1+2)*(N0+1)+j1+1,(i1-1+2)*(N0+1)+j1+2,(i1-1+1)*(N0+1)+j1+1]';
    pos=[pos,coeffs];
else
     data=[x1,y1;
          x1+h0,y1;
          x1+2*h0,y1;
          x1+2*h0,y1+h0;
          x1+2*h0,y1+2*h0;
          x1+h0,y1+h0];
    coeffs=calculate_interpolation_coeffs_accurate(x0,y0,data);
    pos=[(i1-1)*(N0+1)+j1,(i1-1)*(N0+1)+j1+1,(i1-1)*(N0+1)+j1+2,(i1-1+1)*(N0+1)+j1+2,(i1-1+2)*(N0+1)+j1+2,(i1-1+1)*(N0+1)+j1+1]';
    pos=[pos,coeffs];
end
end
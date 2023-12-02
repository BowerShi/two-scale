function value = interp_accurate(U,N0,x0,y0)
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
    data=[x1,y1,U(i1,j1);
          x1,y1+h0,U(i1+1,j1);
          x1,y1+2*h0,U(i1+2,j1);
          x1+h0,y1+2*h0,U(i1+2,j1+1);
          x1+2*h0,y1+2*h0,U(i1+2,j1+2);
          x1+h0,y1+h0,U(i1+1,j1+1)];
    value=calculate_interpolation_value_accurate(x0,y0,data);
else
    data=[x1,y1,U(i1,j1);
          x1+h0,y1,U(i1,j1+1);
          x1+2*h0,y1,U(i1,j1+2);
          x1+2*h0,y1+h0,U(i1+1,j1+2);
          x1+2*h0,y1+2*h0,U(i1+2,j1+2);
          x1+h0,y1+h0,U(i1+1,j1+1)];
    value=calculate_interpolation_value_accurate(x0,y0,data);
end
end
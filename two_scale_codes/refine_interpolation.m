function initial_value_interpolation=refine_interpolation(initial_value,N,N0)
    initial_value_interpolation = zeros(N0+1,N0+1);
    h0 = 1/N0;
    for i=1:N0+1
        for j=1:N0+1
                x0 = (j-1)*h0;
                y0 = (i-1)*h0;
                initial_value_interpolation(i,j)=interp_accurate(initial_value,N,x0,y0);
        end
    end
end
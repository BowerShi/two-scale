function initial_value_interpolation = generate_intial_guess(f,g,N,N0)
    h = 1/N;
    A = zeros((N-1)^2,(N-1)^2);
    b = zeros((N-1)^2,1);
    node_count = 1;
    for i=1:N-1
        for j=1:N-1
            x = (j)*h;
            y = (i)*h;
            b(node_count) = sqrt(2*f(x,y));
            A(node_count,node_count) = -4/h^2;
            if x+h<1
                A(node_count,node_count+1) = 1/h^2;
            else
                b(node_count) = b(node_count) - g(x+h,y)/h^2;
            end
            if x-h>0
                A(node_count,node_count-1) = 1/h^2;
            else
                b(node_count) = b(node_count) - g(x-h,y)/h^2;
            end  
            if y+h<1
                A(node_count,node_count+(N-1)) = 1/h^2;
            else
                b(node_count) = b(node_count) - g(x,y+h)/h^2;
            end    
            if y-h>0
                A(node_count,node_count-(N-1)) = 1/h^2;
            else
                b(node_count) = b(node_count) - g(x,y-h)/h^2;
            end    
            node_count = node_count + 1;  
        end
    end
    x=A\b;
    initial_value = zeros(N+1,N+1);
    node_count = 1;
    for i=1:N +1
        for j=1:N+1
            if i==1 || j==1 || i==N+1 || j==N+1
                initial_value(i,j) = g((j-1)*h,(i-1)*h);
            else
                initial_value(i,j) = x(node_count);
                node_count = node_count + 1;
            end
        end
    end
    initial_value_interpolation = zeros(N0+1,N0+1);
    h0 = 1/N0;
    for i=1:N0+1
        for j=1:N0+1
            if i==1 || j==1 || i==N0+1 || j== N0+1
                initial_value_interpolation(i,j) = g((j-1)*h0,(i-1)*h0);
            else
                x0 = (j-1)*h0;
                y0 = (i-1)*h0;
                initial_value_interpolation(i,j)=interp_accurate(initial_value,N,x0,y0);
            end
        end
    end
    initial_value_interpolation = initial_value_interpolation;
    
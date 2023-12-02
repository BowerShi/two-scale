function A=generate_poly_pos(k)
count = 0;
A=zeros(k+1,k+1,k+1);
for i=0:k
    for j=0:k-i
        for s=0:k-i-j
            count=count+1;
            A(i+1,j+1,s+1) = count;
        end
    end
end
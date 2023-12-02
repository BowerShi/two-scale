function vector=H_minus(vector)
    size_vector = size(vector);
    for i=1:size_vector(1)
        for j=1:size_vector(2)
            if vector(i,j)>0
                vector(i,j)=0;
            else
                vector(i,j)=-1;
            end  
        end
    end
end
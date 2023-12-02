function s=f_sigma_d(s,sigma)
s_size=size(s);
for i=1:s_size(1)
    for j=1:s_size(2)
        if s(i,j)>1+sigma
            s(i,j)=0;
        elseif s(i,j)<=-1-sigma
            s(i,j)=0;
        elseif s(i,j)>1 && s(i,j)<=1+sigma
            s(i,j)=-1/sigma;
        elseif s(i,j)<=-1 && s(i,j)>-1-sigma
            s(i,j)=-1/sigma;
        elseif s(i,j)>-1 && s(i,j)<=1
            s(i,j)=1;
        end
    end
end
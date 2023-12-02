function [U1,P_modyfied]=convexfy_function(N,U)
h=1/N;
[X,Y] = meshgrid(0:h:1,0:h:1);
X1=X(:);
Y1=Y(:);
U1=U(:);
data=[X1,Y1,U1];
P=convhull(data);
P_size=size(P);
P_modyfied = zeros(1,3);
index=1;
for k=1:P_size(1)
    pos=P(k,:);
    indicator=0;
    if ~((X1(pos(1))==0 && X1(pos(2))==0 && X1(pos(3))==0) || (X1(pos(1))==1 && X1(pos(2))==1 && X1(pos(3))==1) || (Y1(pos(1))==0 && Y1(pos(2))==0 && Y1(pos(3))==0) || (Y1(pos(1))==1 && Y1(pos(2))==1 && Y1(pos(3))==1))
        indicator=1;
        [i1,j1]=calculate_pos(pos(1),N);
        [i2,j2]=calculate_pos(pos(2),N);
        [i3,j3]=calculate_pos(pos(3),N);
        i_start=min([i1,i2,i3]);
        i_end=max([i1,i2,i3]);
        j_start=min([j1,j2,j3]);
        j_end=max([j1,j2,j3]);
        for i=i_start:i_end
            for j=j_start:j_end
                if i==1 || j==1 || i==N+1 || j==N+1
                    continue
                end
                s=j+(i-1)*(N+1);
                temp=calculate_interpolation_value(X1(s),Y1(s),X1(pos(1)),Y1(pos(1)),X1(pos(2)),Y1(pos(2)),X1(pos(3)),Y1(pos(3)),U1(pos(1)),U1(pos(2)),U1(pos(3)));
                if s~=pos(1) && s~=pos(2) && s~=pos(3) && temp>U1(s)+1e-6
                    indicator=0;
                    break
                elseif s~=pos(1) && s~=pos(2) && s~=pos(3) && inpolygon(X1(s),Y1(s),X1(pos),Y1(pos)) && temp<=U1(s)
                    U1(s)=temp;
                end
            end
            if indicator ==0
                break
            end
        end
    end
    if indicator == 1
        P_modyfied(index,:) = pos;
        index=index+1;
    end
end
U1=reshape(U1,size(U));
end
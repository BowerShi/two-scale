function indicator = is_in_boundary(pos)
indicator =0;
x=pos(1);
y=pos(2);
if x==0 && y>=0 && y<=1
    indicator = 1;
elseif x==1 && y>=0 && y<=1
    indicator = 1;
elseif y==0 && x>=0 && x<=1
    indicator = 1;
elseif y==1 && x>=0 && x<=1
    indicator = 1;
end
end
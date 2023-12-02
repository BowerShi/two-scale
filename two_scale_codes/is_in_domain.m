function indicator = is_in_domain(x,y)
if x<=1 && x>=0 && y<=1 && y>=0
    indicator = 1;
else
    indicator = 0;
end
end
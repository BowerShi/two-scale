function [i,j]=calculate_pos(index,N)
i=floor((index-1)/(N+1))+1;
j=index-(N+1)*(i-1);
end
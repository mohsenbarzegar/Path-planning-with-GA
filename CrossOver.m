function [children] = CrossOver(paths,child_num)
%Create Children from parents
alpha = 0.5;
parent_sz = size(paths);
children = zeros(child_num, parent_sz(2));
for i=1:child_num
    rand1 = parent_sz(2)*rand();
    swap = parent_sz(2)*rand();
 	p = ceil(parent_sz(1)*rand(1,2));
    if swap < rand1
        rand2 = rand1;
        rand1 = swap;
    else
        rand2 = swap;
    end
    for j=1:parent_sz(2)
        if j < rand1 || j > rand2
            children(i,j) = alpha*paths(p(1),j) + (1-alpha)*paths(p(2),j);
        else
            children(i,j) = (1-alpha)*paths(p(1),j) + alpha*paths(p(2),j);
        end
    end   
end
end


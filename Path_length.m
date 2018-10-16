function [len] = Path_length(path)
%Calculate path length
len = 0;
sz = size(path);
for i=1:sz(1)-1
    dx = path(i+1,1)-path(i,1);
    dy = path(i+1,2)-path(i,2);
    len = len + sqrt(dx^2 + dy^2);
end
end


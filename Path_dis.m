function [dist] = Path_dis(obst,x_val,path)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
path_sz = size(path);
obst_sz = size(obst);
dist = 100;
tmp = 0;
for i=1:path_sz(2)-1
    for j=0:(obst_sz(1)/2-1)
        for k=1:obst_sz(2)
            tmp = Distance([x_val(i) path(i)]',[x_val(i+1) path(i+1)]', [obst((2*j+1),k) obst((2*j+2),k)]');
            if(tmp < dist)
                dist = tmp;
            end
        end
    end
end
end


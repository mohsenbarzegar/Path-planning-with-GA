function [cost, min_len, min_angle, mean_dis] = Cost_func(Obst, path, x_val)
%Assgin cost value for each path
path_sz = size(path);
path_cost = zeros(path_sz(1),3);

% path length, path angle calculation
for i=1:path_sz(1)
    path_cost(i,1) = Path_length([x_val; path(i,:)]');
    path_cost(i,2) = Path_angle(x_val,path(i,:));
    path_cost(i,3) = Path_dis(Obst,x_val,path(i,:));
end
min_len = mean(path_cost(:,1));
min_angle = mean(path_cost(:,2));
mean_dis = mean(path_cost(:,3));

str = sprintf('minimum path length: %0.4f', min_len);
disp(str);
str = sprintf('minimum path angle: %0.4f degree', min_angle);
disp(str);
str = sprintf('mean of minimum path distances: %0.4f', mean_dis);
disp(str);

cost = path_cost(:,1)/150 + path_cost(:,2)/200 + exp(-path_cost(:,3));
end


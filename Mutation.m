function [paths] = Mutation(paths, coef)
% Mutation on old population
mu_var = 100/(log((coef))+1);
% mu_var = 20;

path_sz = size(paths);
mu_num = random('unid',path_sz(1)/5);
indx = random('unid',path_sz(1), mu_num, 1);
for i=1:mu_num
    gen = random('unid',path_sz(2)-2)+1;
    paths(indx(i),gen) = random('norm', paths(indx(i),gen), mu_var);
end
end


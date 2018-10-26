function [s_paths] = Path_Selection(rank, paths, s_num)
%Select candidate paths
%type of selection
s_type = 2;

path_sz = size(paths);
s_paths = zeros(s_num,11);
if s_type == 1
    indx = random('chi2',3.5,s_num,1);
    indx = path_sz(1)*indx/(max(indx)+1);
    for i=1:s_num
        in = rank(ceil(indx(i)));
        s_paths(i,:) = paths(in,:);
    end
end

if s_type == 2
    indx = random('hn',0,path_sz(1)/3,s_num,1);
    for i=1:s_num
        if indx(i) > path_sz(1)
            p = path_sz(1);
        else
            p = indx(i);
        end
        in = rank(ceil(p));
        s_paths(i,:) = paths(in,:);
    end
end

if s_type == 3
    indx = random('unid',path_sz(1),s_num,1);
    for i=1:s_num
        if indx(i) == 0
            in = rank(1);
        else
            in = rank(indx(i));
        end
        s_paths(i,:) = paths(in,:);
    end
end

end


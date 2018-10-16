function [angle] = Path_angle(x_val, path)
% Total angle of path calculation
path_sz = size(path);
angle = 0;
for i=1:path_sz(2)-2
    angle = angle + AngleLL([x_val(i) path(i)], [x_val(i+1) path(i+1)], [x_val(i+2) path(i+2)]);
end
end


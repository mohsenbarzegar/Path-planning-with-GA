function [dis] = Distance(pL1, pL2, p)  
% Calcualte distance between line and point
th = pi/2;
dir = [cos(th) -sin(th) ;sin(th) cos(th)]*(pL2-pL1);
dir = dir/norm(dir);
dis = abs(dot(dir, (p-pL1)));
end


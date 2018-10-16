function [angle] = AngleLL(p1,p2,p3)
%Calculate angle between two line
dif1 = p2-p1;
dif2 = p3-p2;
ph1 = phase(dif1(1)+ i*dif1(2));
ph2 = phase(dif2(1)+ i*dif2(2));
angle = abs(ph1-ph2)*180/pi;
end


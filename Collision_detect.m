function [collision] = Collision_detect(pgon,points)
%Collision Detection

collision = ~isempty(intersect(pgon,points'));
end


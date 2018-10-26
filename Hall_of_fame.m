function [new_famous] = Hall_of_fame(paths, costs, rank, famous)
%Hall of fame member selection

% fame_sz = size(famous);
% path_sz = size(paths);

swap = [famous; [costs paths]];
swap = unique(swap,'rows');

[a, indx] = sort(swap(:,1));
new_famous = swap(indx(1:5),:);

end


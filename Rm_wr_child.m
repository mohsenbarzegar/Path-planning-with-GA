function [chil] = Rm_wr_child(pgon, x_val, all_chil)
%Remove Wrong children
chil_sz = size(all_chil);
pgon_sz = size(pgon);

for i=1:pgon_sz(2)
    j = 1;
    while j <= chil_sz(1)
        if Collision_detect(pgon(i),[x_val; all_chil(j,:)])
            all_chil(j,:) = [];
            chil_sz = size(all_chil);
        else
            j = j+1;
        end
    end
end

chil = all_chil;
end


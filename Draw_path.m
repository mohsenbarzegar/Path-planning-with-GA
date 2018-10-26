function Draw_path(pgon, x_val, paths)

close
plot(pgon,'FaceColor','blue','FaceAlpha',0.1)
xlim([0,100]);
ylim([0,100]);
hold on
grid on
plot(x_val, paths);
scatter(x_val(1), paths(1,1),40, 'red', 'filled','s');
scatter(x_val(11), paths(1,11),40, 'blue', 'filled','s');
end


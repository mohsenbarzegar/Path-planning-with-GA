%% In the name of GOD
% Title: solve path planning Problem with GA
% provided by: Mohsen Barzegar

clear all;
close all;
clc;

%% Create and plot Obstacle

% Obstacle Locations
O_loc = [[[20 25 25 20]; [98 97 84 84]]; ...
         [[20 25 24 21]; [75 73 63 63]]; ...
         [[21 25 26 20]; [55 55 42 43]]; ...
         [[20 25 28 20]; [35 25 5 6]];   ...
         [[41 48 48 40]; [99 93 85 86]]; ...
         [[40 48 47 40]; [77 77 58 57]]; ...
         [[41 46 48 40]; [50 44 20 20]]; ...
         [[60 68 78 60]; [83 82 71 71]]; ...
         [[61 68 68 60]; [55 55 45 45]]; ...
         [[62 68 70 61]; [33 23 11 11]]; ...
         [[80 85 85 80]; [63 62 55 54]]; ...
         [[78 84 85 79]; [32 33 25 28]]; ...
         ];
swap = size(O_loc);
O_num = swap(1)/2;  %Number of obstacle

% Create obstacles
for i=1:O_num
    n = i*2;
    pgon(i) = polyshape(O_loc(n-1,:),O_loc(n,:));
end
% Plot obstacle
plot(pgon,'FaceColor','red','FaceAlpha',0.1)
xlim([0,100]);
ylim([0,100]);
hold on
grid on

%% Insert begining and end point

disp('Please,');
disp('select bigining point and then select end point.')
% Ask user for input begining and end point
swap = getline();
beginP = swap(1,:);
endP = swap(2,:);
% Plot begin and end point
scatter(beginP(1), beginP(2),40, 'red', 'filled','s');
scatter(endP(1), endP(2),40, 'blue', 'filled','s');

%% Create Primary population



%%
points = [[20 22];[80, 75]];
collision = Collision_detect(pgon(1),points)
Draw_path(points);
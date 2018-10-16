%% In the name of GOD
% Title: solve path planning Problem with GA
% provided by: Mohsen Barzegar

clear all;
close all;
clc;

%% Create and plot Obstacle

areax = 100;
areay = 100;
% Obstacle Locations
O_loc = [[[20 25 25 20]; [98 97 84 84]]; ...
         [[20 25 24 21]; [75 73 63 63]]; ...
         [[21 25 26 20]; [55 55 42 43]]; ...
         [[20 25 28 20]; [35 25 5 6]];   ...
         [[41 48 48 40]; [99 93 85 86]]; ...
         [[40 48 47 40]; [77 77 58 57]]; ...
         [[41 46 48 40]; [50 44 20 20]]; ...
         [[60 68 78 59]; [83 82 71 71]]; ...
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
plot(pgon,'FaceColor','blue','FaceAlpha',0.1)
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

%% Initialize population
pop_num = 100;
init_num = 50;
y_best = (endP(2)-beginP(2))/9*(1:9) + beginP(2);

pop = zeros(init_num,9);
for i=1:9
    pop(:,i) = random('Normal',y_best(i), 8, init_num,1);

end
begin_mat = repmat(beginP(2),init_num,1);
end_mat = repmat(endP(2),init_num,1);
pop = [begin_mat pop end_mat];
x_val = [beginP(1) 10:10:90 endP(1)];
check_flag = 0;
tic;
for j=1:init_num
    k=2;
    while k <= 9
        i=0;
        while i < O_num
            i = i+1;
            while Collision_detect(pgon(i),[x_val(1:k+1); pop(j,1:k+1)])
                pop(j,k:k+1) = random('Normal',(y_best(k)+y_best(k))/2 , 8, 1, 2);
                check_flag = 1;
            end      
            if check_flag == 1
                i = 0;
                check_flag = 0;
            end
        end
        k = k+1;
    end
    plot(x_val, pop(j,:));
end
disp(toc + " Second primary papulation generating taked!!")
% pop = [pop; zeros(pop_num-init_num,9)];

%% Main Loop (Cost Assignment, Selection, Cross Over and Mutation)
cost = Cost_func(O_loc, pop, x_val);
figure
hist(cost)
%% 
% points = [[20 22];[80, 75]];
% collision = Collision_detect(pgon(1),points)
% Draw_path(points);
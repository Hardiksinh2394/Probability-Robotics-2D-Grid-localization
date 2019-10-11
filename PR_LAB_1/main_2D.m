close all; clear; clc;

%% 2D Environment (Red & Green grids)

R = 5;
C = 5;
World = display_2D(R, C);
Map = zeros(R,C);

for i = 1:R
    for j = 1:C
        if isequal(World{i,j},'green')
            Map(i,j) = 1;
        else
            Map(i,j) = 0;
        end
    end
end

figure;
colormap(prism(256));
imagesc(Map);

P = ones(R,C)/(R*C);

%% 

Z = {'red','green','red';
     'red','green','red';
     'green','red','red';
     'green','green','red';
     'green','red','green'};



U = [0 1 -1 0 0];
V = [-1 0 0 1 0];

%%

% movement of the Robot in the Environment 

% movement{1} = [1,0];  for move down
% movement{2} = [-1,0]; for move up
% movement{3} = [0,1];  for move left
% movement{4} = [0,-1]; for move right

%%

for i = 1:size(Z,1)
    q = sense_2D(P, Z(i), World);
    q_New = move_2D(q, U(i), V(i));
    P = q_New;
end

figure; 
colormap(gray); 
imagesc(q_New);

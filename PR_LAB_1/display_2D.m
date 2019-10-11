function World = display_2D(R,C)

%   Input
%       R  - Row Size 
%       C  - Column Size 
%
%   Output
%       World - 2D Environment

%% Function starts from here

temp = rand(R,C);

World = {}; % Initialize the Environment

for i = 1:R
    for j = 1:C
        
        if temp(i,j) <= 0.5
            World(i,j) = {'red'};
        else
            World(i,j) = {'green'};
        end
    end
end

end


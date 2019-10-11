function q = sense_2D(P, Z, World)
 
%   Input
%       P     - Prior Probability 
%       Z     - Measurement from the Sensor 
%       World - 2D Environment
%
%   Output
%       Q - Posterior Probability 

%% Function starts from here

p_Hit = 0.6;         % efficiency of sensor
p_Miss = 0.2;        % efficiency of sensor


[r,c] = size(World); % Size of the Environment

for i = 1:length(Z) % Number of Measurements
    for j= 1:r
        for k= 1:c
            if strcmp(World(j,k),Z(i))
                q(j,k) = p_Hit * P(j,k);
            else
                q(j,k) = p_Miss * P(j,k);
            end
        end
    end
    
    % Normalize
    const = 1/sum(sum(q));
    q = q .* const;
    P = q;
end

end


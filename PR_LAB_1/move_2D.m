function q = move_2D(P, U, V)
%   Input
%       P  - Probability Matrix
%       U  - Movement in Horizontal direction 
%       V  - Movement in Vertical direction 
%
%   Output
%       Q - Probability Matrix after the Robot Motion

%% Function starts from here

p_Correct = 0.8; 
p_OverShift = 0.1; 
p_UnderShift = 0.1; 

if U ~= 0 || V ~= 0
    
    q = p_Correct * circshift(P,[U,V]);
    
    % vertical movement is zero
    if V == 0 % Vertical Movement (Up & Down)
        q = q + p_OverShift * circshift(P,[U+1,V]);
        q = q + p_UnderShift * circshift(P,[U-1,V]);
          % horizantal movement is zero
    elseif U == 0 % Horizontal Movement (Left & Right)
        q = q + p_OverShift * circshift(P,[U,V+1]);
        q = q + p_UnderShift * circshift(P,[U,V-1]);
    end
    
else
    q = P; 
end

end

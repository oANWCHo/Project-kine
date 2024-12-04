for i = 1:size(finger, 1)
    for j = 1:size(finger, 2)
        % Create variable names like 'Table_2_3'
        varName = sprintf('Table_%d_%d', i, j);
        eval([varName ' = finger{i, j};']);
    end
end

% Access example:
disp(Table_2_3); % Access the variable Table_2_3

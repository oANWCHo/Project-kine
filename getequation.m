% Assuming 'finger' is your 4x5 cell array
fittedEquations = cell(size(finger)); % Create a cell array to store equations

for i = 1:size(finger, 1) % Loop over rows
    for j = 1:size(finger, 2) % Loop over columns
        % Extract the table from the cell
        currentTable = finger{i, j};

        % Extract variables (assuming 'L', 'R', 'Data' columns in table)
        L = currentTable.L;
        R = currentTable.R;
        Data = currentTable.Data;

        % Example: Fit a linear curve (change 'fit' model as needed)
        % Here we fit Data as a function of L and R
        % (Replace 'poly11' with other models if needed, e.g., 'poly22' or custom functions)
        fitType = 'poly55'; % Linear model with interaction terms
        [fitResult, ~] = fit([L, R], Data, fitType);

        % Store the equation in the cell array
        fittedEquations{i, j} = fitResult;
    end
end

% Display results
disp('Fitted equations for each cell:');
disp(fittedEquations);
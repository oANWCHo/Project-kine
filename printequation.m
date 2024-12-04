% Assuming 'finger' is your 4x5 cell array of tables
fittedEquations = cell(size(finger)); % Create a cell array to store fit results

for i = 1:size(finger, 1) % Loop over rows
    for j = 1:size(finger, 2) % Loop over columns
        % Extract the table
        currentTable = finger{i, j};
        
        % Extract data (assuming table columns are named 'L', 'R', and 'Data')
        L = currentTable.L;
        R = currentTable.R;
        Data = currentTable.Data;
        
        % Fit a poly55 model
        fitType = 'poly55'; % 5th-degree polynomial model
        [fitResult, ~] = fit([L, R], Data, fitType);
        
        % Store the fit result
        fittedEquations{i, j} = fitResult;
        
        % Extract coefficients
        coeffs = coeffnames(fitResult); % Get coefficient names (e.g., p00, p10, etc.)
        values = coeffvalues(fitResult); % Get coefficient values
        
        % Construct the equation as a string
        equationParts = cell(size(coeffs)); % Preallocate for equation terms
        for k = 1:length(coeffs)
            equationParts{k} = sprintf('%.4f*%s', values(k), coeffs{k});
        end
        
        % Combine the terms into a full equation
        equation = strjoin(equationParts, ' + ');
        equation = strrep(equation, '*1', ''); % Clean up terms like "p00*1"
        
        % Print the equation
        fprintf('Fitted equation for cell (%d, %d):\n', i, j);
        fprintf('Data = %s\n\n', equation);
    end
end

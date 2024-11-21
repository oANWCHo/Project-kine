% Initialize an empty cell array to store matrices
allMatrices = {}; 

for R = 1.2:0.05:5 
    % Generate file name dynamically
    fileName = sprintf('sphere_%f.mat', R);
    
    % Load the MAT-file
    if isfile(fileName) % Check if the file exists
   
        data = load(fileName);
        
        % Access the Time Series object (replace 'ans' with your variable name)
        ts = data.ans; % Replace 'ans' with your actual variable name in the file
        % 
        % disp(length(ts.Data))

        % Extract the specific slice of data
        matrixSlice = ts.Data(:,:,length(ts.Data));
        
        % Store the extracted matrix in the cell array
        allMatrices{end+1} = matrixSlice;
    else
        fprintf('File %s not found. Skipping...\n', fileName);
    end
end

% Save all extracted matrices into a single MAT-file
save('consolidated_matrices.mat', 'allMatrices');

% Display a confirmation
fprintf('All matrices saved into consolidated_matrices.mat\n');

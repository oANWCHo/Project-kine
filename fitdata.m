[R_grid, L_grid] = meshgrid(R, L); 
finger = cell(4, 5); % Preallocate a 5x6 cell array for tables

for x = 1:1:5
    for y = 1:1:4
        % Assuming ans(y, x, :) exists and has the correct size
        Data_reshaped = reshape(ans(y,x,:), 20, 27);

        L_vector = L_grid(:);
        R_vector = R_grid(:);
        Data_vector = Data_reshaped(:);

        % Store the table in a cell
        finger{y, x} = table(L_vector, R_vector, Data_vector, ...
            'VariableNames', {'L', 'R', 'Data'});
    end
end

% [R_grid, L_grid] = meshgrid(R, L); 
% 
% Data_reshaped = reshape(ans(1,1,:), 20, 27);
% 
% L_vector = L_grid(:);
% R_vector = R_grid(:);
% Data_vector = Data_reshaped(:);
% 
% index_y = table(R_vector, L_vector, Data_vector, ...
%     'VariableNames', {'R', 'L', 'Data'});

% ฟิตสมการ
% ft = fittype('a*L^2 + b*R + c', 'independent', {'L', 'R'}, 'dependent', 'Data');
% fitresult = fit([L_vector, R_vector], Data_vector, ft);

% แสดงผลลัพธ์
% disp('สมการที่ฟิตได้:');
% disp(formula(fitresult));
% disp('ค่าพารามิเตอร์:');
% disp(coeffvalues(fitresult));

% for i=1:size(ans,1)
%     for j=1:size(ans,2)
%         y = reshape(ans(i,j,:), [], 1);
%         f = fit(X, y, 'poly5');
% 
%         disp([i, j]);
%         coef = coeffvalues(f);
%         text = sprintf('%.4f*r^5 + %.4f*r^4 + %.4f*r^3 + %.4f*r^2 + %.4f*r + %.4f\n', ...
%             coef(1), coef(2), coef(3), coef(4), coef(5), coef(6));
%         disp(text);
%     end
% end
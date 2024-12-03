ans = [];

for x = 0.60:0.05:4.00

    % โหลดไฟล์
    filename = sprintf('Cylindical_R_data/Cylindical_R%.2f0000.mat',x);
    loadedData = load(filename);

    % disp(loadedData.ans.Data)
    Data = loadedData.ans.Data; % ดึงข้อมูลค่าที่วัดได้

    % disp(Data(:,:,10001))
    ans(:,:,end+1) = Data(:,:,10001);

end
X = linspace(1.25,5.00,76)'
ans = ans(:,:,2:end);
% 
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

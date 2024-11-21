ans = [];

for x = 1.20:0.05:3.30

    % โหลดไฟล์
    filename = sprintf('Sphere_Data/sphere_%.2f0000.mat',x);
    loadedData = load(filename);

    % disp(loadedData.ans.Data)
    Data = loadedData.ans.Data; % ดึงข้อมูลค่าที่วัดได้

    % disp(Data(:,:,10001))
    ans(:,:,end+1) = Data(:,:,10001);

end
X = linspace(1.20,3.30,43)';
ans = ans(:,:,2:end);

for i=1:size(ans,1)
    for j=1:size(ans,2)
        y = reshape(ans(i,j,:), [], 1);
        f = fit(X, y, 'poly5');
        
        disp([i, j]);
        coef = coeffvalues(f);
        text = sprintf('%.4f*x^5 + %.4f*x^4 + %.4f*x^3 + %.4f*x^2 + %.4f*x + %.4f\n', ...
            coef(1), coef(2), coef(3), coef(4), coef(5), coef(6));
        disp(text);
    end
end

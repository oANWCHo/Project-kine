ans = [];
% for x = 2.40:0.10:5.00
for y = 1.00:0.10:2.90
    for x = 2.40:0.10:5.00

        % โหลดไฟล์
        filename = sprintf('Cylindical/Cylindical_R%.2f0000L%.2f0000.mat',y,x);
        loadedData = load(filename);

        % disp(loadedData.ans.Data)
        Data = loadedData.ans.Data; % ดึงข้อมูลค่าที่วัดได้

        % disp(Data(:,:,10001))
        ans(:,:,end+1) = Data(:,:,15001);

    end
end
L = linspace(2.4,5.00,27)
R = linspace(1.00,2.90,20)

ans = ans(:,:,2:end);











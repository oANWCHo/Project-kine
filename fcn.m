function [q, flag] = fcn(end_effector)
    % ข้อมูลความยาวของลิงก์ (5 หุ่นยนต์)
    L = [0.6, 0.6, 0.6; 
         1, 1, 1; 
         1, 1, 1; 
         1, 1, 1; 
         1, 1, 1];

    persistent f
    if isempty(f)
        f = 0;
    end
    flag = 0;
    % ตรวจสอบว่าข้อมูลอินพุตมีขนาด 3x5 หรือ 4x5 หรือไม่
    if size(end_effector, 1) < 3 || size(end_effector, 2) ~= 5
        error('Input must be a 3x5 or 4x5 array (x, y, z, [theta] for 5 robots)');
    end

    % เตรียมพื้นที่สำหรับผลลัพธ์ (q1, q2, q3 สำหรับหุ่นยนต์ 5 ตัว)
    q = zeros(3, 5);

    % วนลูปคำนวณ Inverse Kinematics สำหรับหุ่นยนต์แต่ละตัว
    for i = 1:size(end_effector, 2)
        % ดึงข้อมูล x, y, z จาก end_effector
        x = end_effector(1, i);
        y = end_effector(2, i);
        z = end_effector(3, i);
        
        % ตรวจสอบว่ามี theta หรือไม่
        % if size(end_effector, 1) >= 4
        %     theta = end_effector(4, i);
        % else
        %     theta = [];
        % end
        theta = [];
        % Adjust target position for base offset L0
        y_prime = y - 1.1;

        % ความยาวของลิงก์
        L1 = L(3,1);
        L2 = L(3,2);
        L3 = L(3,3);

        if isempty(theta)
            % ค้นหาค่า q3 ที่เหมาะสม

            % กำหนดฟังก์ชันความผิดพลาด
            error_function = @(q3) compute_error(q3, y_prime, z, y, L1, L2, L3);

            % ค้นหาค่า q3 ที่ทำให้ความผิดพลาดต่ำสุดในช่วง [-pi, pi]
            options = optimset('TolX',1e-6);
            [q3_opt, error_min] = fminbnd(error_function, -pi, pi, options);

            % ใช้ q3_opt เป็น q3
            q3 = q3_opt;

            % คำนวณตำแหน่งข้อมือ (wrist position)
            y_wrist = y_prime - L3 * cos(q3);
            z_wrist = z - L3 * sin(q3);

            % คำนวณระยะทาง r
            r = sqrt(y_wrist^2 + z_wrist^2);

            % ตรวจสอบว่าตำแหน่งอยู่ในพื้นที่ที่หุ่นยนต์สามารถเข้าถึงได้หรือไม่
            if r > (L1 + L2) || r < abs(L1 - L2)
                % Return NaN if out of reach
                q(:, i) = NaN;
                continue;
            end

            % คำนวณ q1 (Base joint angle)
            q1 = atan2(z_wrist, y_wrist);

            % กฎโคไซน์ในการคำนวณ q2 (Elbow-up configuration)
            cos_q2 = (r^2 - L1^2 - L2^2) / (2 * L1 * L2);
            if abs(cos_q2) > 1
                % Numerical instability, return NaN
                q(:, i) = NaN;
                continue;
            end
            q2 = acos(cos_q2); % Elbow-up configuration

            % คำนวณเพื่อยืนยันผลลัพธ์
            y_calc = L1 * cos(q1) + L2 * cos(q1 + q2) + L3 * cos(q1 + q2 + q3) + 1.1;
            z_calc = L1 * sin(q1) + L2 * sin(q1 + q2) + L3 * sin(q1 + q2 + q3);

            % จัดเก็บผลลัพธ์ใน q
            q(:, i) = [q1; q2; q3]*180/pi;
        else
            % ใช้ theta ที่ให้มา

            % คำนวณตำแหน่งข้อมือ (wrist position)
            y_wrist = y_prime - L3 * cos(theta);
            z_wrist = z - L3 * sin(theta);

            % คำนวณระยะทาง r
            r = sqrt(y_wrist^2 + z_wrist^2);

            % ตรวจสอบว่าตำแหน่งอยู่ในพื้นที่ที่หุ่นยนต์สามารถเข้าถึงได้หรือไม่
            if r > (L1 + L2) || r < abs(L1 - L2)
                % Return NaN if out of reach
                q(:, i) = NaN;
                continue;
            end

            % คำนวณ q1 (Base joint angle)
            q1 = atan2(z_wrist, y_wrist);

            % กฎโคไซน์ในการคำนวณ q2 (Elbow-up configuration)
            cos_q2 = (r^2 - L1^2 - L2^2) / (2 * L1 * L2);
            if abs(cos_q2) > 1
                % Numerical instability, return NaN;
                q(:, i) = NaN;
                continue;
            end
            q2 = acos(cos_q2); % Elbow-up configuration

            % คำนวณ q3
            q3 = theta - q1 - q2;

            % คำนวณเพื่อยืนยันผลลัพธ์
            y_calc = L1 * cos(q1) + L2 * cos(q1 + q2) + L3 * cos(q1 + q2 + q3) + 1.1;
            z_calc = L1 * sin(q1) + L2 * sin(q1 + q2) + L3 * sin(q1 + q2 + q3);

            % จัดเก็บผลลัพธ์ใน q
            q(:, i) = [q1; q2; q3]*180/pi;
        end

        % แสดงผลการคำนวณและเปรียบเทียบกับเป้าหมาย
        fprintf('Robot %.0f\n', i);
        fprintf('Target Position: y = %.4f, z = %.4f\n', y, z);
        fprintf('Calculated Position: y = %.4f, z = %.4f\n', y_calc, z_calc);
        fprintf('Computed Angles (degrees): q1 = %.4f, q2 = %.4f, q3 = %.4f\n', q1*180/pi, q2*180/pi, q3*180/pi);
    end
end

function error = compute_error(q3, y_prime, z, y_target, L1, L2, L3)
    % คำนวณตำแหน่งข้อมือ (wrist position)
    y_wrist = y_prime - L3 * cos(q3);
    z_wrist = z - L3 * sin(q3);

    % คำนวณระยะทาง r
    r = sqrt(y_wrist^2 + z_wrist^2);

    % ตรวจสอบว่าตำแหน่งอยู่ในพื้นที่ที่หุ่นยนต์สามารถเข้าถึงได้หรือไม่
    if r > (L1 + L2) || r < abs(L1 - L2)
        error = Inf;
        return;
    end

    % คำนวณ q1 (Base joint angle)
    q1 = atan2(z_wrist, y_wrist);

    % กฎโคไซน์ในการคำนวณ q2 (Elbow-up configuration)
    cos_q2 = (r^2 - L1^2 - L2^2) / (2 * L1 * L2);
    if abs(cos_q2) > 1
        error = Inf;
        return;
    end
    q2 = acos(cos_q2); % Elbow-up configuration

    % คำนวณตำแหน่งปลายทางที่คำนวณได้
    y_calc = L1 * cos(q1) + L2 * cos(q1 + q2) + L3 * cos(q1 + q2 + q3) + 1.1;
    z_calc = L1 * sin(q1) + L2 * sin(q1 + q2) + L3 * sin(q1 + q2 + q3);

    % คำนวณความผิดพลาดระหว่างตำแหน่งที่คำนวณได้และตำแหน่งเป้าหมาย
    error = sqrt((y_calc - y_target)^2 + (z_calc - z)^2);
end

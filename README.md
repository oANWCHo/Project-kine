# **KINEMATICS OF A 3-DOF ROBOTIC FINGER FOR CAPTURING OBJECT**

https://github.com/user-attachments/assets/a79653ee-c063-41ca-95e4-d949facc65fb

  This study is interested in simulating the structure of a robotic finger with three degrees of freedom (3-DOF) and the ability to grasp objects in various forms. The design of all robotic fingers will be carried out using a tool that can efficiently simulate and test the structure. Then, the Forward Kinematics will be created for all five fingers on the same structural base to enable accurate finger positioning and movement in three dimensions. In addition, the Inverse Kinematics section is studied to calculate the Joint Position of each finger in detail. In addition, a specific algorithm that controls the grasping of objects in various forms is developed by applying the study of Quintic Trajectory to make the movement smooth and take the same time in each joint.

  This project is a part of FRA333 Robot Kinematics @ Institute of Field Robotics, King Mongkut’s University of Technology Thonburi.
## **Objectives**
1) To study the creation of robotic fingers and simulate finger movements.
2) To study a 3-DOF robotic finger system that can grasp spherical and cylindrical objects of various sizes.
3) To study the relationship between the parameters of different shapes of objects and the position of each fingertip.
4) To research and apply Quintic Trajectory in finger movement control system.

## **Scopes**

1) The movement of a 3-DOF finger system is simulated.
    * Use Quintic Trajectory to pass the position of each joint only to calculate Forward Kinematics.
    * A study was conducted on Inverse Kinematics to calculate the Joint Position of each finger.
    * There is no study on Dynamics.
2) Scope of 3-DOF Robotic Finger
    * It is a Planar Robot or a robot that moves on a plane.
    * 3-DOF Robotic Finger has five fingers, which together form one human hand.
3) There are demonstrations of holding objects and shapes of different sizes, such as cylinders and spheres.
4) Quintic Trajectory is used to control finger movement to make it look natural.
5) The simulation was performed using the Simscape tool on MATLAB.

## **Installation**
clone this 
```
git clone https://github.com/oANWCHo/Project-kine.git
```
or download .zip 

( This project requires MATLAB version 2024b or later. If you don't have it, please download it first.)
## **Usage**
1) Open hand.slx file.
2) Double-click at Human_Hand Block.

<img src="https://github.com/user-attachments/assets/123a1845-e977-4aee-a666-d8916f9026fb" width="480">

3) Fill a Parameters ( Radius, Length, Mode 1=Spherical Power Grasping, 2=Spherical Precision Grasping, 3=Cylindrical Power Grasping, 4 = Cylindrical Precision Grasping )

<img src="https://github.com/user-attachments/assets/455d2198-b055-4023-b096-8decaa8f2491" width="480">

4) Set up an Object in a Human hand block

if the sphere does this

<img src="https://github.com/user-attachments/assets/dbdcb955-57c5-4b65-b818-fa1b24caca9f" width="480">

Cylindrical do like this. 

<img src="https://github.com/user-attachments/assets/6fdfb976-ea5a-4cba-9ab2-16501129bd45" width="480">

**Always comment out blocks that are not used.**

5) Click Run 

<img src="https://github.com/user-attachments/assets/5818b9ad-40d7-4ede-a7b8-bd2d03f8704f" width="480">

## **Methodology**
### **1. Forward Kinematic of 3-DOF Planar Robot**

<img src="https://github.com/user-attachments/assets/95b06245-4b5a-4fde-8ef2-2b8a1f76756f" width="480">

$X = l_1 \cos(\theta_1) + l_2 \cos(\theta_1 + \theta_2) + l_3 \cos(\theta_1 + \theta_2 + \theta_3)$

$Y = l_1 \sin(\theta_1) + l_2 \sin(\theta_1 + \theta_2) + l_3 \sin(\theta_1 + \theta_2 + \theta_3)$

**Where:**

$l_1, l_2, l_3$: Lengths of the robot arm's links.  

$\theta_1, \theta_2, \theta_3$: Joint angles in radians.

### **2. Inverse Kinematic of 3-DOF Planar Robot**

**2.1 Calculate Wrist Position** The wrist position is calculated by compensating for the length of the third link $L_3$:

<img src="https://github.com/user-attachments/assets/77c1b9a8-6a83-4fbb-b3ae-a9ae84c4937b" width="480">

$x_{\text{wrist}} = x - L_3 \cdot \cos(q_{\text{total}})$

$y_{\text{wrist}} = y - L_3 \cdot \sin(q_{\text{total}})$

**2.2 Calculate q1**

<img src="https://github.com/user-attachments/assets/a9453bed-2560-46dd-8bd7-1793d1d7a518" width="480">

$r = \sqrt{y_{\text{wrist}}^2 + z_{\text{wrist}}^2}$

$\alpha = \text{atan2}(z_{\text{wrist}}, y_{\text{wrist}})$

$\cos(\beta) = \frac{L_1^2 + r^2 - L_2^2}{2 L_1 r}$

$q_1 = \alpha - \beta$

**2.3 Calculate q2**

<img src="https://github.com/user-attachments/assets/209f5d17-2987-43e9-8383-2bd4504d362c" width="480">

$\cos(q_2) = \frac{r^2 - L_1^2 - L_2^2}{2 L_1 L_2}$

$q_2 = \cos^{-1}(\cos(q_2))$

**2.4 Calculate q3**

$q_3 = q_{\text{total}} - q_1 - q_2$

### **3. Quintic Polynomial Trajectory**

A quintic polynomial is a 5th-order polynomial, expressed in its general form as:

$\theta(t) = a_0 + a_1 t + a_2 t^2 + a_3 t^3 + a_4 t^4 + a_5 t^5$

The first derivative of the polynomial is:

$\dot{\theta}(t) = a_1 + 2a_2 t + 3a_3 t^2 + 4a_4 t^3 + 5a_5 t^4$

The second derivative of the polynomial is:

$\ddot{\theta}(t) = 2a_2 + 6a_3 t + 12a_4 t^2 + 20a_5 t^3$

Where $a_0, a_1, a_2, a_3, a_4$ and $a_5$ are coefficients, and $a_5 \neq 0$ to ensure the polynomial is of 5th order.

**Solving for Coefficients**

To determine the coefficients of the polynomial, we apply the following boundary conditions:
- $\theta(t_0) = \theta_0$
- $\theta(t_f) = \theta_f$
- $\dot{\theta}(t_0) = \dot{\theta}(t_f) = 0$
- $\ddot{\theta}(t_0) = \ddot{\theta}(t_f) = 0$

Using these conditions, the coefficients are derived as:

$a_0 = \theta_0$

$a_1 = 0$

$a_2 = 0$

$a_3 = \frac{10(\theta_f - \theta_0)}{t_f^3}$

$a_4 = \frac{-15(\theta_f - \theta_0)}{t_f^4}$

$a_5 = \frac{6(\theta_f - \theta_0)}{t_f^5}$

The quintic polynomial with the above coefficients satisfies the specified boundary conditions, ensuring smooth transitions in position ($\theta(t) \$), velocity ($\dot{\theta}(t) \$), and acceleration ($\ddot{\theta}(t) \$).

### 4. Grasping Method

**4.1 Power grasping** is a grasping style focused on strength and stability. Fingers and Thumbs wrap around the object.

<img src="https://media.discordapp.net/attachments/1302279276472696842/1314220056187764786/image.png?ex=6752fa4e&is=6751a8ce&hm=cfd3608f392ac1c540849589a0f8dee98201150de8e878d5255066e1a8ab7584&=&format=webp&quality=lossless&width=445&height=427" width="480">

**4.2 Precision grasping** is a grasping style focused on agility and precision. Forefingers and thumb hold the object.

<img src="https://media.discordapp.net/attachments/1302279276472696842/1314220122293932054/image.png?ex=6752fa5e&is=6751a8de&hm=11f7388a8a67969a7aabb3ce614fee4044f2b568f3c0f5e37263ec1c789525ce&=&format=webp&quality=lossless&width=448&height=408" width="480">

### **5. Precision grasping taskspace calculation**

The pink dot is the point where the fingertip touches the object and the white dot is the origin (0, 0).

### **5.1 Spherical Object**

<img src="https://github.com/user-attachments/assets/034aa912-6b26-43db-a5d7-e8b80a98da7e" width="480">
<img src="https://github.com/user-attachments/assets/16c031e2-a24b-4b04-bf60-44b75245563b" width="480">

**Point 1 (Pinky Finger)**

$x = 1.2$

$y = \sqrt{R^2 - 1.2^2}$

$z = R$

**Point 2 (Ring Finger)**

$x = 0.6$

$y = \sqrt{R^2 - 0.6^2}$

$z = R$

**Point 3 (Middle Finger)**

$x = 0$

$y = R$

$z = R$

**Point 4 (Index Finger)**

$x = -0.6$

$y = \sqrt{R^2 - 0.6^2}$

$z = R$

**Point 5 (Thumb)**

$R^2 = 0.6^2 + r^2 - 2(0.6)(r)(cos(\frac{5\pi}{6}))$

$r = \frac{-2(0.6)(cos(\frac{5\pi}{6}))+\sqrt{(2(0.6)(r)(cos(\frac{5\pi}{6})))^2-4(1)(0.6^2-R^2)}}{2}$

$x = -0.6 - rcos(\frac{\pi}{3})$

$y = rtan(\frac{\pi}{3})$

$z = R$

### **5.2 Cylindrical Object**

### **Type 1**

<img src="https://github.com/user-attachments/assets/2d973978-6ec5-41f5-9a2b-67f63e29aa58" width="480">
<img src="https://github.com/user-attachments/assets/6b3e7766-6616-4d45-b9af-e1e57ea305d1" width="480">

**Point 1 (Pinky Finger)**

$x = 1.2$

$y = R$

$z = R$

**Point 2 (Ring Finger)**

$x = 0.6$

$y = R$

$z = R$

**Point 3 (Middle Finger)**

$x = 0$

$y = R$

$z = R$

**Point 4 (Index Finger)**

$x = -0.6$

$y = R$

$z = R$

**Point 5 (Thumb)**

$x = -0.6 - Rtan(\frac{\pi}{6})$

$y = R$

$z = R$

### **Type 2**

<img src="https://github.com/user-attachments/assets/590ba7ef-6bea-430a-b7aa-a609037150ea" width="480">
<img src="https://github.com/user-attachments/assets/a37f07b9-de5b-421e-bc89-cd4bc52b2967" width="480">

**Point 1 (Pinky Finger)**

$x = 1.2$

$y = R$

$z = R$

**Point 2 (Ring Finger)**

$x = 0.6$

$y = R$

$z = R$

**Point 3 (Middle Finger)**

$x = 0$

$y = R$

$z = R$

**Point 4 (Index Finger)**

$x = -0.6$

$y = R$

$z = R$

**Point 5 (Thumb)**

$x = \frac{L}{2}$

$y = xsin(\frac{\pi}{6})$

$z = R$

**6. How to find Power grasping**

Find the fingertip of all 5 fingers like this.

<img src="https://github.com/user-attachments/assets/da1ec475-7d04-4a12-be0f-d917dd6bb607" width="480">

We write the MATLAB code to collect this data in various shapes and sizes like this.

https://github.com/user-attachments/assets/46f6ebce-93a0-4313-8e78-e6f822e48ba9

Lastly, we use this data to fit the equation of fingertip position and the parameter of each shape.

<img src="https://github.com/user-attachments/assets/2f356224-5f17-4686-9e90-57f0b20cf8b5" width="480">

Example of Equation of Power grasping

<img src="https://github.com/user-attachments/assets/ffe1d485-4a23-46ff-a691-e8f5895f81ae" width="480">

## Implementation

It is applied in simulink which has a total of 4 blocks as follows.

<img src="https://github.com/user-attachments/assets/da1ec475-7d04-4a12-be0f-d917dd6bb607" width="480">
<img src="https://github.com/user-attachments/assets/99299aea-9687-42cb-9dd6-876f53cce05b" width="600">

The simulation works as system architecture follows.

<img src="https://github.com/user-attachments/assets/8c255cf8-08d7-4074-a063-277d341c2c98" width="600">

### 1. Forward Kinematics of Hand

<img src="https://github.com/user-attachments/assets/acaf53b8-bf32-4a9d-8935-3f11097b84c2" width="600">

The palm of the hand is cylindrical in shape with a radius of 1.5 meters and a length of 0.5 meters.

Each finger segment of the index finger, middle finger, ring finger, and pinky finger has 1 meter length. Each finger segment of the thumb has a 0.6-meter length.

Transformation of the MCP joint of each finger to the Center of the palm is the following.

$T_{MCP.pinky} = T_x(1.2)T_y(0.4)$

$T_{MCP.ring} = T_x(0.6)T_y(1.0)$

$T_{MCP.middle} = T_y(1.1)$

$T_{MCP.index} = T_x(-0.6)T_y(1.0)$

$T_{MCP.thumb} = T_x(-0.6)R_z(\frac{\pi}{3})T_y(0.8)$

### 2. Send End Effector Position

We have 4 modes of grasping and each grasping has different boundaries as follows

Mode 1 : Spherical Power Grasping
the radius ranges from 1.50 to 3.00 m.

Mode 2 : Spherical Precision Grasping
the radius ranges from 1.20 to 1.70 m.

Mode 3 : Cylindrical Power Grasping
radius ranges from 1.00 to 2.90 m, with lengths ranging from 2.40 to 5.00 m.

Mode 4 : Cylindrical Precision Grasping
where the thumb is at the cross-section, the radius ranges from 1.00 to 1.50 m, and the length ranges from 2.40 to 4.00 m. 
where the thumb is on the curve, the radius is 1.00 m, and the length is greater than 4.5 m.

### 3. Inverse Kinematics

```matlab
% Link Length
L1 = L(i, 1);
L2 = L(i, 2);
L3 = L(i, 3);

% calculate in 2 DOF
y_wrist = y - L3 * cos(q_total);
z_wrist = z - L3 * sin(q_total);

r = sqrt(y_wrist^2 + z_wrist^2);
r = round(r * 100) / 100;

% =================================================================================================

% Determine if the position falls within the robot's workspace boundaries.่
if r - (L1 + L2) > 0.01 || r - abs(L1 - L2) < 0.01
    fprintf('Robot %.0f: Out of reach. %.4f\n\n', i, r);
    q(:, i) = NaN;
    continue;
end

% =================================================================================================

% calculate q1
alpha = atan2(z_wrist, y_wrist);
cos_beta = (L1^2 + r^2 - L2^2) / (2 * L1 * r);

if abs(cos_beta) > 1           
    fprintf('Robot %.0f: No valid configuration. It %.4f\n\n', i, cos_beta);
    q(:, i) = NaN;
    continue;
end
beta = acos(cos_beta);

q1 = alpha - beta;
q1 = mod(q1, 2*pi);

% =================================================================================================

% calculate q2
cos_q2 = (r^2 - L1^2 - L2^2) / (2 * L1 * L2);

if abs(cos_q2) > 1
    fprintf('Robot %.0f: No valid configuration. It %.4f\n\n', i, abs(cos_q2));
    q(:, i) = NaN;
    continue;
end
q2 = acos(cos_q2);
q2 = mod(q2, 2*pi);

% =================================================================================================

% calculate q3
q3 = q_total - q1 - q2;

% store q
q(:, i) = [q1; q2; q3] * 180 / pi;

% =================================================================================================
```

### 4. Quintic Trajectory

```matlab
% trajectory generation

% define time of trajectory
tf = 3; 

if run_started == 0 && button_state == 1
    run_started = 1;
    t_start = t;
    
    % compute delta_q for each joint
    delta_q = target_q - curr_q;
    
    % compute coefficients for quintic polynomial trajectory
    a0 = curr_q;
    a1 = zeros(rows, cols);
    a2 = zeros(rows, cols);
    a3 = 10 * delta_q / (tf^3);
    a4 = -15 * delta_q / (tf^4);
    a5 = 6 * delta_q / (tf^5);
end
```

```matlab
% trajectory evaluation
q = curr_q;
if run_started == 1
    elapsed_time = t - t_start;
    if elapsed_time <= tf

        % compute q in quintic trajectory form
        q = a0 + a1 * elapsed_time + a2 * (elapsed_time^2) + ...
            a3 * (elapsed_time^3) + a4 * (elapsed_time^4) + a5 * (elapsed_time^5);
    else

        % When the end time is reached, let q be equal to target.
        q = target_q;
        run_started = 0;
    end
    % update current q
    curr_q = q;
end
```

## Results

### 1. Spherical power grasping

https://github.com/user-attachments/assets/17e4b689-3daa-441a-9710-1fffafa6c29f

### 2. Spherical precision grasping

https://github.com/user-attachments/assets/a4045ff5-c3ef-421f-bf97-80fe2c322b2a

### 3. Cylindrical power grasping

https://github.com/user-attachments/assets/f892ef29-a3c5-4d45-9996-d4bfa16f61fa

### 4. Cylindrical precision grasping

https://github.com/user-attachments/assets/cafd1a16-daf2-400a-b00c-be2f1acdfa68

## Summary

This simulation models two types of object grasping: spherical and cylindrical. For precision grasping of a sphere, the radius ranges from 1.20 to 1.70 m. 
For cylindrical boundary grasping, where the thumb is at the cross-section, the radius ranges from 1.00 to 1.50 m, and the length ranges from 2.40 to 4.00 m. 
For cylindrical boundary grasping, where the thumb is on the curve, the radius is 1.00 m, and the length is greater than 4.5 m. For power grasping, the radius ranges from 1.50 to 3.00 m, 
and another cylindrical boundary radius ranges from 1.00 to 2.90 m, with lengths ranging from 2.40 to 5.00 m. This simulation was conducted in Simulink, starting with the send end effector position to calculate inverse kinematics and control the smoothness of the human hand with trajectory, it performed correctly to meet all the specified objectives.

## References
1) Unknown Author. (n.d.). Design of a 3-DOF robotic arm. Retrieved November 3, 2024, from https://www.researchgate.net/publication/313543363_Design_of_a_3_DOF_robotic_arm/link/5D24A8A2299BF1547CA6056D/DOWNLOAD?_TP=EYJJB250ZXH0IJP7INBHZ2UIOIJWDWJSAWNHDGLVBIISINBYZXZPB3VZUGFNZSI6BNVSBH19
2) Vasičkaninová, A., Bakošová, M., & Mészáros, A. (2020). Cascade fuzzy control of a tubular chemical reactor. In R. Smith (Ed.), *Advanced Control Systems for Chemical Reactors* (pp. 150-165). Elsevier. Retrieved November 3, 2024, from https://www.sciencedirect.com/science/article/abs/pii/B9780323958790501715
3) Xiaojie Zhao, Maoli Wang, Ning Liu and Yongwei Tang. (2017). Trajectory Planning for 6-DOF Robotic Arm Based on Quintic Polynormial. Retrieved November 3, 2024, from https://www.atlantis-press.com/article/25881131.pdf
4) Erika Nathalia Gama and Oscar Fernando Aviles. (2014). Anthropomorphic robotic hands: a review. Retrieved November 21, 2024, from https://www.redalyc.org/pdf/852/85232596007.pdf



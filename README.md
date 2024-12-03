# KINEMATICS OF A 3-DOF ROBOTIC FINGER FOR CAPTURING OBJECT
  This study is interested in simulating the structure of a robotic finger with three degrees of freedom (3-DOF) and the ability to grasp objects in various forms. The design of all robotic fingers will be carried out using a tool that can efficiently simulate and test the structure. Then, the Forward Kinematics will be created for all five fingers on the same structural base to enable accurate finger positioning and movement in three dimensions. In addition, the Inverse Kinematics section is studied to calculate the Joint Position of each finger in detail. In addition, a specific algorithm that controls the grasping of objects in various forms is developed by applying the study of Quintic Trajectory to make the movement smooth and take the same time in each joint.

  This project is a part of FRA333 Robot Kinematics @ Institute of Field Robotics, King Mongkut’s University of Technology Thonburi.
## Objectives
1)	To study the creation of robotic fingers and simulate finger movements.
2)	To study a 3-DOF robotic finger system that can grasp spherical and cylindrical objects of various sizes.
3)	To study the relationship between the parameters of different shapes of objects and the position of each finger tip.
4)	To study and apply Quintic Trajectory in finger movement control system.
## Scopes
1)	The movement of a 3-DOF finger system is simulated.
    * Use Quintic Trajectory to pass the position of each joint only to calculate Forward Kinematics.
    * A study was conducted on Inverse Kinematics to calculate the Joint Position of each finger.
    * There is no study on Dynamics.
3)	Scope of 3-DOF Robotic Finger
    * It is a Planar Robot or a robot that moves on a plane.
    * 3-DOF Robotic Finger has 5 fingers in total, which together form one human hand.
4)	There are demonstrations of holding objects and shapes of different sizes, such as cylinders and spheres.
    * Sphere
  	* Cylinder
5)	Quintic Trajectory is used to control finger movement to make it look natural.
6)	The simulation was performed using the Simscape tool on MATLAB.
## Installation
## Usage
## Methodology
### 1. Forward Kinematic of 3-DOF Planar Robot

![image](https://github.com/user-attachments/assets/95b06245-4b5a-4fde-8ef2-2b8a1f76756f)

$X = l_1 \cos(\theta_1) + l_2 \cos(\theta_1 + \theta_2) + l_3 \cos(\theta_1 + \theta_2 + \theta_3)$

$Y = l_1 \sin(\theta_1) + l_2 \sin(\theta_1 + \theta_2) + l_3 \sin(\theta_1 + \theta_2 + \theta_3)$

**Where:**

$l_1, l_2, l_3$: Lengths of the robot arm's links.  

$\theta_1, \theta_2, \theta_3$: Joint angles in radians.

### 2. Inverse Kinematic of 3-DOF Planar Robot

### 3. Quintic Polynomial Trajectory


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

**4.1 Power grasping** is a grasping style focused on strength and stability. Finger an Thumbs wrap around the object.

"power grasping image"

**4.2 Precision grasping** is a grasping style focused on agility and precision. Forefingers and thumb hold the object.

"precision grasping image"

### 5. Precision grasping taskspace calculation
### 6. How to find Power grasping taskspace
### 7.
## Implementation
## Results
## Summary
## References
1) Unknown Author. (n.d.). Design of a 3-DOF robotic arm. Retrieved November 3, 2024, from https://www.researchgate.net/publication/313543363_Design_of_a_3_DOF_robotic_arm/link/5D24A8A2299BF1547CA6056D/DOWNLOAD?_TP=EYJJB250ZXH0IJP7INBHZ2UIOIJWDWJSAWNHDGLVBIISINBYZXZPB3VZUGFNZSI6BNVSBH19
2) Vasičkaninová, A., Bakošová, M., & Mészáros, A. (2020). Cascade fuzzy control of a tubular chemical reactor. In R. Smith (Ed.), *Advanced Control Systems for Chemical Reactors* (pp. 150-165). Elsevier. Retrieved November 3, 2024, from https://www.sciencedirect.com/science/article/abs/pii/B9780323958790501715
3) Xiaojie Zhao, Maoli Wang, Ning Liu and Yongwei Tang. (2017). Trajectory Planning for 6-DOF Robotic Arm Based on Quintic Polynormial. Retrieved November 3, 2024, from https://www.atlantis-press.com/article/25881131.pdf
4) Erika Nathalia Gama and Oscar Fernando Aviles. (2014). Anthropomorphic robotic hands: a review. Retrieved November 21, 2024, from https://www.redalyc.org/pdf/852/85232596007.pdf



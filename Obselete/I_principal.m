function [alpha_1_rad,I_1,I_2,alpha_3_rad,I_3,I_34]=I_principal(I_y,I_z,I_yz)

[alpha_1_rad,I_34]=cart2pol((I_y-I_z)/2,-I_yz);
alpha_1_rad=alpha_1_rad/2;
I_3=(I_y+I_z)/2;
I_1=I_3+I_34;
I_2=I_3-I_34;
alpha_3_rad=pi/4-alpha_1_rad;
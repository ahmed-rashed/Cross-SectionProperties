clc
clear all

r1=rand;
y1=203e-3/2+27.4e-3;
z1=254e-3/2+7.7e-3-14.7e-3;
z2=254e-3/2+7.7e-3-14.1e-3;
cA_vec=[cArea(1450e-6,0.278e-6,0.799e-6,r1)
    cArea(2610e-6,0.633e-6,15e-6,0)
    cArea(1450e-6,0.278e-6,0.799e-6,-r1)
    cArea(4810e-6,51.2e-6,2.8e-6,0)
    cArea(1450e-6,0.278e-6,0.799e-6,-r1)
    cArea(2610e-6,0.633e-6,15e-6,0)
    cArea(1450e-6,0.278e-6,0.799e-6,r1)];
y_vec=[y1;0;-y1;0;y1;0;-y1];
z_vec=[z1;z2;z1;0;-z1;-z2;-z1];
y_hat_vec=[y1;0;-y1;0;y1;0;-y1]+randn;
z_hat_vec=[z1;z2;z1;0;-z1;-z2;-z1]+randn;

sec1=cCompCrossSec(cA_vec,y_hat_vec,z_hat_vec)
A=sec1.A
y_bar=sec1.y_bar
z_bar=sec1.z_bar
Iy_hat=sec1.Iy_hat
Iz_hat=sec1.Iz_hat
Iyz_hat=sec1.Iyz_hat
I_p_hat=sec1.I_p_hat
Iy=sec1.Iy
Iz=sec1.Iz
Iyz=sec1.Iyz
I_p=sec1.I_p

cA=cArea(sec1)
rho_y=cA.rho_y
rho_z=cA.rho_z
Sy=cA.Sy(254e-3/2+7.7e-3)

sec2=cCompCrossSec_ZSymm(cA_vec([1,2,4,5,6]),y_vec([1,2,4,5,6]),z_hat_vec([1,2,4,5,6]))
sec2.A-sec1.A
%sec2.y_bar-sec1.y_bar
sec2.z_bar-sec1.z_bar
% sec2.Iy_hat-sec1.Iy_hat
% sec2.Iz_hat-sec1.Iz_hat
% sec2.Iyz_hat-sec1.Iyz_hat
% sec2.I_p_hat-sec1.I_p_hat
sec2.Iy-sec1.Iy
sec2.Iz-sec1.Iz
sec2.Iyz-sec1.Iyz
sec2.I_p-sec1.I_p

sec3=cCompCrossSec_YSymm(cA_vec(1:4),y_hat_vec(1:4),z_vec(1:4))
sec3.A-sec1.A
sec3.y_bar-sec1.y_bar
% sec3.z_bar-sec1.z_bar
% sec3.Iy_hat-sec1.Iy_hat
% sec3.Iz_hat-sec1.Iz_hat
% sec3.Iyz_hat-sec1.Iyz_hat
% sec3.I_p_hat-sec1.I_p_hat
sec3.Iy-sec1.Iy
sec3.Iz-sec1.Iz
sec3.Iyz-sec1.Iyz
sec3.I_p-sec1.I_p

sec4=cCompCrossSec_YZSymm(cA_vec([1,2,4]),y_vec([1,2,4]),z_vec([1,2,4]))
sec4.A-sec1.A
% sec4.y_bar-sec1.y_bar
% sec4.z_bar-sec1.z_bar
% sec4.Iy_hat-sec1.Iy_hat
% sec4.Iz_hat-sec1.Iz_hat
% sec4.Iyz_hat-sec1.Iyz_hat
% sec4.I_p_hat-sec1.I_p_hat
sec4.Iy-sec1.Iy
sec4.Iz-sec1.Iz
sec4.Iyz-sec1.Iyz
sec4.I_p-sec1.I_p

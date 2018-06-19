clc
clear all

%% Example 1.6
r1=randn;
r2=randn;

%Dims in meters
% y1=200;
% z1=250;
% cA_vec=[cArea(3e4,300*100^3/12,100*300^3/12,0)
%     cArea(6e4,100*600^3/12,600*100^3/12,0)
%     cArea(3e4,300*100^3/12,100*300^3/12,0)];

%Dims in mm
y1=200e-3;
z1=250e-3;
cA_vec=[cArea(3e-2,300e-3*100e-3^3/12,100e-3*300e-3^3/12,0)
    cArea(6e-2,100e-3*600e-3^3/12,600e-3*100e-3^3/12,0)
    cArea(3e-2,300e-3*100e-3^3/12,100e-3*300e-3^3/12,0)];

y_vec=[y1;0;-y1];
z_vec=[z1;0;-z1];
y_hat_vec=y_vec+r1;
z_hat_vec=z_vec+r2;

sec1=cCompCrossSec(cA_vec,y_hat_vec,z_hat_vec)
A=sec1.A
y_bar_error=sec1.y_bar-r1
z_bar_error=sec1.z_bar-r2
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
Sy=cA.Sy(300)
Sz=cA.Sz(350)

sec2=cCompCrossSec_AntiSymm_ZSymm(cA_vec([1,2]),y_vec([1,2]),z_vec([1,2]))
sec2.A-sec1.A
%sec2.y_bar-sec1.y_bar
%sec2.z_bar-sec1.z_bar
% sec2.Iy_hat-sec1.Iy_hat
% sec2.Iz_hat-sec1.Iz_hat
% sec2.Iyz_hat-sec1.Iyz_hat
% sec2.I_p_hat-sec1.I_p_hat
sec2.Iy-sec1.Iy
sec2.Iz-sec1.Iz
sec2.Iyz-sec1.Iyz
sec2.I_p-sec1.I_p

sec3=cCompCrossSec_AntiSymm_YSymm(cA_vec([1,2]),y_vec([1,2]),z_vec([1,2]))
sec3.A-sec1.A
%sec3.y_bar-sec1.y_bar
% sec3.z_bar-sec1.z_bar
% sec3.Iy_hat-sec1.Iy_hat
% sec3.Iz_hat-sec1.Iz_hat
% sec3.Iyz_hat-sec1.Iyz_hat
% sec3.I_p_hat-sec1.I_p_hat
sec3.Iy-sec1.Iy
sec3.Iz-sec1.Iz
sec3.Iyz-sec1.Iyz
sec3.I_p-sec1.I_p
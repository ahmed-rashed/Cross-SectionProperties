clc
clear all %#ok<*CLALL>

% Problem 1.2-e
A_vec=[1450;2610;1450;4810;1450;2610;1450]*1e-6;
Iy_vec=[0.278;0.633;0.278;51.2;0.278;0.633;0.278]*1e-6;
Iz_vec=[0.799;15;0.799;2.8;0.799;15;0.799]*1e-6;
Iyz_hat_1=-tan(2*(atan(.413)+pi/2))*(Iy_vec(1)-Iz_vec(1))/2;
Iyz_vec=[Iyz_hat_1;0;-Iyz_hat_1;0;-Iyz_hat_1;0;Iyz_hat_1];
oA_vec=cArea(A_vec,Iy_vec,Iz_vec,Iyz_vec);

y1=203e-3/2+27.4e-3;
z1=254e-3/2+7.7e-3-14.7e-3;
z2=254e-3/2+7.7e-3-14.1e-3;
y_hat_vec=[y1;0;-y1;0;y1;0;-y1];
z_hat_vec=[z1;z2;z1;0;-z1;-z2;-z1];

oSec=cCompositeArea_simple(oA_vec,y_hat_vec,z_hat_vec) %#ok<*NOPTS>

A=oSec.A
y_bar=oSec.y_bar
z_bar=oSec.z_bar
Iy=oSec.Iy
Iz=oSec.Iz
Iyz=oSec.Iyz
Ip=oSec.Ip

oArea=cArea(oSec.A,oSec.Iy,oSec.Iz,oSec.Iyz)
rho_y=oArea.rho_y
rho_z=oArea.rho_z
Sy=oArea.Sy((254/2+7.7)*1e-3)
Sz=oArea.Sz((203/2+76)*1e-3)
oArea_dash=oArea.rotatedArea(deg2rad(5))
alpha1=oArea.alpha1
I1=oArea.I1
I2=oArea.I2
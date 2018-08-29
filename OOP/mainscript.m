clc
clear all

%% Problem 1.2-e
r1=rand;
r2=randn;
r3=randn;

y1=203e-3/2+27.4e-3;
z1=254e-3/2+7.7e-3-14.7e-3;
z2=254e-3/2+7.7e-3-14.1e-3;
oA_vec=[cArea(1450e-6,0.278e-6,0.799e-6,r1)
    cArea(2610e-6,0.633e-6,15e-6,0)
    cArea(1450e-6,0.278e-6,0.799e-6,-r1)
    cArea(4810e-6,51.2e-6,2.8e-6,0)
    cArea(1450e-6,0.278e-6,0.799e-6,-r1)
    cArea(2610e-6,0.633e-6,15e-6,0)
    cArea(1450e-6,0.278e-6,0.799e-6,r1)];
y_vec=[y1;0;-y1;0;y1;0;-y1];
z_vec=[z1;z2;z1;0;-z1;-z2;-z1];
y_hat_vec=y_vec+r2;
z_hat_vec=z_vec+r3;

oSec1=cCompositeArea(oA_vec,y_hat_vec,z_hat_vec)
A=oSec1.A
y_bar_error=oSec1.y_bar-r2
z_bar_error=oSec1.z_bar-r3
Iy_hat=oSec1.Iy_hat
Iz_hat=oSec1.Iz_hat
Iyz_hat=oSec1.Iyz_hat
I_p_hat=oSec1.I_p_hat
Iy=oSec1.Iy
Iz=oSec1.Iz
Iyz=oSec1.Iyz
I_p=oSec1.I_p

oA=cArea(oSec1)
rho_y=oA.rho_y
rho_z=oA.rho_z
Sy=oA.Sy(254e-3/2+7.7e-3)
oA=oA.rotatedArea(pi/2)

oSec2=cCompositeArea_ZSymm (oA_vec([1,2,4,5,6]),y_vec([1,2,4,5,6]),z_hat_vec([1,2,4,5,6]))
oSec2.A-oSec1.A
%oSec2.y_bar-oSec1.y_bar
oSec2.z_bar-oSec1.z_bar
% oSec2.Iy_hat-oSec1.Iy_hat
% oSec2.Iz_hat-oSec1.Iz_hat
% oSec2.Iyz_hat-oSec1.Iyz_hat
% oSec2.I_p_hat-oSec1.I_p_hat
oSec2.Iy-oSec1.Iy
oSec2.Iz-oSec1.Iz
oSec2.Iyz-oSec1.Iyz
oSec2.I_p-oSec1.I_p

oSec3=cCompositeArea_YSymm (oA_vec(1:4),y_hat_vec(1:4),z_vec(1:4))
oSec3.A-oSec1.A
oSec3.y_bar-oSec1.y_bar
% oSec3.z_bar-oSec1.z_bar
% oSec3.Iy_hat-oSec1.Iy_hat
% oSec3.Iz_hat-oSec1.Iz_hat
% oSec3.Iyz_hat-oSec1.Iyz_hat
% oSec3.I_p_hat-oSec1.I_p_hat
oSec3.Iy-oSec1.Iy
oSec3.Iz-oSec1.Iz
oSec3.Iyz-oSec1.Iyz
oSec3.I_p-oSec1.I_p

oSec4=cCompositeArea_YZSymm(oA_vec([1,2,4]),y_vec([1,2,4]),z_vec([1,2,4]))
oSec4.A-oSec1.A
% oSec4.y_bar-oSec1.y_bar
% oSec4.z_bar-oSec1.z_bar
% oSec4.Iy_hat-oSec1.Iy_hat
% oSec4.Iz_hat-oSec1.Iz_hat
% oSec4.Iyz_hat-oSec1.Iyz_hat
% oSec4.I_p_hat-oSec1.I_p_hat
oSec4.Iy-oSec1.Iy
oSec4.Iz-oSec1.Iz
oSec4.Iyz-oSec1.Iyz
oSec4.I_p-oSec1.I_p

%% Example 1.5
y1=-(73.4/2-15.7)*1e-3;
z1=(254/2+7.7-14.1)*1e-3;
cA_vec_half=[cArea(2610e-6,0.633e-6,15e-6,0)
    cArea(4740e-6,37.9e-6,1.39e-6,0)];
y_hat_vec_half=[0;y1];
z_vec_half=[z1;0];

oSec1=cCompositeArea_YSymm (cA_vec_half,y_hat_vec_half,z_vec_half)
A=oSec1.A
y_bar=oSec1.y_bar
z_bar=oSec1.z_bar
Iy_hat=oSec1.Iy_hat
Iz_hat=oSec1.Iz_hat
Iyz_hat=oSec1.Iyz_hat
I_p_hat=oSec1.I_p_hat
Iy=oSec1.Iy
Iz=oSec1.Iz
Iyz=oSec1.Iyz
I_p=oSec1.I_p

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

%Full section
oSec1=cCompositeArea(oA_vec,y_hat_vec,z_hat_vec)
y_bar_error=oSec1.y_bar-r2
z_bar_error=oSec1.z_bar-r3

oA=cArea(oSec1)
oA_Rotated=oA.rotatedArea(pi/2)

%Z Symmetry
iindex=[1,2,4,5,6];
oArea_vec_half=oA_vec(iindex);
y_vec_half=y_vec(iindex);
z_hat_vec_half=z_hat_vec(iindex);
oSec2=cCompositeArea_ZSymm(oArea_vec_half,y_vec_half,z_hat_vec_half)
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
[oSec2.get_oArea_vec.A]-[oArea_vec_half.A]
[oSec2.get_oArea_vec.Iy]-[oArea_vec_half.Iy]
[oSec2.get_oArea_vec.Iz]-[oArea_vec_half.Iz]
[oSec2.get_oArea_vec.Iyz]-[oArea_vec_half.Iyz]

%Y Symmetry
iindex=1:4;
oArea_vec_half=oA_vec(iindex);
y_hat_vec_half=y_hat_vec(iindex);
z_vec_half=z_vec(iindex);
oSec3=cCompositeArea_YSymm(oArea_vec_half,y_hat_vec_half,z_vec_half)
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
[oSec3.get_oArea_vec.A]-[oArea_vec_half.A]
[oSec3.get_oArea_vec.Iy]-[oArea_vec_half.Iy]
[oSec3.get_oArea_vec.Iz]-[oArea_vec_half.Iz]
[oSec3.get_oArea_vec.Iyz]-[oArea_vec_half.Iyz]

%YZ Symmetry
iindex=[1,2,4];
oArea_vec_half=oA_vec(iindex);
y_vec_half=y_vec(iindex);
z_vec_half=z_vec(iindex);
oSec4=cCompositeArea_YZSymm(oArea_vec_half,y_vec_half,z_vec_half)
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
[oSec4.get_oArea_vec.A]-[oArea_vec_half.A]
[oSec4.get_oArea_vec.Iy]-[oArea_vec_half.Iy]
[oSec4.get_oArea_vec.Iz]-[oArea_vec_half.Iz]
[oSec4.get_oArea_vec.Iyz]-[oArea_vec_half.Iyz]


%% Example 1.5
%Y Symmetry
y1=-(73.4/2-15.7)*1e-3;
z1=(254/2+7.7-14.1)*1e-3;
oArea_vec_half=[cArea(2610e-6,0.633e-6,15e-6,0)
    cArea(4740e-6,37.9e-6,1.39e-6,0)];
y_hat_vec_half=[0;y1];
z_vec_half=[z1;0];

oSec1=cCompositeArea_YSymm (oArea_vec_half,y_hat_vec_half,z_vec_half)
[oSec1.get_oArea_vec.A]-[oArea_vec_half.A]
[oSec1.get_oArea_vec.Iy]-[oArea_vec_half.Iy]
[oSec1.get_oArea_vec.Iz]-[oArea_vec_half.Iz]
[oSec1.get_oArea_vec.Iyz]-[oArea_vec_half.Iyz]
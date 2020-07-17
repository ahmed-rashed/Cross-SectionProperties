clc
clear all %#ok<*CLALL>

%% Problem 1.2-e
r1=rand;
r2=randn;
r3=randn;

A_vec=[1450;2610;1450;4810;1450;2610;1450]*1e-6;
Iy_vec=[0.278;0.633;0.278;51.2;0.278;0.633;0.278]*1e-6;
Iz_vec=[0.799;15;0.799;2.8;0.799;15;0.799]*1e-6;
Iyz_vec=[r1;0;-r1;0;-r1;0;r1];

oA_vec=[cArea(A_vec(1),Iy_vec(1),Iz_vec(1),Iyz_vec(1))
        cArea(A_vec(2),Iy_vec(2),Iz_vec(2),Iyz_vec(2))
        cArea(A_vec(3),Iy_vec(3),Iz_vec(3),Iyz_vec(3))
        cArea(A_vec(4),Iy_vec(4),Iz_vec(4),Iyz_vec(4))
        cArea(A_vec(5),Iy_vec(5),Iz_vec(5),Iyz_vec(5))
        cArea(A_vec(6),Iy_vec(6),Iz_vec(6),Iyz_vec(6))
        cArea(A_vec(7),Iy_vec(7),Iz_vec(7),Iyz_vec(7))];

oA_vec1=cArea(A_vec,Iy_vec,Iz_vec,Iyz_vec);

y1=203e-3/2+27.4e-3;
z1=254e-3/2+7.7e-3-14.7e-3;
z2=254e-3/2+7.7e-3-14.1e-3;

y_vec=[y1;0;-y1;0;y1;0;-y1];
z_vec=[z1;z2;z1;0;-z1;-z2;-z1];
y_hat_vec=y_vec+r2;
z_hat_vec=z_vec+r3;

oA_vec.I_p-oA_vec1.I_p
oA_vec.alpha_1-oA_vec1.alpha_1
oA_vec.alpha_3-oA_vec1.alpha_3
oA_vec.I_34-oA_vec1.I_34
oA_vec.I_3-oA_vec1.I_3
oA_vec.I_4-oA_vec1.I_4
oA_vec.I_1-oA_vec1.I_1
oA_vec.I_2-oA_vec1.I_2
oA_vec.rho_y-oA_vec1.rho_y
oA_vec.rho_z-oA_vec1.rho_z
oA_vec.Sy(2)-oA_vec1.Sy(2)
oA_vec.Sz(3)-oA_vec1.Sz(3)
oA_vec3=oA_vec1.rotatedArea(pi/2*ones(7,1));
oA_vec4=oA_vec1.rotatedArea(pi/2)

[oA_vec3.A]-[oA_vec4.A]
[oA_vec3.Iy]-[oA_vec4.Iy]
[oA_vec3.Iz]-[oA_vec4.Iz]
[oA_vec3.Iyz]-[oA_vec4.Iyz]

%Full section
oSec=cCompositeArea(oA_vec,y_hat_vec,z_hat_vec) %#ok<*NOPTS>
y_bar_error=oSec.get_y_bar-r2
z_bar_error=oSec.get_z_bar-r3

oSec1=cCompositeArea(oA_vec1,y_hat_vec,z_hat_vec) %#ok<*NOPTS>
oSec1.get_y_bar-oSec.get_y_bar
oSec1.get_z_bar-oSec.get_z_bar

oA_Rotated=oSec1.rotatedArea(pi/2)

%Z Symmetry
iindex=[1,2,4,5,6];
oArea_vec_half=oA_vec1(iindex);
y_vec_half=y_vec(iindex);
z_hat_vec_half=z_hat_vec(iindex);
oSec2=cCompositeArea_ZSymm(oArea_vec_half,y_vec_half,z_hat_vec_half)
oSec2.A-oSec1.A
%oSec2.get_y_bar-oSec1.get_y_bar
oSec2.get_z_bar-oSec1.get_z_bar
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
oArea_vec_half=oA_vec1(iindex);
y_hat_vec_half=y_hat_vec(iindex);
z_vec_half=z_vec(iindex);
oSec3=cCompositeArea_YSymm(oArea_vec_half,y_hat_vec_half,z_vec_half)
oSec3.A-oSec1.A
oSec3.get_y_bar-oSec1.get_y_bar
% oSec3.get_z_bar-oSec1.get_z_bar
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
oArea_vec_half=oA_vec1(iindex);
y_vec_half=y_vec(iindex);
z_vec_half=z_vec(iindex);
oSec4=cCompositeArea_YZSymm(oArea_vec_half,y_vec_half,z_vec_half)
oSec4.A-oSec1.A
% oSec4.get_y_bar-oSec1.get_y_bar
% oSec4.get_z_bar-oSec1.get_z_bar
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
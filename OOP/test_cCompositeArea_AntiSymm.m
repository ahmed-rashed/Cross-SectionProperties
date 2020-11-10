clc
clear all %#ok<*CLALL>

% Problem 1.2-f
test_cCompositeArea
clc

%Full section
iindex=[1,2,4,6,7];
oSec1=cCompositeArea(oA_vec(iindex),y_hat_vec(iindex),z_hat_vec(iindex))    %#ok<*NOPTS>

A=oSec1.A
y_bar=oSec1.y_bar
z_bar=oSec1.z_bar
Iy=oSec1.Iy
Iz=oSec1.Iz
Iyz=oSec1.Iyz
Ip=oSec1.Ip
rho_y=oSec1.rho_y
rho_z=oSec1.rho_z
Sy=oSec1.Sy((254/2+7.7)*1e-3)
Sz=oSec1.Sz((203/2+76)*1e-3)
oSec_dash=oSec1.rotatedArea(deg2rad(5))
alpha1=oSec1.alpha1
I1=oSec1.I1
I2=oSec1.I2

%AntiSymm_YSymm
iiindex=iindex(1:3);
oSec2=cCompositeArea_AntiSymm_Y(oA_vec(iiindex),y_hat_vec(iiindex),z_hat_vec(iiindex))
oSec2.A-oSec1.A
% oSec2.get_y_bar-oSec1.get_y_bar
% oSec2.get_z_bar-oSec1.get_z_bar
% oSec2.Iy_hat-oSec1.Iy_hat
% oSec2.Iz_hat-oSec1.Iz_hat
% oSec2.Iyz_hat-oSec1.Iyz_hat
% oSec2.Ip_hat-oSec1.Ip_hat
oSec2.Iy-oSec1.Iy
oSec2.Iz-oSec1.Iz
oSec2.Iyz-oSec1.Iyz
oSec2.Ip-oSec1.Ip
[oSec2.get_oArea_vec.A]-[oA_vec(iiindex).A]
[oSec2.get_oArea_vec.Iy]-[oA_vec(iiindex).Iy]
[oSec2.get_oArea_vec.Iz]-[oA_vec(iiindex).Iz]
[oSec2.get_oArea_vec.Iyz]-[oA_vec(iiindex).Iyz]

%AntiSymm_ZSymm
iiindex=iindex(1:4);
oSec3=cCompositeArea_AntiSymm_Z(oA_vec(iiindex),y_hat_vec(iiindex),z_hat_vec(iiindex))
oSec3.A-oSec1.A
% oSec3.get_y_bar-oSec1.get_y_bar
% oSec3.get_z_bar-oSec1.get_z_bar
% oSec3.Iy_hat-oSec1.Iy_hat
% oSec3.Iz_hat-oSec1.Iz_hat
% oSec3.Iyz_hat-oSec1.Iyz_hat
% oSec3.Ip_hat-oSec1.Ip_hat
oSec3.Iy-oSec1.Iy
oSec3.Iz-oSec1.Iz
oSec3.Iyz-oSec1.Iyz
oSec3.Ip-oSec1.Ip
[oSec3.get_oArea_vec.A]-[oA_vec(iiindex).A]
[oSec3.get_oArea_vec.Iy]-[oA_vec(iiindex).Iy]
[oSec3.get_oArea_vec.Iz]-[oA_vec(iiindex).Iz]
[oSec3.get_oArea_vec.Iyz]-[oA_vec(iiindex).Iyz]
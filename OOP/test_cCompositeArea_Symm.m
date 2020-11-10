clc
clear all %#ok<*CLALL>

% Problem 1.2-e
test_cCompositeArea
clc

%Z Symmetry
iindex=[1,2,4,5,6];
oSec2=cCompositeArea_Symm_Z(oA_vec(iindex),y_hat_vec(iindex)-y_bar,z_hat_vec(iindex))     %#ok<*NOPTS>
oSec2.A-oSec1.A
%oSec2.y_bar-oSec1.y_bar
oSec2.z_bar-oSec1.z_bar
% oSec2.Iy_hat-oSec1.Iy_hat
% oSec2.Iz_hat-oSec1.Iz_hat
% oSec2.Iyz_hat-oSec1.Iyz_hat
% oSec2.Ip_hat-oSec1.Ip_hat
oSec2.Iy-oSec1.Iy
oSec2.Iz-oSec1.Iz
oSec2.Iyz-oSec1.Iyz
oSec2.Ip-oSec1.Ip
[oSec2.get_oArea_vec.A]-[oA_vec(iindex).A]
[oSec2.get_oArea_vec.Iy]-[oA_vec(iindex).Iy]
[oSec2.get_oArea_vec.Iz]-[oA_vec(iindex).Iz]
[oSec2.get_oArea_vec.Iyz]-[oA_vec(iindex).Iyz]

%Y Symmetry
iindex=1:4;
oSec3=cCompositeArea_Symm_Y(oA_vec(iindex),y_hat_vec(iindex),z_hat_vec(iindex)-z_bar)
oSec3.A-oSec1.A
oSec3.y_bar-oSec1.y_bar
% oSec3.z_bar-oSec1.z_bar
% oSec3.Iy_hat-oSec1.Iy_hat
% oSec3.Iz_hat-oSec1.Iz_hat
% oSec3.Iyz_hat-oSec1.Iyz_hat
% oSec3.Ip_hat-oSec1.Ip_hat
oSec3.Iy-oSec1.Iy
oSec3.Iz-oSec1.Iz
oSec3.Iyz-oSec1.Iyz
oSec3.Ip-oSec1.Ip
[oSec3.get_oArea_vec.A]-[oA_vec(iindex).A]
[oSec3.get_oArea_vec.Iy]-[oA_vec(iindex).Iy]
[oSec3.get_oArea_vec.Iz]-[oA_vec(iindex).Iz]
[oSec3.get_oArea_vec.Iyz]-[oA_vec(iindex).Iyz]

%YZ Symmetry
iindex=[1,2,4];
oSec4=cCompositeArea_Symm_YZ(oA_vec(iindex),y_hat_vec(iindex)-y_bar,z_hat_vec(iindex)-z_bar)
oSec4.A-oSec1.A
% oSec4.y_bar-oSec1.y_bar
% oSec4.z_bar-oSec1.z_bar
% oSec4.Iy_hat-oSec1.Iy_hat
% oSec4.Iz_hat-oSec1.Iz_hat
% oSec4.Iyz_hat-oSec1.Iyz_hat
% oSec4.Ip_hat-oSec1.Ip_hat
oSec4.Iy-oSec1.Iy
oSec4.Iz-oSec1.Iz
oSec4.Iyz-oSec1.Iyz
oSec4.Ip-oSec1.Ip
[oSec4.get_oArea_vec.A]-[oA_vec(iindex).A]
[oSec4.get_oArea_vec.Iy]-[oA_vec(iindex).Iy]
[oSec4.get_oArea_vec.Iz]-[oA_vec(iindex).Iz]
[oSec4.get_oArea_vec.Iyz]-[oA_vec(iindex).Iyz]
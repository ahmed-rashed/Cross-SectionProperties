clc
clearvars

%%
A_i=[12,16];
yd_i=[3,1];
zd_i=[1,6];
Iy_i=[6*2^3,2*8^3]/12;
Iz_i=[2*6^3,8*2^3]/12;
Iyz_i=[0,0];
[A,Qyd,Qzd,y_c,z_c,y_i,z_i,sum_Iy_i,sum_Iz_i,sum_Iyz_i,sum_Ayd2,sum_Azd2,sum_Aydzd,sum_Ay2,sum_Az2,sum_Ayz,Iyd,Izd,Iyzd,Iy,Iz,Iyz]=SectionProp(A_i,yd_i,zd_i,Iy_i,Iz_i,Iyz_i)
I_p=Iy+Iz
error_y=Iy-(sum_Az2+sum_Iy_i)
error_z=Iz-(sum_Ay2+sum_Iz_i)
error_yz=Iyz-(sum_Ayz+sum_Iyz_i)

%% Angles (1) & (4)
A_i=[40*10,10*60]
yd_i=[5,30];
zd_i=[30,5];
Iy_i=[10*40^3,60*10^3]/12
Iz_i=[40*10^3,10*60^3]/12
Iyz_i=[0,0];
[A,Qyd,Qzd,y_c,z_c,y_i,z_i,sum_Iy_i,sum_Iz_i,sum_Iyz_i,sum_Ayd2,sum_Azd2,sum_Aydzd,sum_Ay2,sum_Az2,sum_Ayz,Iyd,Izd,Iyzd,Iy,Iz,Iyz]=SectionProp(A_i,yd_i,zd_i,Iy_i,Iz_i,Iyz_i)
I_p=Iy+Iz

%% Angles (2) & (3)
A_i=[(40-8)*8,8*50]
yd_i=[4,25];
zd_i=[8+(40-8)/2,4];
Iy_i=[8*(40-8)^3,50*8^3]/12
Iz_i=[(40-8)*8^3,8*50^3]/12
Iyz_i=[0,0];
[A,Qyd,Qzd,y_c,z_c,y_i,z_i,sum_Iy_i,sum_Iz_i,sum_Iyz_i,sum_Ayd2,sum_Azd2,sum_Aydzd,sum_Ay2,sum_Az2,sum_Ayz,Iyd,Izd,Iyzd,Iy,Iz,Iyz]=SectionProp(A_i,yd_i,zd_i,Iy_i,Iz_i,Iyz_i)
I_p=Iy+Iz

%% Box Section: Exact & full
A_i=[1000,656,656,1000,4820,3000,4820,2400];
yd_i=[30,500-8-16.805,500-8-16.805,30,10+482/2,5,10+482/2,500-4];
z_i=[150-10-15,150-10-11.805,-(150-10-11.805),-(150-10-15),-(150-5),0,150-5,0];
Iy_i=[2.0833e5,86418,86418,2.0833e5,482*10^3/12,10*300^3/12,482*10^3/12,8*300^3/12];
Iz_i=[3.3333e5,1.5354e5,1.5354e5,3.3333e5,10*482^3/12,300*10^3/12,10*482^3/12,300*8^3/12];
Iyz_i=[0,0,0,0,0,0,0,0];
[A,Qyd,Qzd,y_c,z_c,y_i,z_i,sum_Iy_i,sum_Iz_i,sum_Iyz_i,sum_Ayd2,sum_Azd2,sum_Aydzd,sum_Ay2,sum_Az2,sum_Ayz,Iyd,Izd,Iyzd,Iy,Iz,Iyz]=SectionProp(A_i,yd_i,z_i,Iy_i,Iz_i,Iyz_i);
Iy_exact=Iy;

%% Standard Channels cross-section
A_i_half=[2610e-6,4740e-6/2];
yd_i_half=[0,-(73.4/2-15.7)]*1e-3;
z_i_half=[254/2+7.7-14.1,0]*1e-3;
Iy_i_half=[0.633e-6,37.9e-6/2];
Iz_i_half=[15e-6,1.39e-6/2];
Iyz_i_half=[0,0];
[A_half,Qyd_half,Qzd_half,y_c_half,z_c_half,y_i_half,z_i_half,sum_Iy_i_half,sum_Iz_i_half,sum_Iyz_i_half,sum_Ayd2_half,sum_Azd2_half,sum_Aydzd_half,sum_Ay2_half,sum_Az2_half,sum_Ayz_half,Iyd_half,Izd_half,Iyzd_half,Iy_half,Iz_half,Iyz_half]=SectionProp(A_i_half,yd_i_half,z_i_half,Iy_i_half,Iz_i_half,Iyz_i_half);
A_exact=2*A_half
Iy_exact=Iyd_half*2
Izd_exact=Izd_half*2

%% Box Section: Exact & half the section
indices=[6,1,7,2,8];
A_i_half=A_i(indices);
A_i_half(1)=A_i_half(1)/2;A_i_half(5)=A_i_half(5)/2;
yd_i_half=yd_i(indices);
z_i_half=z_i(indices);
z_i_half(1)=300/4;z_i_half(5)=300/4;
Iy_i_half=Iy_i(indices);
Iy_i_half(1)=Iy_i_half(1)/2^3;Iy_i_half(5)=Iy_i_half(5)/2^3;
Iz_i_half=Iz_i(indices);
Iz_i_half(1)=Iz_i_half(1)/2;Iz_i_half(5)=Iz_i_half(5)/2;
Iyz_i_half=Iyz_i(indices);
[A_half,Qyd_half,Qzd_half,y_c_half,z_c_half,y_i_half,z_i_half,sum_Iy_i_half,sum_Iz_i_half,sum_Iyz_i_half,sum_Ayd2_half,sum_Azd2_half,sum_Aydzd_half,sum_Ay2_half,sum_Az2_half,sum_Ayz_half,Iyd_half,Izd_half,Iyzd_half,Iy_half,Iz_half,Iyz_half]=SectionProp(A_i_half,yd_i_half,z_i_half,Iy_i_half,Iz_i_half,Iyz_i_half);
A_exact=2*A_half
Iy_exact=Iyd_half*2
Izd_exact=Izd_half*2
Iz_exact=Iz_half*2


%% Idealized Box Full Section
A_ii=[A_i(1)+A_i(7)/2+A_i(6)/6,A_i(2)+A_i(7)/2+A_i(8)/6,A_i(3)+A_i(5)/2+A_i(8)/6,A_i(4)+A_i(5)/2+A_i(6)/6];
yd_i=[0,500-10/2-8/2,500-10/2-8/2,0];
z_i=[(300-20)/2,(300-20)/2,-(300-20)/2,-(300-20)/2];
Iy_i=zeros(size(A_ii));
Iz_i=zeros(size(A_ii));
Iyz_i=zeros(size(A_ii));
[A,Qyd,Qzd,y_c,z_c,y_i,z_i,sum_Iy_i,sum_Iz_i,sum_Iyz_i,sum_Ayd2,sum_Azd2,sum_Aydzd,sum_Ay2,sum_Az2,sum_Ayz,Iyd,Izd,Iyzd,Iy,Iz,Iyz]=SectionProp(A_ii,yd_i,z_i,Iy_i,Iz_i,Iyz_i);
Iy_Idealized=Iy;

error=(Iy_Idealized-Iy_exact)/Iy_exact*100;

%% Idealized Box Half Section
indices=[1,2];
A_ii_half=A_ii(indices);
yd_i_half=yd_i(indices);
z_i_half=z_i(indices);
Iy_i_half=zeros(size(A_ii));
Iz_i_half=zeros(size(A_ii));
Iyz_i_half=zeros(size(A_ii));
[A_half,Qyd_half,Qzd_half,y_c_half,z_c_half,y_i_half,z_i_half,sum_Iy_i_half,sum_Iz_i_half,sum_Iyz_i_half,sum_Ayd2_half,sum_Azd2_half,sum_Aydzd_half,sum_Ay2_half,sum_Az2_half,sum_Ayz_half,Iyd_half,Izd_half,Iyzd_half,Iy_half,Iz_half,Iyz_half]=SectionProp(A_ii_half,yd_i_half,z_i_half,Iy_i_half,Iz_i_half,Iyz_i_half)
Iy_Idealized=2*Iyd_half

error=(Iy_Idealized-Iy_exact)/Iy_exact*100

%% Thick z
A_i_half=[3e4,3e4]
y_i_half=[200,0]
z_i_half=[250,150]
Iy_i_half=[300*100^3,100*300^3]/12
Iz_i_half=[300^3*100,100^3*300]/12
Iyz_i_half=[0,0]
[A_half,Qyd_half,Qzd_half,y_c_half,z_c_half,y_i_half,z_i_half,sum_Iy_i_half,sum_Iz_i_half,sum_Iyz_i_half,sum_Ayd2_half,sum_Azd2_half,sum_Aydzd_half,sum_Ay2_half,sum_Az2_half,sum_Ayz_half,Iyd_half,Izd_half,Iyzd_half,temp1,temp2,temp3]=SectionProp(A_i_half,y_i_half,z_i_half,Iy_i_half,Iz_i_half,Iyz_i_half)
A=2*A_half
I_y=2*Iyd_half
I_z=2*Izd_half
I_yz=2*Iyzd_half

rho_y=sqrt(I_y/A)
rho_z=sqrt(I_z/A)

S_y=I_y/300
S_z=I_z/350

alpha_rad=5/180*pi;
[I_y_alpha,I_z_alpha,I_yz_alpha]=I_alpha(alpha_rad,I_y,I_z,I_yz)

[alpha_1_rad,I_1,I_2,alpha_3_rad,I_3,I_34]=I_principal(I_y,I_z,I_yz)
alpha_1_deg=alpha_1_rad/pi*180

%% Idealized z
t=.05;
A_i_half=[(13/16-5/32)*t,pi/2*5/32*t,(1.25-2*5/32)/2*t]
y_i_half=[-(13/16-(13/16-5/32)/2),-(5/32-2/pi*5/32),0]
z_i_half=[1.25/2,1.25/2-(5/32-2/pi*5/32),(1.25-2*5/32)/2/2]
Iy_i_half=[0,(pi/4-2/pi)*t*(5/32)^3,t*(1.25/2-5/32)^3/12]
Iz_i_half=[t*(13/16-5/32)^3/12,Iy_i_half(2),0]
Iyz_i_half=[0,(1/2-2/pi)*t*(5/32)^3,0]
[A_half,Qyd_half,Qzd_half,y_c_half,z_c_half,y_i_half,z_i_half,sum_Iy_i_half,sum_Iz_i_half,sum_Iyz_i_half,sum_Ayd2_half,sum_Azd2_half,sum_Aydzd_half,sum_Ay2_half,sum_Az2_half,sum_Ayz_half,Iyd_half,Izd_half,Iyzd_half,temp1,temp2,temp3]=SectionProp(A_i_half,y_i_half,z_i_half,Iy_i_half,Iz_i_half,Iyz_i_half)
A=2*A_half
I_y=2*Iyd_half
I_z=2*Izd_half
I_yz=2*Iyzd_half

alpha_rad=5/180*pi;
[I_y_alpha,I_z_alpha,I_yz_alpha]=I_alpha(alpha_rad,I_y,I_z,I_yz)

[alpha_1_rad,I_1,I_2,alpha_3_rad,I_3,I_34]=I_principal(I_y,I_z,I_yz)
alpha_1_deg=alpha_1_rad/pi*180

%% Lipped Angle
alpha_rad=5/180*pi;
I_y=0.3145;
I_z=0.074333;
I_yz=0.035849;
[I_y_alpha,I_z_alpha,I_yz_alpha]=I_alpha(alpha_rad,I_y,I_z,I_yz)

[alpha_1_rad,I_1,I_2,alpha_3_rad,I_3,I_34]=I_principal(I_y,I_z,I_yz)
alpha_1_deg=alpha_1_rad/pi*180
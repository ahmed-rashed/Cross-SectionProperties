function [A,Qyd,Qzd,y_c,z_c,y_i,z_i,sum_Iy_i,sum_Iz_i,sum_Iyz_i,sum_Ayd2,sum_Azd2,sum_Aydzd,sum_Ay2,sum_Az2,sum_Ayz,Iyd,Izd,Iyzd,Iy,Iz,Iyz]=SectionProp(A_i,yd_i,zd_i,Iy_i,Iz_i,Iyz_i)

A=sum(A_i);
Qyd=sum(A_i.*zd_i);
Qzd=sum(A_i.*yd_i);
y_c=Qzd/A;
z_c=Qyd/A;

y_i=yd_i-y_c;
z_i=zd_i-z_c;

sum_Iy_i=sum(Iy_i);
sum_Iz_i=sum(Iz_i);
sum_Iyz_i=sum(Iyz_i);

sum_Ayd2=sum(A_i.*yd_i.^2);
sum_Azd2=sum(A_i.*zd_i.^2);
sum_Aydzd=sum(A_i.*yd_i.*zd_i);

sum_Ay2=sum(A_i.*y_i.^2);
sum_Az2=sum(A_i.*z_i.^2);
sum_Ayz=sum(A_i.*y_i.*z_i);

Iyd=sum_Iy_i+sum_Azd2;
Izd=sum_Iz_i+sum_Ayd2;
Iyzd=sum_Iyz_i+sum_Aydzd;

Iy=Iyd-A*z_c^2;
Iz=Izd-A*y_c^2;
Iyz=Iyzd-A*y_c*z_c;
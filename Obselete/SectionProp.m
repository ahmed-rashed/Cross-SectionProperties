function [A,Qyd,Qzd,y_c,z_c,y_i,z_i,sum_Iy_i,sum_Iz_i,sum_Iyz_i,sum_Ayd2,sum_Azd2,sum_Aydzd,sum_Ay2,sum_Az2,sum_Ayz,Iyd,Izd,Iyzd,Iy,Iz,Iyz]=SectionProp(A_vec,yd_vec,zd_vec,Iy_vec,Iz_vec,Iyz_vec)

A=sum(A_vec);
Qyd=sum(A_vec.*zd_vec);
Qzd=sum(A_vec.*yd_vec);
y_c=Qzd/A;
z_c=Qyd/A;

y_i=yd_vec-y_c;
z_i=zd_vec-z_c;

sum_Iy_i=sum(Iy_vec);
sum_Iz_i=sum(Iz_vec);
sum_Iyz_i=sum(Iyz_vec);

sum_Ayd2=sum(A_vec.*yd_vec.^2);
sum_Azd2=sum(A_vec.*zd_vec.^2);
sum_Aydzd=sum(A_vec.*yd_vec.*zd_vec);

sum_Ay2=sum(A_vec.*y_i.^2);
sum_Az2=sum(A_vec.*z_i.^2);
sum_Ayz=sum(A_vec.*y_i.*z_i);

Iyd=sum_Iy_i+sum_Azd2;
Izd=sum_Iz_i+sum_Ayd2;
Iyzd=sum_Iyz_i+sum_Aydzd;

Iy=Iyd-A*z_c^2;
Iz=Izd-A*y_c^2;
Iyz=Iyzd-A*y_c*z_c;
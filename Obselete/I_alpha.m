function [I_y_alpha,I_z_alpha,I_yz_alpha]=I_alpha(alpha_rad,I_y,I_z,I_yz)

temp_col=TransMatrix(alpha_rad)*[I_y;I_z;-I_yz];
I_y_alpha=temp_col(1);
I_z_alpha=temp_col(2);
I_yz_alpha=-temp_col(3);
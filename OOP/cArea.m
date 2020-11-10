classdef cArea	%The file-name must be the same as the class-name
    %This class takes the propeties of an area (A,Iy,Iz,Iyz), and calculates the properties of this area.
    
    % The attributes used to calcute the area properties
    properties
        A(1,1)
        Iy(1,1)=0
        Iz(1,1)=0
        Iyz(1,1)=0
    end
    
    methods 
        % Constructor
        function oThisArea_arr=cArea(A_arr,Iy_arr,Iz_arr,Iyz_arr)
            if nargin>=1
                N=numel(A_arr);
                A_arr_size=size(A_arr);
                dims_c=num2cell(A_arr_size);
                oThisArea_arr(dims_c{:})=oThisArea_arr;
                for n=1:N
                    oThisArea_arr(n).A=A_arr(n);
                end
            end
            
            if nargin>=2
                if any(size(Iy_arr)~=A_arr_size),error('Iy_arr and A_arr must have identical size.'),end
                for n=1:N
                    oThisArea_arr(n).Iy=Iy_arr(n); %#ok<AGROW>
                end
            end
            
            if nargin>=3
                if any(size(Iz_arr)~=A_arr_size),error('Iz_arr and A_arr must have identical size.'),end
                for n=1:N
                    oThisArea_arr(n).Iz=Iz_arr(n); %#ok<AGROW>
                end
            end
            
            if nargin==4
                if any(size(Iyz_arr)~=A_arr_size),error('Iyz_arr and A_arr must have identical size.'),end
                for n=1:N
                    oThisArea_arr(n).Iyz=Iyz_arr(n); %#ok<AGROW>
                end
            end
        end

        function Ip_arr=Ip(oThisArea_arr)
            Ip_arr=reshape([oThisArea_arr.Iy]+[oThisArea_arr.Iz],size(oThisArea_arr));
        end
        
        function alpha1_arr=alpha1(oThisArea_arr)
            alpha1_arr=reshape(atan2(-[oThisArea_arr.Iyz],([oThisArea_arr.Iy]-[oThisArea_arr.Iz])/2),size(oThisArea_arr));
        end
        
        function I_34_arr=I_34(oThisArea_arr)
            I_34_arr=reshape(sqrt((([oThisArea_arr.Iy]-[oThisArea_arr.Iz])/2).^2+(-[oThisArea_arr.Iyz]).^2),size(oThisArea_arr));
        end
        
        function I_3_arr=I_3(oThisArea_arr)
            I_3_arr=reshape(([oThisArea_arr.Iy]+[oThisArea_arr.Iz])/2,size(oThisArea_arr));
        end
        
        function I_4_arr=I_4(oThisArea_arr)
            I_4_arr=oThisArea_arr.I_3;
        end
        
        function I1_arr=I1(oThisArea_arr)
            I1_arr=oThisArea_arr.I_3+oThisArea_arr.I_34;
        end
        
        function I2_arr=I2(oThisArea_arr)
            I2_arr=oThisArea_arr.I_3-oThisArea_arr.I_34;
        end
        
        function alpha_3_arr=alpha_3(oThisArea_arr)
            alpha_3_arr=pi/4-oThisArea_arr.alpha1;
        end
        
        function rho_y_arr=rho_y(oThisArea_arr)
            rho_y_arr=reshape(sqrt([oThisArea_arr.Iy]./[oThisArea_arr.A]),size(oThisArea_arr));
        end
        
        function rho_z_arr=rho_z(oThisArea_arr)
            rho_z_arr=reshape(sqrt([oThisArea_arr.Iz]./[oThisArea_arr.A]),size(oThisArea_arr));
        end

        function Sy_arr=Sy(oThisArea_arr,z_max_arr)
            if ~isscalar(z_max_arr) && any(size(oThisArea_arr)~=size(z_max_arr))
                error('z_max_arr must have the same size as oThisArea_arr, or be a scalar')
            end
            Sy_arr=reshape([oThisArea_arr.Iy]./abs(z_max_arr),size(oThisArea_arr));
        end

        function Sz_arr=Sz(oThisArea_arr,y_max_arr)
            if ~isscalar(y_max_arr) && any(size(oThisArea_arr)~=size(y_max_arr))
                error('y_max_arr must have the same size as oThisArea_arr, or be a scalar')
            end
            Sz_arr=reshape([oThisArea_arr.Iz]./abs(y_max_arr),size(oThisArea_arr));
        end
        
        function oNewArea_arr=rotatedArea(oThisArea_arr,alpha_rad_arr)
            if ~isscalar(alpha_rad_arr) && any(size(oThisArea_arr)~=size(alpha_rad_arr))
                error('alpha_rad_arr must have the same size as oThisArea_arr, or be a scalar')
            end

            oThisArea_arr_size=size(oThisArea_arr);
            dims_c=num2cell(oThisArea_arr_size);
            if isscalar(alpha_rad_arr)
                temp_cols=TransMatrix(-alpha_rad_arr)*[[oThisArea_arr.Iy];[oThisArea_arr.Iz];-[oThisArea_arr.Iyz]];
                oNewArea_arr=reshape(cArea([oThisArea_arr.A],temp_cols(1,:),temp_cols(2,:),temp_cols(3,:)),oThisArea_arr_size);
            else
                oNewArea_arr(dims_c{:})=cArea;
                for n=1:numel(oNewArea_arr)
                    temp_col=TransMatrix(-alpha_rad_arr(n))*[oThisArea_arr(n).Iy;oThisArea_arr(n).Iz;-oThisArea_arr(n).Iyz];
                    oNewArea_arr(n)=cArea(oThisArea_arr(n).A,temp_col(1),temp_col(2),temp_col(3));
                end
            end
        end
    end
end
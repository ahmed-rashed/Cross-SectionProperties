classdef cArea_simple	%The file-name must be the same as the class-name
    %This class takes the propeties of an area (A,Iy,Iz,Iyz), and calculates the properties of this area.
    
    % The attributes used to calcute the area properties
    properties
        A
        Iy=0
        Iz=0
        Iyz=0
    end
    
    methods
        % Constructor
        function oThisArea=cArea_simple(A,Iy,Iz,Iyz)
            if nargin>=1
                oThisArea.A=A;
            end
            
            if nargin>=2
                oThisArea.Iy=Iy;
            end
            
            if nargin>=3
                oThisArea.Iz=Iz;
            end
            
            if nargin==4
                oThisArea.Iyz=Iyz;
            end
        end

        function Ip=Ip(oThisArea)
            Ip=oThisArea.Iy+oThisArea.Iz;
        end
        
        function alpha1=alpha1(oThisArea)
            alpha1=atan2(-oThisArea.Iyz,(oThisArea.Iy-oThisArea.Iz)/2);
        end
        
        function I_34=I_34(oThisArea)
            I_34=sqrt(((oThisArea.Iy-oThisArea.Iz)/2)^2+(-oThisArea.Iyz)^2);
        end
        
        function I_3=I_3(oThisArea)
            I_3=(oThisArea.Iy+oThisArea.Iz)/2;
        end
        
        function I_4=I_4(oThisArea)
            I_4=oThisArea.I_3;
        end
        
        function I1=I1(oThisArea)
            I1=oThisArea.I_3+oThisArea.I_34;
        end
        
        function I2=I2(oThisArea)
            I2=oThisArea.I_3-oThisArea.I_34;
        end
        
        function alpha_3=alpha_3(oThisArea)
            alpha_3=pi/4-oThisArea.alpha1;
        end
        
        function rho_y=rho_y(oThisArea)
            rho_y=sqrt(oThisArea.Iy/oThisArea.A);
        end
        
        function rho_z=rho_z(oThisArea)
            rho_z=sqrt(oThisArea.Iz/oThisArea.A);
        end

        function Sy=Sy(oThisArea,z_max)
            Sy=oThisArea.Iy/abs(z_max);
        end

        function Sz=Sz(oThisArea,y_max)
            Sz=oThisArea.Iz/abs(y_max);
        end
        
        function oNewArea=rotatedArea(oThisArea,alpha_rad)
            temp_col=TransMatrix(-alpha_rad)*[oThisArea.Iy;oThisArea.Iz;-oThisArea.Iyz];
            oNewArea=cArea_simple(oThisArea.A,temp_col(1),temp_col(2),temp_col(3));
        end
    end
end
classdef cArea
    %This class takes:
    %*)propeties of the single cross-section (A-Iy-Iz-Iyz) from user.
    %then the class calculates the properties of the single cross-section.
    
    % The attributes used to calcute the single cross-section properties
    properties
        A;
        Iy;
        Iz;
        Iyz;
    end
    
    methods 
        % Constructor
        function obj = cArea(A,Iy,Iz,Iyz)
            if nargin == 1
                obj.A=A.A;
                obj.Iy=A.Iy;
                obj.Iz=A.Iz;
                obj.Iyz=A.Iyz;
            elseif nargin == 4
                obj.A=A;
                obj.Iy=Iy;
                obj.Iz=Iz;
                obj.Iyz=Iyz;
            end
        end

        % The calculations of the properties             
        function a=alpha_1(obj)
            a=atan2(-obj.Iyz,(obj.Iy-obj.Iz)/2);
        end
        
        function b=I_34(obj)
            b=sqrt(((obj.Iy-obj.Iz)/2)^2+(-obj.Iyz)^2);
        end
        
        function c=I_3(obj)
            c=(obj.Iy+obj.Iz)/2;
        end
        
        function d=I_4(obj)
            d=I_3(obj);
        end
        
        function e=I_1(obj)
            e=obj.I_3+obj.I_34;
        end
        
        function f=I_2(obj)
            f=obj.I_3-obj.I_34;
        end
        
        function h=alpha_3(obj)
            h=pi/4-obj.alpha_1;
        end
        
        function oobj=cArea_alpha(obj,alpha_rad)
            temp_col=TransMatrix(alpha_rad)*[obj.Iy;obj.Iz;-obj.Iyz];
            oobj=cArea(obj.A,temp_col(1),temp_col(2),temp_col(3));
        end

        function l= rho_y(obj)
            l=sqrt(obj.Iy/obj.A);
        end
        
        function m= rho_z(obj)
            m=sqrt(obj.Iz/obj.A);
        end

        function mm= Sy(obj,z_max)
            mm=obj.Iy/abs(z_max);
        end

        function mm= Sz(obj,y_max)
            mm=obj.Iz/abs(y_max);
        end
    end
        
end


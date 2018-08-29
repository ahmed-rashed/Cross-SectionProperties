classdef cArea
    %This class takes:
    %propeties of the single area (A-Iy-Iz-Iyz) from user.
    %then the class calculates the properties of the single area.
    
    % The attributes used to calcute the single area properties
    properties
        A(1,1);
        Iy(1,1);
        Iz(1,1);
        Iyz(1,1);
    end
    
    methods 
        % Constructor
        function oThisArea = cArea(varargin)
            if nargin == 4
                oThisArea.A=varargin{1};
                oThisArea.Iy=varargin{2};
                oThisArea.Iz=varargin{3};
                oThisArea.Iyz=varargin{4};
            elseif nargin == 1
                % This case assumes that the A input argument is an  object.
                oThisArea.A=varargin{1}.A;
                oThisArea.Iy=varargin{1}.Iy;
                oThisArea.Iz=varargin{1}.Iz;
                oThisArea.Iyz=varargin{1}.Iyz;
            elseif nargin ~= 0
                error('This class can be constructed using zero, 1 or 4 inputs.');
            end
        end

        % The calculations of the properties             
        function a=alpha_1(oThisArea)
            a=atan2(-oThisArea.Iyz,(oThisArea.Iy-oThisArea.Iz)/2);
        end
        
        function b=I_34(oThisArea)
            b=sqrt(((oThisArea.Iy-oThisArea.Iz)/2)^2+(-oThisArea.Iyz)^2);
        end
        
        function c=I_3(oThisArea)
            c=(oThisArea.Iy+oThisArea.Iz)/2;
        end
        
        function d=I_4(oThisArea)
            d=I_3(oThisArea);
        end
        
        function e=I_1(oThisArea)
            e=oThisArea.I_3+oThisArea.I_34;
        end
        
        function f=I_2(oThisArea)
            f=oThisArea.I_3-oThisArea.I_34;
        end
        
        function h=alpha_3(oThisArea)
            h=pi/4-oThisArea.alpha_1;
        end
        
        function l= rho_y(oThisArea)
            l=sqrt(oThisArea.Iy/oThisArea.A);
        end
        
        function m= rho_z(oThisArea)
            m=sqrt(oThisArea.Iz/oThisArea.A);
        end

        function mm= Sy(oThisArea,z_max)
            mm=oThisArea.Iy/abs(z_max);
        end

        function mm= Sz(oThisArea,y_max)
            mm=oThisArea.Iz/abs(y_max);
        end
        
        function oNewArea=rotatedArea(oThisArea,alpha_rad)
            temp_col=TransMatrix(-alpha_rad)*[oThisArea.Iy;oThisArea.Iz;-oThisArea.Iyz];
            oNewArea=cArea(oThisArea.A,temp_col(1),temp_col(2),temp_col(3));
        end
    end
end


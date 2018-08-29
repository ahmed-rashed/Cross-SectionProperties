classdef cCompositeArea
    % The attributes used to calculate the composite area
    
    properties
        oArea_vec(1,:) cArea;   %row vector
        y_hat_vec(1,:);         %row vector
        z_hat_vec(1,:);         %row vector
    end
    
    methods
        % Constructor
        function oThisCompositeArea=cCompositeArea(oArea_vec,y_hat_vec,z_hat_vec)
            if nargin == 3
                if length(oArea_vec)~=length(y_hat_vec),error('oArea_vec and y_hat_vec must have the same lengths'),end
                if length(oArea_vec)~=length(z_hat_vec),error('C_Area_vec and z_hat_vec must have the same lengths'),end

                %Assign subclass properties
                oThisCompositeArea.oArea_vec=oArea_vec;
                oThisCompositeArea.y_hat_vec=y_hat_vec;
                oThisCompositeArea.z_hat_vec=z_hat_vec;
            elseif nargin ~= 0
                error('This class can be constructed using zero or 3 inputs.');
            end
        end
        
        function A=A(oThisCompositeArea)
            A=sum([oThisCompositeArea.oArea_vec.A]);
        end
        
        function Qy=Qy(oThisCompositeArea)
            Qy=sum([oThisCompositeArea.oArea_vec.A].*oThisCompositeArea.z_hat_vec);
        end
        
        function Qz=Qz(oThisCompositeArea)
            Qz=sum([oThisCompositeArea.oArea_vec.A].*oThisCompositeArea.y_hat_vec);
        end
        
        function d=y_bar(oThisCompositeArea)
            d=oThisCompositeArea.Qz()/oThisCompositeArea.A();
        end
        
        function e=z_bar(oThisCompositeArea)
            e=oThisCompositeArea.Qy()/oThisCompositeArea.A();
        end
        
        function f=Iy_hat(oThisCompositeArea)
            f=sum([oThisCompositeArea.oArea_vec.Iy])+sum([oThisCompositeArea.oArea_vec.A].*oThisCompositeArea.z_hat_vec.^2);
        end
        
        function g=Iz_hat(oThisCompositeArea)
            g=sum([oThisCompositeArea.oArea_vec.Iz])+sum([oThisCompositeArea.oArea_vec.A].*oThisCompositeArea.y_hat_vec.^2);
        end
        
        function k=Iyz_hat(oThisCompositeArea)
            k=sum([oThisCompositeArea.oArea_vec.Iyz])+sum([oThisCompositeArea.oArea_vec.A].*oThisCompositeArea.y_hat_vec.*oThisCompositeArea.z_hat_vec);
        end
        
        function h=I_p_hat(oThisCompositeArea)
            h=oThisCompositeArea.Iy_hat+oThisCompositeArea.Iz_hat;
        end
        
        function l=Iy(oThisCompositeArea)
            l=oThisCompositeArea.Iy_hat-oThisCompositeArea.A*oThisCompositeArea.z_bar.^2;
        end
        
        function m=Iz(oThisCompositeArea)
            m=oThisCompositeArea.Iz_hat-oThisCompositeArea.A*oThisCompositeArea.y_bar.^2;
        end
        
        function n=Iyz(oThisCompositeArea)
            n=oThisCompositeArea.Iyz_hat-oThisCompositeArea.A*oThisCompositeArea.y_bar*oThisCompositeArea.z_bar;
        end
        
        function o=I_p(oThisCompositeArea)
            o=oThisCompositeArea.Iy+oThisCompositeArea.Iz;
        end
    end    
end
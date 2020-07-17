classdef cCompositeArea < cArea
    % The attributes used to calculate the composite area
    
    properties (Access = protected)
        oArea_vec(1,:) cArea;   %row vector
        y_hat_vec(1,:);         %row vector
        z_hat_vec(1,:);         %row vector
    end
    
    methods
        % Constructor
        function oThisCompositeArea=cCompositeArea(oArea_vec,y_hat_vec,z_hat_vec)
            if nargin==0
                superClass1Args={};
            elseif nargin == 3
                if length(oArea_vec)~=length(y_hat_vec),error('oArea_vec and y_hat_vec must have the same lengths'),end
                if length(oArea_vec)~=length(z_hat_vec),error('C_Area_vec and z_hat_vec must have the same lengths'),end

                
                
                
                A=sum([oArea_vec.A]);
                superClass1Args={A,Iy,Iz,Iyz};
            else
                error('This class can be constructed using zero or 3 inputs.');
            end
            
            %Construct the super class
            oThisCompositeArea@cArea(superClass1Args{:});
            
            %Construct the sub class
            oThisCompositeArea.oArea_vec=oArea_vec;
            oThisCompositeArea.y_hat_vec=y_hat_vec;
            oThisCompositeArea.z_hat_vec=z_hat_vec;
        end
        
        function oArea_vec=get_oArea_vec(oThisCompositeArea)
            oArea_vec=oThisCompositeArea.oArea_vec;
        end
        
        function y_hat_vec=get_y_hat_vec(oThisCompositeArea)
            y_hat_vec=oThisCompositeArea.y_hat_vec;
        end
        
        function z_hat_vec=get_z_hat_vec(oThisCompositeArea)
            z_hat_vec=oThisCompositeArea.z_hat_vec;
        end
        
        function Qy=Qy(oThisCompositeArea)
            Qy=sum(oThisCompositeArea.A.*oThisCompositeArea.z_hat_vec);
        end
        
        function Qz=Qz(oThisCompositeArea)
            Qz=sum([oThisCompositeArea.oArea_vec.A].*oThisCompositeArea.y_hat_vec);
        end
        
        function y_bar=y_bar(oThisCompositeArea)
            y_bar=oThisCompositeArea.Qz()/oThisCompositeArea.A();
        end
        
        function z_bar=z_bar(oThisCompositeArea)
            z_bar=oThisCompositeArea.Qy()/oThisCompositeArea.A();
        end
        
        function Iy_hat=Iy_hat(oThisCompositeArea)
            Iy_hat=sum([oThisCompositeArea.oArea_vec.Iy])+sum([oThisCompositeArea.oArea_vec.A].*oThisCompositeArea.z_hat_vec.^2);
        end
        
        function Iz_hat=Iz_hat(oThisCompositeArea)
            Iz_hat=sum([oThisCompositeArea.oArea_vec.Iz])+sum([oThisCompositeArea.oArea_vec.A].*oThisCompositeArea.y_hat_vec.^2);
        end
        
        function Iyz_hat=Iyz_hat(oThisCompositeArea)
            Iyz_hat=sum([oThisCompositeArea.oArea_vec.Iyz])+sum([oThisCompositeArea.oArea_vec.A].*oThisCompositeArea.y_hat_vec.*oThisCompositeArea.z_hat_vec);
        end
        
        function I_p_hat=I_p_hat(oThisCompositeArea)
            I_p_hat=oThisCompositeArea.Iy_hat+oThisCompositeArea.Iz_hat;
        end
        
        function Iy=Iy(oThisCompositeArea)
            Iy=oThisCompositeArea.Iy_hat-oThisCompositeArea.A*oThisCompositeArea.z_bar.^2;
        end
        
        function Iz=Iz(oThisCompositeArea)
            Iz=oThisCompositeArea.Iz_hat-oThisCompositeArea.A*oThisCompositeArea.y_bar.^2;
        end
        
        function Iyz=Iyz(oThisCompositeArea)
            Iyz=oThisCompositeArea.Iyz_hat-oThisCompositeArea.A*oThisCompositeArea.y_bar*oThisCompositeArea.z_bar;
        end
        
        function I_p=I_p(oThisCompositeArea)
            I_p=oThisCompositeArea.Iy+oThisCompositeArea.Iz;
        end
    end    
end
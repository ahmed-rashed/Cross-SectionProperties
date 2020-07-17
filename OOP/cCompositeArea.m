classdef cCompositeArea < cArea

    properties (Access = protected)
        oArea_vec(1,:) cArea   %row vector
        y_hat_vec(1,:)         %row vector
        z_hat_vec(1,:)         %row vector
        y_bar(1,1)
        z_bar(1,1)
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
                Qy_hat=dot([oArea_vec.A],z_hat_vec);
                Qz_hat=dot([oArea_vec.A],y_hat_vec);
                y_bar=Qz_hat/A;
                z_bar=Qy_hat/A;
                Iy_hat=sum([oArea_vec.Iy])+dot([oArea_vec.A],z_hat_vec.^2);
                Iz_hat=sum([oArea_vec.Iz])+dot([oArea_vec.A],y_hat_vec.^2);
                Iyz_hat=sum([oArea_vec.Iyz])+dot([oArea_vec.A],y_hat_vec.*z_hat_vec);
                Iy=Iy_hat-A*z_bar.^2;
                Iz=Iz_hat-A*y_bar.^2;
                Iyz=Iyz_hat-A*y_bar*z_bar;
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
            oThisCompositeArea.y_bar=y_bar;
            oThisCompositeArea.z_bar=z_bar;
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
        
        function y_bar=get_y_bar(oThisCompositeArea)
            y_bar=oThisCompositeArea.y_bar;
        end
        
        function z_bar=get_z_bar(oThisCompositeArea)
            z_bar=oThisCompositeArea.z_bar;
        end
        
        function Qy_hat=Qy_hat(oThisCompositeArea)
            Qy_hat=oThisCompositeArea.A*oThisCompositeArea.z_bar;
        end
        
        function Qz_hat=Qz_hat(oThisCompositeArea)
            Qz_hat=oThisCompositeArea.A*oThisCompositeArea.y_bar;
        end
                
        function Iy_hat=Iy_hat(oThisCompositeArea)
            Iy_hat=oThisCompositeArea.Iy+oThisCompositeArea.A*oThisCompositeArea.z_bar.^2;
        end
        
        function Iz_hat=Iz_hat(oThisCompositeArea)
            Iz_hat=oThisCompositeArea.Iz+oThisCompositeArea.A*oThisCompositeArea.y_bar.^2;
        end
        
        function Iyz_hat=Iyz_hat(oThisCompositeArea)
            Iyz_hat=oThisCompositeArea.Iyz+oThisCompositeArea.A*oThisCompositeArea.y_bar*oThisCompositeArea.z_bar;
        end
        
        function I_p_hat=I_p_hat(oThisCompositeArea)
            I_p_hat=oThisCompositeArea.Iy_hat+oThisCompositeArea.Iz_hat;
        end
    end    
end
classdef cCompCrossSec
    % The attributes used to calculate the composite cross-section
    
    properties
        cArea_vec;
        y_hat_vec;
        z_hat_vec;
    end
    
    methods
        % Constructor
        function obj = cCompCrossSec(cArea_vec,y_hat_vec,z_hat_vec)
            if nargin == 3
                if any(size(cArea_vec)~=size(y_hat_vec)),error('cArea_vec and y_hat_vec must have the same lengths'),end
                if any(size(cArea_vec)~=size(z_hat_vec)),error('C_Area_vec and z_hat_vec must have the same lengths'),end

                %Assign subclass properties
                obj.cArea_vec=cArea_vec(:).';
                obj.y_hat_vec=y_hat_vec(:).';
                obj.z_hat_vec=z_hat_vec(:).';
            end
        end
        
        function A=A(obj)
            A=sum([obj.cArea_vec.A]);
        end
        
        function Qy=Qy(obj)
            Qy=sum([obj.cArea_vec.A].*obj.z_hat_vec);
        end
        
        function Qz=Qz(obj)
            Qz=sum([obj.cArea_vec.A].*obj.y_hat_vec);
        end
        
        function d=y_bar(obj)
            d=obj.Qz()/obj.A();
        end
        
        function e=z_bar(obj)
            e=obj.Qy()/obj.A();
        end
        
        function f=Iy_hat(obj)
            f=sum([obj.cArea_vec.Iy])+sum([obj.cArea_vec.A].*obj.z_hat_vec.^2);
        end
        
        function g=Iz_hat(obj)
            g=sum([obj.cArea_vec.Iz])+sum([obj.cArea_vec.A].*obj.y_hat_vec.^2);
        end
        
        function k=Iyz_hat(obj)
            k=sum([obj.cArea_vec.Iyz])+sum([obj.cArea_vec.A].*obj.y_hat_vec.*obj.z_hat_vec);
        end
        
        function h=I_p_hat(obj)
            h=obj.Iy_hat+obj.Iz_hat;
        end
        
        function l=Iy(obj)
            l=obj.Iy_hat-obj.A*obj.z_bar.^2;
        end
        
        function m=Iz(obj)
            m=obj.Iz_hat-obj.A*obj.y_bar.^2;
        end
        
        function n=Iyz(obj)
            n=obj.Iyz_hat-obj.A*obj.y_bar*obj.z_bar;
        end
        
        function o=I_p(obj)
            o=obj.Iy+obj.Iz;
        end
    end    
end
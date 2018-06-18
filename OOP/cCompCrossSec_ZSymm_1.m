classdef cCompCrossSec_ZSymm < cCompCrossSec
    %This class takes only the right half of composite cross-section data:
    %1)propeties of each element (Area-Iy-Iz-Iyz) from user as
    %cArea vector.
    %2)the Co-ordinates of each element as y vector and z vector.
    %then the class calculates the properties of the composite
    %cross-section.
    
    % The attributes used to calculate the composite cross-section properties
    properties (Access=protected)
%         cArea_vec;
%         y_hat_vec;
%         z_hat_vec;
        cHalf_zSymm_CrossSec;
    end
    
    
    methods
        % Constructor
        function obj = cCompCrossSec_ZSymm(cArea_vec,y_hat_vec,z_hat_vec)
            if nargin == 3
                if any(size(cArea_vec)~=size(y_hat_vec)),error('cArea_vec and y_hat_vec must have the same lengths'),end
                if any(size(cArea_vec)~=size(z_hat_vec)),error('C_Area_vec and z_hat_vec must have the same lengths'),end

%                 obj.cArea_vec=cArea_vec;
%                 obj.y_hat_vec=y_hat_vec;
%                 obj.z_hat_vec=z_hat_vec;

                %Determine the index of the bisected elements
                ind_vec=find((y_hat_vec(:).'==0) & [cArea_vec.Iyz]==0);

                %Divide the properties of the bisected elements by 2
                cArea_vec_temp=cArea_vec;
                for ii=ind_vec
                    cArea_vec_temp(ii)=cArea(cArea_vec(ii).A/2,cArea_vec(ii).Iy/2,cArea_vec(ii).Iz/2,0);
                end

                obj.cHalf_zSymm_CrossSec=cCompCrossSec(cArea_vec_temp,y_hat_vec,z_hat_vec);
            end
        end
        
        % Calculations of the complete composite cross-section properties
        function a=A(obj)
            a=2*obj.cHalf_zSymm_CrossSec.A;
        end
        
        function b=Qy(obj)
            b=2*obj.cHalf_zSymm_CrossSec.Qy;
        end
        
        function d=Qz(obj)
            d=0;
        end
        
        function f=y_bar(obj)
            f=0;
        end
        
        function c=z_bar(obj)
            c=obj.cHalf_zSymm_CrossSec.z_bar;
        end
        
        function g=Iy_hat(obj)
            g=2*obj.cHalf_zSymm_CrossSec.Iy_hat;
        end
        
        function h=Iz_hat(obj)
            h=2*obj.cHalf_zSymm_CrossSec.Iz_hat;
        end
        
        function m=Iyz_hat(obj)
            m=0;
        end
        
        function n=I_p_hat(obj)
            n=2*obj.cHalf_zSymm_CrossSec.I_p_hat;
        end
        function O=Iy(obj)
            O=2*obj.cHalf_zSymm_CrossSec.Iy;
        end
        function p=Iz(obj)
            p=Iz_hat(obj);
        end
        function q=Iyz(~)
            q=0;
        end
        function l=I_p(obj)
            l=Iy(obj)+Iz(obj);
        end
        function p=alpha_1(obj)
            obj.Area=A(obj);
            obj.Iy=Iy(obj);
            obj.Iz=Iz(obj);
            obj.Iyz=Iyz(obj);
            p=alpha_1@cArea(obj);
        end
        function v=I_34(obj)
            obj.Area=A(obj);
            obj.Iy=Iy(obj);
            obj.Iz=Iz(obj);
            obj.Iyz=Iyz(obj);
            v=I_34@cArea(obj);
        end
        function p=I_3(obj)
            obj.Area=A(obj);
            obj.Iy=Iy(obj);
            obj.Iz=Iz(obj);
            obj.Iyz=Iyz(obj);
            p=I_3@cArea(obj);
        end
        function p=I_4(obj)
            obj.Area=A(obj);
            obj.Iy=Iy(obj);
            obj.Iz=Iz(obj);
            obj.Iyz=Iyz(obj);
            p=I_4@cArea(obj);
        end
        function p=I_1(obj)
            obj.Area=A(obj);
            obj.Iy=Iy(obj);
            obj.Iz=Iz(obj);
            obj.Iyz=Iyz(obj);
            p=I_1@cArea(obj);
        end
        function p=I_2(obj)
            obj.Area=A(obj);
            obj.Iy=Iy(obj);
            obj.Iz=Iz(obj);
            obj.Iyz=Iyz(obj);
            p=I_2@cArea(obj);
        end
        function p=I_12(obj)
            obj.Area=A(obj);
            obj.Iy=Iy(obj);
            obj.Iz=Iz(obj);
            obj.Iyz=Iyz(obj);
            p=I_12@cArea(obj);
        end
        function p=alpha_3(obj)
            obj.Area=A(obj);
            obj.Iy=Iy(obj);
            obj.Iz=Iz(obj);
            obj.Iyz=Iyz(obj);
            p=alpha_3@cArea(obj);
        end
        function p= rho_y(obj)
            obj.Area=A(obj);
            obj.Iy=Iy(obj);
            obj.Iz=Iz(obj);
            obj.Iyz=Iyz(obj);
            p=rho_y@cArea(obj);
        end
        function p= rho_z(obj)
            obj.Area=A(obj);
            obj.Iy=Iy(obj);
            obj.Iz=Iz(obj);
            obj.Iyz=Iyz(obj);
            p=rho_z@cArea(obj);
        end
        
    end
    
end


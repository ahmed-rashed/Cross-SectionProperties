classdef cCompCrossSec_YSymm < cCompCrossSec
    %This class takes only the upper or lower half of composite cross-section
    
    properties
        cArea_vec_half;
        y_hat_vec_half;
        z_vec_half;
    end

    methods(Static)
        function d=Qy(~)
            d=0;
        end
        
        function f=z_bar(~)
            f=0;
        end

        function m=Iyz_hat(~)
            m=0;
        end
        
        function q=Iyz(~)
            q=0;
        end
    end
    
    methods
        % Constructor
        function obj = cCompCrossSec_YSymm(cArea_vec_half,y_hat_vec_half,z_vec_half)
            if any(size(cArea_vec_half)~=size(y_hat_vec_half)),error('cArea_vec_half and y_hat_vec_half must have the same lengths'),end
            if any(size(cArea_vec_half)~=size(z_vec_half)),error('C_Area_vec and z_vec_half must have the same lengths'),end

            %Determine the index of non bisected elements
            ind_vec=find(~(z_vec_half(:).'==0));

            %Multiply the properties of non bisected elements by 2
            cArea_vec_temp=cArea_vec_half;
            for ii=ind_vec
                cArea_vec_temp(ii)=cArea(2*cArea_vec_half(ii).A,2*cArea_vec_half(ii).Iy,2*cArea_vec_half(ii).Iz,2*cArea_vec_half(ii).Iyz);
            end
            
            obj=obj@cCompCrossSec(cArea_vec_temp,y_hat_vec_half,z_vec_half);

            obj.cArea_vec_half=cArea_vec_half(:).';
            obj.y_hat_vec_half=y_hat_vec_half(:).';
            obj.z_vec_half=z_vec_half(:).';

        end

        function p=Iy(obj)
            p=obj.Iy_hat;
        end
                
        function l=I_p(obj)
            l=Iy(obj)+Iz(obj);
        end
    end
end
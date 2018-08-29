classdef cCompositeArea_AntiSymm_ZSymm < cCompositeArea
    %This class takes only the right or left half of composite area data

    properties (Access = private)
		ind_vec
    end

    methods(Static)
        function d=Qz(~)
            d=0;
        end

        function d=Qy(~)
            d=0;
        end
        
        function f=y_bar(~)
            f=0;
        end

        function f=z_bar(~)
            f=0;
        end
    end
    
    methods
        % Subclass constructor
        function oThisCompositeArea_AntiSymm_ZSymm = cCompositeArea_AntiSymm_ZSymm(oArea_vec_half,y_vec_half,z_vec_half)
            if length(oArea_vec_half)~=length(y_vec_half),error('oArea_vec_half and y_vec_half must have the same lengths'),end
            if length(oArea_vec_half)~=length(z_vec_half),error('C_Area_vec and z_vec_half must have the same lengths'),end

            %Determine the index of non bisected elements
            ind_vec=find(~(y_vec_half(:).'==0));

            %Multiply the properties of non bisected elements by 2
            oArea_vec_temp=oArea_vec_half;
            for ii=ind_vec
                oArea_vec_temp(ii)=cArea(2*oArea_vec_temp(ii).A,2*oArea_vec_temp(ii).Iy,2*oArea_vec_temp(ii).Iz,2*oArea_vec_temp(ii).Iyz);
            end
            
            %Construct the super class
            oThisCompositeArea_AntiSymm_ZSymm@cCompositeArea(oArea_vec_temp,y_vec_half,z_vec_half);

            %Construct the sub class
            oThisCompositeArea_AntiSymm_ZSymm.ind_vec=ind_vec;
        end

        function p=Iz(oThisCompositeArea_AntiSymm_ZSymm)
            p=oThisCompositeArea_AntiSymm_ZSymm.Iz_hat;
        end

        function p=Iy(oThisCompositeArea_AntiSymm_ZSymm)
            p=oThisCompositeArea_AntiSymm_ZSymm.Iy_hat;
        end
        
        function l=I_p(oThisCompositeArea_AntiSymm_ZSymm)
            l=oThisCompositeArea_AntiSymm_ZSymm.I_p_hat;
        end
        
        function q=Iyz(oThisCompositeArea_AntiSymm_ZSymm)
            q=oThisCompositeArea_AntiSymm_ZSymm.Iyz_hat;
        end

        function oArea_vec_half=get_oArea_vec_half(oThisCompositeArea_AntiSymm_ZSymm)
            %Divide the properties of super class non bisected elements by 2
            oArea_vec_half=oThisCompositeArea_AntiSymm_ZSymm.oArea_vec;
            for ii=oThisCompositeArea_AntiSymm_ZSymm.ind_vec
                oArea_vec_half(ii)=cArea(oArea_vec_half(ii).A/2,oArea_vec_half(ii).Iy/2,oArea_vec_half(ii).Iz/2,oArea_vec_half(ii).Iyz/2);
            end
        end
    end
end
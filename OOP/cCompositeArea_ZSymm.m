classdef cCompositeArea_ZSymm  < cCompositeArea
    %This class takes only the right or left half of composite area data

    properties (Access = private)
        ind_vec
    end

    methods(Static)
        function d=Qz(~)
            d=0;
        end
        
        function f=y_bar(~)
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
        % Subclass constructor
        function oThisCompositeArea_ZSymm = cCompositeArea_ZSymm (oArea_vec_half,y_vec_half,z_hat_vec_half)
            if length(oArea_vec_half)~=length(y_vec_half),error('oArea_vec_half, y_vec_half and z_vec_half must have the same lengths'),end
            if length(oArea_vec_half)~=length(z_hat_vec_half),error('oArea_vec_half, y_vec_half and z_vec_half must have the same lengths'),end

            %Determine the index of non bisected elements
            ind_vec=find(~((y_vec_half(:).'==0) & ([oArea_vec_half.Iyz]==0)));

            %Multiply the properties of non bisected elements by 2
            oArea_vec_temp=oArea_vec_half;
            for ii=ind_vec
                oArea_vec_temp(ii)=cArea(2*oArea_vec_temp(ii).A,2*oArea_vec_temp(ii).Iy,2*oArea_vec_temp(ii).Iz,2*oArea_vec_temp(ii).Iyz);
            end
            
            %Construct the super class
            oThisCompositeArea_ZSymm@cCompositeArea(oArea_vec_temp,y_vec_half,z_hat_vec_half);

            %Construct the sub class
            oThisCompositeArea_ZSymm.ind_vec=ind_vec;
        end

        function p=Iz(oThisCompositeArea_ZSymm)
            p=oThisCompositeArea_ZSymm.Iz_hat;
        end
                
        function l=I_p(oThisCompositeArea_ZSymm)
            l=oThisCompositeArea_ZSymm.Iy+oThisCompositeArea_ZSymm.Iz;
        end
        
        function oArea_vec_half=get_oArea_vec(oThisCompositeArea_ZSymm)
            %Divide the properties of super class non bisected elements by 2
            %oArea_vec_half=oThisCompositeArea_ZSymm.oArea_vec;
            oArea_vec_half=get_oArea_vec@cCompositeArea(oThisCompositeArea_ZSymm);
            for ii=oThisCompositeArea_ZSymm.ind_vec
                oArea_vec_half(ii)=cArea(oArea_vec_half(ii).A/2,oArea_vec_half(ii).Iy/2,oArea_vec_half(ii).Iz/2,oArea_vec_half(ii).Iyz/2);
            end
        end
    end
end

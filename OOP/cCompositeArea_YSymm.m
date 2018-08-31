classdef cCompositeArea_YSymm < cCompositeArea
    %This class takes only the upper or lower half of composite area
    
    properties (Access = private)
        ind_vec
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
        % Subclass constructor
        function oThisCompositeArea_YSymm = cCompositeArea_YSymm (oArea_vec_half,y_hat_vec_half,z_vec_half)
            if length(oArea_vec_half)~=length(y_hat_vec_half),error('oArea_vec_half and y_hat_vec_half must have the same lengths'),end
            if length(oArea_vec_half)~=length(z_vec_half),error('C_Area_vec and z_vec_half must have the same lengths'),end

            %Determine the index of non bisected elements
            ind_vec=find(~((z_vec_half(:).'==0) & ([oArea_vec_half.Iyz]==0)));

            %Multiply the properties of non bisected elements by 2
            oArea_vec_temp=oArea_vec_half;
            for ii=ind_vec
                oArea_vec_temp(ii)=cArea(2*oArea_vec_temp(ii).A,2*oArea_vec_temp(ii).Iy,2*oArea_vec_temp(ii).Iz,2*oArea_vec_temp(ii).Iyz);
            end

            %Construct the super class
            oThisCompositeArea_YSymm@cCompositeArea(oArea_vec_temp,y_hat_vec_half,z_vec_half);

            %Construct the sub class
            oThisCompositeArea_YSymm.ind_vec=ind_vec;
        end

        function p=Iy(oThisCompositeArea_YSymm)
            p=oThisCompositeArea_YSymm.Iy_hat;
        end
                
        function l=I_p(oThisCompositeArea_YSymm)
            l=Iy(oThisCompositeArea_YSymm)+Iz(oThisCompositeArea_YSymm);
        end
        function oArea_vec_half=get_oArea_vec(oThisCompositeArea_YSymm)
            %Divide the properties of super class non bisected elements by 2
            %oArea_vec_half=oThisCompositeArea_YSymm.oArea_vec;
            oArea_vec_half=get_oArea_vec@cCompositeArea(oThisCompositeArea_YSymm);
            for ii=oThisCompositeArea_YSymm.ind_vec
                oArea_vec_half(ii)=cArea(oArea_vec_half(ii).A/2,oArea_vec_half(ii).Iy/2,oArea_vec_half(ii).Iz/2,oArea_vec_half(ii).Iyz/2);
            end
        end
    end
end

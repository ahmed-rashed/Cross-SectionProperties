classdef cCompositeArea_YZSymm < cCompositeArea
    %This class takes only quarter the composite area
    
    properties (Access = private)
        ind_y_symm_only_z_symm_only_vec
        ind_non_symm_vec
    end

    methods(Static)
        function d=Qy(~)
            d=0;
        end
        
        function d=Qz(~)
            d=0;
        end
        
        function f=y_bar(~)
            f=0;
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
        function oThisCompositeArea_YZSymm = cCompositeArea_YZSymm(cArea_vec_quarter,y_vec_quarter,z_vec_quarter)
            if length(cArea_vec_quarter)~=length(y_vec_quarter),error('cArea_vec_quarter and y_vec_quarter must have the same lengths'),end
            if length(cArea_vec_quarter)~=length(z_vec_quarter),error('C_Area_vec and z_vec_quarter must have the same lengths'),end

            %Determine the index of non bisected elements
            ind_y_symm_vec=find((z_vec_quarter(:).'==0) & ([cArea_vec_quarter.Iyz]==0));
            ind_z_symm_vec=find((y_vec_quarter(:).'==0) & ([cArea_vec_quarter.Iyz]==0));
            
            ind_y_symm_only_z_symm_only_vec=setxor(ind_y_symm_vec,ind_z_symm_vec);
            ind_non_symm_vec=setdiff(setdiff(1:length(cArea_vec_quarter),ind_y_symm_vec),ind_z_symm_vec);
            
            oArea_vec_temp=cArea_vec_quarter;
            for ii=ind_y_symm_only_z_symm_only_vec
                oArea_vec_temp(ii)=cArea(2*oArea_vec_temp(ii).A,2*oArea_vec_temp(ii).Iy,2*oArea_vec_temp(ii).Iz,2*oArea_vec_temp(ii).Iyz);
            end
            for ii=ind_non_symm_vec
                oArea_vec_temp(ii)=cArea(4*oArea_vec_temp(ii).A,4*oArea_vec_temp(ii).Iy,4*oArea_vec_temp(ii).Iz,4*oArea_vec_temp(ii).Iyz);
            end

            %Construct the super class
            oThisCompositeArea_YZSymm@cCompositeArea(oArea_vec_temp,y_vec_quarter,z_vec_quarter);

            %Construct the sub class
            oThisCompositeArea_YZSymm.ind_y_symm_only_z_symm_only_vec=ind_y_symm_only_z_symm_only_vec;
            oThisCompositeArea_YZSymm.ind_non_symm_vec=ind_non_symm_vec;
        end

        function p=Iy(oThisCompositeArea_YZSymm)
            p=oThisCompositeArea_YZSymm.Iy_hat;
        end

        function p=Iz(oThisCompositeArea_YZSymm)
            p=oThisCompositeArea_YZSymm.Iz_hat;
        end

        function l=I_p(oThisCompositeArea_YZSymm)
            l=oThisCompositeArea_YZSymm.I_p_hat;
        end
        
        function oArea_vec_quarter=get_oArea_vec(oThisCompositeArea_YZSymm)
            %Divide the properties of super class non bisected elements by 2
            %cArea_vec_quarter=oThisCompositeArea_YZSymm.oArea_vec;
            oArea_vec_quarter=get_oArea_vec@cCompositeArea(oThisCompositeArea_YZSymm);
            for ii=oThisCompositeArea_YZSymm.ind_y_symm_only_z_symm_only_vec
                oArea_vec_quarter(ii)=cArea(oArea_vec_quarter(ii).A/2,oArea_vec_quarter(ii).Iy/2,oArea_vec_quarter(ii).Iz/2,oArea_vec_quarter(ii).Iyz/2);
            end
            
            %Divide the properties of super class non bisected elements by 4
            for ii=oThisCompositeArea_YZSymm.ind_non_symm_vec
                oArea_vec_quarter(ii)=cArea(oArea_vec_quarter(ii).A/4,oArea_vec_quarter(ii).Iy/4,oArea_vec_quarter(ii).Iz/4,oArea_vec_quarter(ii).Iyz/4);
            end

        end
    end
end

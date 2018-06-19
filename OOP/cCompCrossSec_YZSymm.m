classdef cCompCrossSec_YZSymm < cCompCrossSec
    %This class takes only quarter the composite cross-section
    
    properties
        cArea_vec_quarter;
        y_vec_quarter;
        z_vec_quarter;
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
        % Constructor
        function obj = cCompCrossSec_YZSymm(cArea_vec_quarter,y_vec_quarter,z_vec_quarter)
            if any(size(cArea_vec_quarter)~=size(y_vec_quarter)),error('cArea_vec_quarter and y_vec_quarter must have the same lengths'),end
            if any(size(cArea_vec_quarter)~=size(z_vec_quarter)),error('C_Area_vec and z_vec_quarter must have the same lengths'),end

            %Determine the index of non bisected elements
            ind_y_symm_vec=find((z_vec_quarter(:).'==0) & ([cArea_vec_quarter.Iyz]==0));
            ind_z_symm_vec=find((y_vec_quarter(:).'==0) & ([cArea_vec_quarter.Iyz]==0));
            
            ind_y_symm_only_z_symm_only_vec=setxor(ind_y_symm_vec,ind_z_symm_vec);
            ind_non_symm_vec=setdiff(setdiff(1:length(cArea_vec_quarter),ind_y_symm_vec),ind_z_symm_vec);
            
            cArea_vec_temp=cArea_vec_quarter;
            for ii=ind_y_symm_only_z_symm_only_vec
                cArea_vec_temp(ii)=cArea(2*cArea_vec_quarter(ii).A,2*cArea_vec_quarter(ii).Iy,2*cArea_vec_quarter(ii).Iz,2*cArea_vec_quarter(ii).Iyz);
            end
            for ii=ind_non_symm_vec
                cArea_vec_temp(ii)=cArea(4*cArea_vec_quarter(ii).A,4*cArea_vec_quarter(ii).Iy,4*cArea_vec_quarter(ii).Iz,2*cArea_vec_quarter(ii).Iyz);
            end

            obj=obj@cCompCrossSec(cArea_vec_temp,y_vec_quarter,z_vec_quarter);

            obj.cArea_vec_quarter=cArea_vec_quarter(:).';
            obj.y_vec_quarter=y_vec_quarter(:).';
            obj.z_vec_quarter=z_vec_quarter(:).';

        end

        function p=Iy(obj)
            p=obj.Iy_hat;
        end

        function p=Iz(obj)
            p=obj.Iz_hat;
        end

        function l=I_p(obj)
            l=obj.I_p_hat;
        end
    end
end
classdef cCompositeArea_AntiSymm_Y < cCompositeArea
    %This class takes only the right or left half of composite area data

    properties (Access=private)
		ind_vec
    end
    
    methods
        % Subclass constructor
        function oThisCompositeArea_AntiSymm_YSymm=cCompositeArea_AntiSymm_Y(oArea_vec_half,y_vec_half,z_vec_half)
            if nargin==0
                superClassArgs={};
            elseif nargin == 3
                if length(oArea_vec_half)~=length(y_vec_half),error('oArea_vec_half and y_vec_half must have the same lengths'),end
                if length(oArea_vec_half)~=length(z_vec_half),error('C_Area_vec and z_vec_half must have the same lengths'),end

                %Determine the index of non bisected elements
                ind_vec=find(~(z_vec_half(:).'==0));

                %Multiply the properties of non bisected elements by 2
                oArea_vec_temp=oArea_vec_half;
                for ii=ind_vec
                    oArea_vec_temp(ii)=cArea(2*oArea_vec_temp(ii).A,2*oArea_vec_temp(ii).Iy,2*oArea_vec_temp(ii).Iz,2*oArea_vec_temp(ii).Iyz);
                end
                superClassArgs={oArea_vec_temp,y_vec_half,z_vec_half};
            else
                error('This class can be constructed using zero or 3 inputs.');
            end
            
            %Construct the super class
            oThisCompositeArea_AntiSymm_YSymm@cCompositeArea(superClassArgs{:});
            oThisCompositeArea_AntiSymm_YSymm.Iy=oThisCompositeArea_AntiSymm_YSymm.Iy_hat;
            oThisCompositeArea_AntiSymm_YSymm.Iz=oThisCompositeArea_AntiSymm_YSymm.Iz_hat;
            oThisCompositeArea_AntiSymm_YSymm.Iyz=oThisCompositeArea_AntiSymm_YSymm.Iyz_hat;
            oThisCompositeArea_AntiSymm_YSymm.y_bar=0;
            oThisCompositeArea_AntiSymm_YSymm.z_bar=0;

            if nargin == 3
                %Construct the sub class
                oThisCompositeArea_AntiSymm_YSymm.ind_vec=ind_vec;
            end
        end

        function oArea_vec_half=get_oArea_vec(oThisCompositeArea_AntiSymm_YSymm)
            %Divide the properties of super class non bisected elements by 2
            %oArea_vec_half=oThisCompositeArea_AntiSymm_YSymm.oArea_vec;
            oArea_vec_half=get_oArea_vec@cCompositeArea(oThisCompositeArea_AntiSymm_YSymm);
            for ii=oThisCompositeArea_AntiSymm_YSymm.ind_vec
                oArea_vec_half(ii)=cArea(oArea_vec_half(ii).A/2,oArea_vec_half(ii).Iy/2,oArea_vec_half(ii).Iz/2,oArea_vec_half(ii).Iyz/2);
            end
        end
    end
end

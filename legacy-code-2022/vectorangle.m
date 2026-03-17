function[ThetaInDegrees]= vectorangle(u1,u2,v1,v2);

% u = [-4 2] - [0 0];
u = u2 - u1;
% v = [4 0] - [0 0];
v = v2 - v1;

CosTheta = max(min(dot(u,v)/(norm(u)*norm(v)),1),-1);
ThetaInDegrees = real(acosd(CosTheta));

% if ThetaInDegrees > 90
%     
%     
%     ThetaInDegrees90 = 180 - ThetaInDegrees
%     ThetaInDegrees91 = 180 + ThetaInDegrees90

% else
% end
end
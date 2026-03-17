%% 
function[ThetaInDegrees]= vectorangleR2(u1,u2,v1,v2);

% u2 = [5 0 ];
% u1 = [0 0 ];
% 
% v2 = [5 -5 ]; 
% v1 = [0 0 ];
% u = [4 -1 ] - [1 -1 ] 
% v = [4 -4 ] - [1 -1 ]
u = (u2 - u1)*[1 0 0; 0 1 0];
v = (v2 - v1)*[1 0 0; 0 1 0];

n = [0 0 1];

x = cross(u,v);
c = sign(dot(x,n)) * norm(x);
a = atan2d(c,dot(u,v));

if a < 0

ThetaInDegrees = 360 + a;

else

ThetaInDegrees =  a;

end

end
% %% 
% 
% % function[ThetaInDegrees]= vectorangleR2(u1,u2,v1,v2);
% 
% u = [5 0 0] - [0 0 0]
% % u = u2 - u1;
% v = [-5 5 0] - [0 0 0]
% % v = v2 - v1;
% 
% dot(u,v)
% cross(u,v)
% norm(u)
% norm(v)
% 
% (dot(u,v)/(norm(u)*norm(v)))
% 
% max(min(dot(u,v)/(norm(u)*norm(v)),1),-1)
% 
% CosTheta = max(min(dot(u,v)/(norm(u)*norm(v)),1),-1);
% 
% acos(CosTheta)
% D = rad2deg(acos(CosTheta))
% 
% F = atan2(norm(cross(u,v)),dot(u,v))
% 
% % CosTheta = max(min(dot(u,v)/(norm(u)*norm(v)),1),-1);
% % ThetaInDegrees = real(acosd(CosTheta));
% 
% % if ThetaInDegrees > 180
% %     
% %     
% %     ThetaInDegrees90 = 180 - ThetaInDegrees
% %     ThetaInDegrees91 = 180 + ThetaInDegrees90
% 
% % else
% % end
% % end
% %% 
% 
% 
% u = [5 0 0] - [0 0 0]
% v = [-5 -5 0] - [0 0 0]
% n = [0 0 1]
% x1 = cross(u,v)
% x2 = cross(v,u)
% 
% dot(x1,n)
% norm(x1)
% sign(dot(x1,n))
% c1 = sign(dot(x1,n)) * norm(x1)
% a1 = atan2d(c1,dot(x1,n))
% 
% dot(x2,n)
% norm(x2)
% sign(dot(x2,n))
% c2 = sign(dot(x2,n)) * norm(x2)
% dot(u,v)
% a2 = atan2d(c2,dot(x2,n))
% 
% % x = cross(u,v);
% % c = sign(dot(x,n)) * norm(x);
% % a = atan2d(c,dot(u,v));
% %% 
% % x = [5 5 0 -5 -5 -5  0  5];
% % y = [0 5 5  5  0 -5 -5 -5];
% % d = atan2d(y,x)
% 
% %% 
% 
% clc
% 
%  v1 = [4 -1 0] - [1 -1 0]  
%  v2 = [4 -4 0] - [1 -1 0]
%  n = [0 0 1]
% 
% x = cross(v1,v2)
% c = sign(dot(x,n)) * norm(x)
% a = atan2d(c,dot(v1,v2))
% 
% if a < 0
%     
%     theta = 360 + a
%     
% else
% end
% 

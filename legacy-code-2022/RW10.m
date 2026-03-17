% % for i = 1:10
clear all; clc ; clf;
% 
% px = 10; py = 20;
% p0 = [px py];
% time = 50;
% v = [10 10];     %given velocity
% t = 0: 1: time;
% a10 = [10,700,700,10,10];
% a11 = [10,0,700,700,10];
% a1011 = [10 10;700 0; 700 700;10 700]; 
% 
% %subplot(3,1,1)
% % plot(a10,a11)
% % hold on
% 
% for i=1:length(t)
%     
%     tsec = i - 1
%     
% %     ______________________producing constant velocity________________    
% 
% %     vx(i)=v(1);    %for constant velocity condition
% %     vy(i)=v(2);    %for constant velocity condition
% 
% %     ______________________producing variable velocity________________    
%     
% %     vx(i)=-5 + (5+5)*rand(1,1); %pops positive and negative real numbers
% %     vy(i)=-5 + (5+5)*rand(1,1); %pops positive and negative real numbers
% 
%     vx(i)=randi([-1 1],1,1);    %pops positive and negative randow integers between -50 and 50 in 1x1 matrix
%     vy(i)=randi([-1 1],1,1);    %pops positive and negative randow integers between -50 and 50 in 1x1 matrix
% 
%     if (vx(1,i) == 0 && vy(1,i) == 0)
%         
%         vx(1,i) = 2;
%         vy(1,i) = 2;
%         
%         c(i,1) = vx(1,i); %adjusting the row to the column matrix
%         d(i,1) = vy(1,i); %adjusting the row to the column matrix
%     else
%         
%     c = vx';
%     d = vy';
% 
%     v = [c d]; %velocity column matrix
%     
%     end
% %     c = vx';
% %     d = vy';
% 
% %     v = [c d]; %velocity column matrix
%     
%     magvt(i) = sqrt(c(i)^2 + d(i)^2); %velocity magnitude matrix
%     magv = magvt'; %velocity magnitude column matrix
%     
%     px(i+1) = px(i) + c(i)*i;
%     py(i+1) = py(i) + d(i)*i;
%     theta(i) = angle(px(i),py(i),px(i+1),py(i+1));
%      
%     a = px';
%     b = py';
%     p = [a b];
% 
%     pf = [p(i+1,1) p(i+1,2)]; %accessing elements inside the p matrix the last element that was created
%      
% %      subplot(3,1,2);
%      subplot(2,1,1);
%      plot(a10,a11)
%      hold on
%      plot(p(i,1),p(i,2),'o', 'MarkerSize' ,6, 'MarkerFaceColor', 'c'); %produces dot on the plot
%      hold on;
%      axis([-500 1000 -1000 1500])
%      
%     [in(i),on(i)] = inpolygon(p(i,1),p(i,2),a10,a11);
%     A = [in' on'];
%     
%     if (A(i,1) == 0 && A(i,2) == 0)
%         
% %         i
% %         N11 = [p(i,1) p(i,2)]
% %         k = dsearchn(a1011,N11);
% %         a1011((k),1);
% %         a1011((k),2);
% %         px(i) = a1011((k),1);
% %         py(i) = a1011((k),2);
% 
%           px(i) = randi([10 500],1,1);
%           py(i) = randi([10 500],1,1);
% 
% %         i
% %         [p(i,1) p(i,2)] 
% %         p(i,1) = 20
% %         p(i,2) = 20
% % %         p(i,2) = p(i,1)
% %         [p(i,1) p(i,2)]
% %         
% %         px(i) = p(i,1);
% %         py(i) = p(i,2);
%     else 
%     end
%        
%     if (A(i,1) == 0 && A(i,2) == 0 && i == tsec + 1)
%         
%             A(i,1)
%             A(i,2)
% 
%     px(i+1) = px(i)
%     py(i+1) = py(i) 
%         else
%    
% %     in(i,1)
% %     [pp(i,1) pp(i,2)] = [in(i,1) in(i,2)]
% %     O = theta';
%     end 
% end
% 
% for i=1:length(t)
%     
%     tsec = i - 1
%  if (p(i+1,1) == p(i,1) && p(i+1,2) == p(i,2))
%         
%           p(i+1,1) = randi([10 500],1,1);
%           p(i+1,2) = randi([10 500],1,1);
%     else 
%     end 
% end
% % plot(p(1),p(2))
% % hold off
% % rng default;
% % P = [10 10];
% % PQ = [0.5 0.5; 0.1 0.7; 0.8 0.7];
% % k = dsearchn(PQ,P)
% % PQ((k),1)
% % PQ((k),2)
% 
% for i=1:length(t)
%     
%     tsec = i - 1;
%     
%     [in(i),on(i)] = inpolygon(p(i,1),p(i,2),a10,a11);
%     A11 = [in' on'];
%     
%     subplot(2,1,2);
%     plot(a10,a11)
%     hold on
%     plot(p(i,1),p(i,2),'o', 'MarkerSize' ,6, 'MarkerFaceColor', 'c'); %produces dot on the plot
%     hold on;
%     axis([-500 1000 -1000 1500])
%    
% end
% % end
% 
% km1 = numel(A11(~in))
% km2 = numel(A11(~on))
% km3 = numel(A11(on))
% km4 = numel(A11(in))

x = 1;                          % X coordinate of arrow start
y = 2;                          % Y coordinate of arrow start
theta = pi/4;                   % Angle of arrow, from x-axis
L = 2;                          % Length of arrow
xEnd = x+L*cos(theta);          % X coordinate of arrow end
yEnd = y+L*sin(theta);          % Y coordinate of arrow end
points = linspace(0, theta);    % 100 points from 0 to theta
xCurve = x+(L/2).*cos(points);  % X coordinates of curve
yCurve = y+(L/2).*sin(points);  % Y coordinates of curve
plot(x+[-L L], [y y], '--k');   % Plot dashed line
hold on;                        % Add subsequent plots to the current axes
axis([x+[-L L] y+[-L L]]);      % Set axis limits
axis equal;                     % Make tick increments of each axis equal
arrow([x y], [xEnd yEnd]);      % Plot arrow
plot(xCurve, yCurve, '-k');     % Plot curve
plot(x, y, 'o', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'w');  % Plot point

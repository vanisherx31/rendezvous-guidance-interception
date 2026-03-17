% function [bv5 bv7 bv6 bv8 Mx1 Mn1 ]=vector(px,py,vx,vy,time); %(bv5 = first position;  bv7 = immidiate next position; bv6 = vector coordinate;)
clear; close all; clc; clear figure; clf
px = 10; py = 20;
p0 = [px py];
O = [0 0]
Xpls = [1000000 0];

time = 5;
  v = [90 40] 
%   v = [vx vy]     %given velocity
t = 0: 1: time;


for i=1:length(t)
    
    tsec = i - 1
    
%     ______________________producing constant velocity________________    

    v(i,1)=v(1,1);    %for constant velocity condition
    v(i,2)=v(1,2);    %for constant velocity condition

%     ______________________producing variable velocity________________    
    
%     vx(i)=-5 + (5+5)*rand(1,1); %pops positive and negative real numbers
%     vy(i)=-5 + (5+5)*rand(1,1); %pops positive and negative real numbers

%     vx(i)=randi([-1 1],1,1);    %pops positive and negative randow integers between -50 and 50 in 1x1 matrix
%     vy(i)=randi([-1 1],1,1);    %pops positive and negative randow integers between -50 and 50 in 1x1 matrix

    if (v(i,1) == 0 && v(i,2) == 0)
        
        v(i,1) = 2;
        v(i,2) = 2;
        
    else
        
    end

    magvt(i,1) = sqrt(v(i,1)^2 + v(i,2)^2); %velocity magnitude matrix
    
    if i == 1
        
        p(i,1) = p0(1);
        p(i,2) = p0(2);
    
    else
    
        
    p(i,1) = p(i-1,1) + v(i,1)*i;
    p(i,2) = p(i-1,2) + v(i,2)*i;
    
    p1 = [p(i-1,1) p(i-1,2)]
    p2 = [p(i,1) p(i,2)]
    
    theta(i,1) = vectorangle(p1,p2,O,Xpls);

    end
end

MX = 1.5*(max(p))
MN = 1.5*(min(p))

for i=1:length(t)
%     
    i
%     
    if i > time
        break
    else
        
     q1(i,1) = (p(i+1,1)-p(i,1)); %position vector whose value changes at every next time instance taking the values from p matrix   
     q1(i,2) = (p(i+1,2)-p(i,2));
     
%      q02 = [p(i,1) p(i,2)] %position vector whose value changes at every time instance taking the values from p matrix
%      q2 = q02 - q %producing the second coordinate for quiver so that it can match bv1 coordinates in plot

    end
%     
%     slpt(i) = ((bv1(2) - bv(2))/(bv1(1) - bv(1))); %slope matrix from bv2 and bv
%     slp = slpt'; %creating coulmn slope matrix
%    slp2 = slpt(i);
    (p(i+1,2) - p(i,2))
    (p(i+1,1) - p(i,1))
    slp(i,1) = ((p(i+1,2) - p(i,2))/(p(i+1,1) - p(i,1))); % slope from bv2 and bv
%     
    inpt(i,1) = p(i,2) - slp(i)* p(i,1); %intercept matrix from bv2 and bv
%     inpt = inptt'; %creating coulmn intercept matrix
%     inpt2 = inptt(i);
%     
    [xout,yout] = linecirc(slp(i),inpt(i),p(i,1),p(i,2),magvt(i));
% %     Xin = [xout,yout];
% %     ____________________produces the simultaion________________
% %
% %     ______________________making the vector________________
% 
% %     quiver(bv(1),bv(2),bv2(1),bv2(2),'Autoscale','off','Color','r','LineWidth',2)
% %     hold on;
% %     ______________________making the line________________
% 
% %     x = [bv(1) bv1(1)];
% %     y = [bv(2) bv1(2)];
%     plot([ p(i,1) p(i+1,1)], [p(i,2) p(i+1,2)],'Color','b','LineWidth',1.2) %line
%     hold on
%     
% %     ______________________making the circle________________
% 
    r = abs(magvt(i)); %Radius of circle
    x0 = p(i,1); y0 = p(i,2);  %Center point of circle:
    thcirc = 0:0.01:2*pi; %increament in theta 0,0.01,0.02....360
    x2 = r*cos(thcirc) + x0;
    y2 = r*sin(thcirc) + y0;
%     plot(x2,y2) %circle
%     hold on
% 
% %     ______________________finding the the intersection________________    
% 
%      [xout,yout] = linecirc(slp2,inpt2,x0,y0,r);
%  
%      plot(xout(1),yout(1),'s', 'MarkerSize' ,6, 'MarkerFaceColor', 'm'); %produces dot on the plot
%      hold on;
% %      
% %      plot(xout(2),yout(2),'o', 'MarkerSize' ,6, 'MarkerFaceColor', 'm'); %produces dot on the plot
% %      hold on;
% %     ______________________finding the nearest point________________  
% 
%     a1 = [xout(1) yout(1)];
%     b1 = [xout(2) yout(2)];
%     P = [b1(1) b1(2); a1(1) a1(2)];
    D = [xout(2) yout(2); xout(1) yout(1)];
%     PQ = [bv1(1) bv1(2)];
    PQ = [p(i+1,1) p(i+1,2)];
    
    [k,dist] = dsearchn(D,PQ);
% 
% 
% %     plot(P(:,1),P(:,2),'ko')
% %     hold on
% %     plot(PQ(:,1),PQ(:,2),'*g')
% %     hold on
%      plot(D(k,1),D(k,2),'*r')
%      hold on;
% %     legend('Data Points','Query Points','Nearest Points','Location','sw')
%      
%      
% %     ______________________making the final vector________________
% 
 vT(i,1) = D(k,1) %assigning nearest point to bv3
 vT(i,2) = D(k,2) %assigning nearest point to bv3
% 
    q2(i,1) = (D(k,1)-p(i,1)); %position vector whose value changes at every next time instance taking the values from p matrix
    q2(i,2) = (D(k,2)-p(i,2));
%     bv4 = bv3 - bv; %creating respective bv4 quiver second coordinate nearest point to bv3
% 
%     bv5(i,1) = bv(1);
%     bv5(i,2) = bv(2);
%     bv6(i,1) = bv4(1);
%     bv6(i,2) = bv4(2);
%     bv7(i,1) = bv2(1);
%     bv7(i,2) = bv2(2);
%     bv8(i,1) = bv3(1);
%     bv8(i,2) = bv3(2);
%     
% %     quiver(bv(1),bv(2),bv4(1),bv4(2),'Autoscale','off','Color','g','LineWidth',2)
% %     hold off;
% 
% %     axis([Mn(1) Mx(1) Mn(2) Mx(2)]) %defining the X,Y range for for the plots axis
%     axis([MN(1,1) MX(1,1) MN(1,2) MX(1,2)])
    pause(0.1)
    drawnow limitrate

end
% 
% Mx1 = 1.19*max(bv5);
% Mn1 = 1.19*min(bv5);
% 
%  
%
MX = 1.5*(max(p))
MN = 1.5*(min(p))

for i=1:length(t)
% 
%     rf(1) = bv5(i,1)
%     rf(2) = bv5(i,2)
%     
%     rf2(1) = bv7(i,1)
%     rf2(2) = bv7(i,2)
%     
%     vf(1) = bv6(i,1)
%     vf(2) = bv6(i,2)
%     
%     p(i,1)
%     q(i,1)
%     _________________


    if i > time
        plot(p(i,1),p(i,2),'o', 'MarkerSize' ,6, 'MarkerFaceColor', 'g'); %produces dot on the plot
        hold on;
        break
    else
        quiver(p(i,1),p(i,2),q1(i,1),q1(i,2),'Autoscale','off','Color','r','LineWidth',2)
        hold on;
        quiver(p(i,1),p(i,2),q2(i,1),q2(i,2),'Autoscale','off','Color','b','LineWidth',3)
        hold on;
        plot(vT(i,1),vT(i,2),'h', 'MarkerSize' ,6, 'MarkerFaceColor', 'y'); %produces dot on the plot
        hold on;
    end
        plot(p(i,1),p(i,2),'o', 'MarkerSize' ,6, 'MarkerFaceColor', 'g'); %produces dot on the plot
        hold on;
%     _________________
%     quiver(p(i,1),p(i,2),q2(i,1),q2(i,2),'Autoscale','off','Color','r','LineWidth',2)
%     hold on;
%     
% %     h = quiver(rf(1),rf(2),rf2(1),rf2(2),'Autoscale','off','Color','b','LineWidth',1.5)
% %     hold off;
%   
% %     axis([Mn1(1) Mx1(1) Mn1(2) Mx1(2)]) %defining the X,Y range for for the plots axis
%     
%      axis([MN(1,1) MX(1,1) MN(1,2) MX(1,2)])
 
    pause(0.3)
    drawnow limitrate

end
% %   end
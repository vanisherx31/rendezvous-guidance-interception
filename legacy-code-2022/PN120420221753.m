clear; close all; clc; clear figure; clf

% for j = 1:2
    
time = 900;

O = [0 0];
Xpls1 = [1000000 0]
vT = [5 1]; %defining the target velocity
vTmag = sqrt((vT(1,1))^2 + (vT(1,2))^2); ; %target velocity magnitude
rT = [100 100]; %defining the target position
px = rT(1,1);
py = rT(1,2);
vx = vT(1,1);
vy = vT(1,2);
rTmag = sqrt((rT(1,1))^2 + (rT(1,2))^2); %target position magnitude

% [a3 b3 c3 d3 Mx1 Mn1] =  vectorR2(rT(1),rT(2),vT(1),vT(2),time); %(a3 = first position; b3 = immidiate next position; c3 = vector coordinate on quiver; d3 = end point of velocity vector originated from a3)

[pT qT1 qT2 vT AXST  ]=vectorR2V011(px,py,vx,vy,time);

vImag = vTmag + 10.000; %defining velocity magnitude for interceptor

% K = (vImag/vTmag); %velocity ratio

rI0 = [0 0];


 t = 0: 0.001: time;
 %__________________Defining the Axis_____________________________________________________________________
 
%  MX1 = max([Mx1]);
%  MX2 = min([Mx1]);
%  MN1 = max([Mn1]);
%  MN2 = min([Mn1]);
%  
%   MX = [MX1 MX2];
%   MN = [MN1 MN2];
%   
%   
%   MX3 = max([MN(1) MX(1) MN(2) MX(2)]) - (0.10*max([MN(1) MX(1) MN(2) MX(2)]));
%   MN3 = min([MN(1) MX(1) MN(2) MX(2)]);
%   
%   v60 = [MN(1) MX(1) MN(2) MX(2)]; %(-x +x -y +y)

% v60 = AXST %(-x +x -y +y)

%Running the loop for producing live  
    for i=1:length(t) 

        i
        
%     rfT(1) = a3(i,1); % rf(1) accessing x from a3 matrix during running the loop
%     rfT(2) = a3(i,2); % rf(2) accessing y from a3 matrix during running the loop
%     
%     rf2T(1) = b3(i,1); % rf2(1) accessing x from b3 matrix during running the loop
%     rf2T(2) = b3(i,2); % rf2(2) accessing y from b3 matrix during running the loop
%     
%     vfT(1) = c3(i,1); % vf(1) accessing x from c3 matrix during running the loop
%     vfT(2) = c3(i,2); % vf(2) accessing y from c3 matrix during running the loop
%     
%     vffT(1) = d3(i,1); % vff(1) accessing x from d3 matrix during running the loop
%     vffT(2) = d3(i,2); % vff(2) accessing y from d3 matrix during running the loop
%     

if i > time
    break 
else
vTmagpvT(i,1) = sqrt((pT(i,1) - vT(i,1))^2 + (pT(i,2) - vT(i,2))^2); %finding velocity magnitude everytime from a3 and d3 while running the loop
end
%     vTmagp(i) = sqrt((rfT(1) - vffT(1))^2 + (rfT(2) - vffT(2))^2);
    
%     rI(i,1) = rI0(1);
%     rI(i,2) = rI0(2);
%     
%     rIPN(1,1) = rI(1,1);
%     rIPN(1,2) = rI(1,2);
%     
%     rIPN(1,1) = rI0(1);
%     rIPN(1,2) = rI0(2);
    
    i;
    
%        rIPN(i,1)
%        rIPN(i,2)
    
    if i == 1

%         rIPN(1,1) = rI(1,1);
%         rIPN(1,2) = rI(1,2);
        rIPN(i,1) = rI0(1,1);
        rIPN(i,2) = rI0(1,2);

    else
%         rIPN(i-1,1)
%         vIPN(i-1,1)
%         i*vIPN(i-1,1)
%         i*vIPN(i-1,2)
%         rIPN(i,1) = rIPN(i-1,1)+((i-1)*vIPN(i-1,1));
%         rIPN(i,2) = rIPN(i-1,2)+((i-1)*vIPN(i-1,2));
        
        rIPN(i,1) = rIPN(i-1,1)+((i-1)*vIPN(i-1,1))% + ((1/2)*aIPN(i-1,1)*((i-1)^2));
        rIPN(i,2) = rIPN(i-1,2)+((i-1)*vIPN(i-1,2)) %+ ((1/2)*aIPN(i-1,2)*((i-1)^2));
%         rIPN(i,3) = rIPN(i-1,1)+((i-1)*vIPN(i-1,1)) + ((1/2)*aIPN(i-1,1)*((i-1)^2));
%         rIPN(i,4) = rIPN(i-1,2)+((i-1)*vIPN(i-1,2)) + ((1/2)*aIPN(i-1,2)*((i-1)^2));
        
%         rIPN(i,1) = rIPN(i-1,1)+((i-1)*vIPNc(i-1,1))% + ((1/2)*aIPN(i-1,1)*((i-1)^2));
%         rIPN(i,2) = rIPN(i-1,2)+((i-1)*vIPNs(i-1,2)) %+ ((1/2)*aIPN(i-1,2)*((i-1)^2));
        
        
    end

        rIPNmag(i,1) = sqrt(((rIPN(i,1))^2) + ((rIPN(i,2))^2)); %Interceptor distance from origin
        rTmag(i,1) = sqrt((pT(i,1))^2 + (pT(i,2))^2); %Target distance from origin
        rTmag(i,2) = sqrt((pT(i,1)- rIPN(i,1))^2 + (pT(i,2)- rIPN(i,2))^2); %Target distance from interceptor

%     theta01(i,1) = angle(rfT(1),rfT(2),vffT(1),vffT(2)); %angle between target vector and X-axis
%     lambda(i,1) = angle(rI(i,1),rI(i,2),rfT(1),rfT(2)); %angle between LOS and X-axis
%     theta(i,1) = theta01(i,1) - lambda(i,1); %angle between target vector and LOS
%     
%     K = (vImag)/(vTmag); %velocity ratio of interceptor to the target
%     K1(i,1) = (rIPNmag(i,1))/(rTmag(i,1)); %position ratio of interceptor to the target
%     rImag(i,1) = norm(rI); %Interceptor position magnitude from origin
    
%     rTmag(i,1) = norm(rfT); %Target position magnitude from origin
    
     theta(i,1) = vectorangle([rIPN(i,1),rIPN(i,2)],[pT(i,1),pT(i,2)],[pT(i,1),pT(i,2)],[vT(i,1),vT(i,2)]);
     alpha(i,1) = vectorangle([O(1,1),O(1,2)],[pT(i,1),pT(i,2)],[O(1,1),O(1,2)],[Xpls1(1,1),Xpls1(1,2)]);
         
     s(i,1) = sind(theta(i,1));  %sin in degrees
     s(i,2) = sin(theta(i,1));  %sin in rads
     
     vTs(i,1) = pT(i,1);
     vTs(i,2) = pT(i,2) + vTmag*sind(theta(i,1)+alpha(i,1));
     vTc(i,1) = pT(i,1) + vTmag*cosd(theta(i,1)+alpha(i,1));
     vTc(i,2) = pT(i,2);
     
%      sind(theta(i,1))
%      rTmag(i,1)
%      vTmag
%      (vTmag)*(sind(theta(i,1)))
       lambdadot(i,1) = ((vTmag)/(rTmag(i,1)))*sind(theta(i,1)); %with origin to target as the radius arm
       lambdadot(i,2) = ((vTmag)/(rTmag(i,2)))*sind(theta(i,1)); %with interceptor to target as the radius arm
     
     sindelta(i,2) = (rIPNmag(i,1)*lambdadot(i,1))/(vImag); %interceptor velocity angle with LOS(origin reference) 
     sindelta(i,3) = (rIPNmag(i,1)*lambdadot(i,2))/(vImag); %interceptor velocity angle with LOS(interceptor reference)
     
%     s(i,1) = sin(theta(i,1));
     
%      sindelta(i,1) = ((K1(i,1)/K)*(s(i,1)));
     
%      mbn(i,1) = asind(sindelta(i,1));
%      mbn(i,2) = asin(sindelta(i,1));
     mbn(i,3) = asind(sindelta(i,2)); %(origin as reference) sine inverse degree
     mbn(i,4) = asin(sindelta(i,2));  %(origin as reference) sine inverse radians
     mbn(i,5) = asind(sindelta(i,3)); %(interceptor as reference) sine inverse degree
     mbn(i,6) = asin(sindelta(i,3));  %(interceptor as reference) sine inverse radians
     
     
     angl(i,1) = asind(sindelta(i,3));
     angl(i,2) = theta(i,1);          
     angl(i,3) = angl(i,2) - angl(i,1);
     angl(i,4) = angl(i,2) + angl(i,1); 
%      
     vIPN(i,1) = vImag*cosd(mbn(i,3)+ alpha(i,1));
     vIPN(i,2) = vImag*sind(mbn(i,3)+ alpha(i,1));
     
     vIPNs(i,1) = rIPN(i,1);
     vIPNs(i,2) = rIPN(i,2) + vImag*sind(mbn(i,3)+ alpha(i,1));
     vIPNc(i,1) = rIPN(i,1) + vImag*sind(mbn(i,3)+ alpha(i,1));
     vIPNc(i,2) = rIPN(i,2);
     
%      vIPN(i,1) = vImag*cosd(mbn(i,5));
%      vIPN(i,2) = vImag*sind(mbn(i,5));
%      
    
%        
%      vIPN(i,1) = (rIPNmag(i,1))/(i); 
%      vIPN(i,2) = (rIPNmag(i,1))*(lambdadot(i,1));
     
      vIPNmag(i,1) = sqrt(((vIPN(i,1))^2) + ((vIPN(i,2))^2));
     
     lambdadot(i,3) = ((vImag)/(rIPNmag(i,1)))*sindelta(i,2);

%      rIPN(i+1,1) = rI(i,1)+(i*vIPN(i,1));
%      rIPN(i+1,2) = rI(i,2)+(i*vIPN(i,2));
     
%      rIPN(i+1,1) = rIPN(i,1)+(i*vIPN(i,1));
%      rIPN(i+1,2) = rIPN(i,2)+(i*vIPN(i,2));
      
     d(i,1) = (((rIPN(i,2)-pT(i,2))^2)+((rIPN(i,1)-pT(i,1))^2));
   
%      aIPNmag(i,1) = (2*(vIPNmag(i,1))*lambdadot(i,1));
        
     aIPNmag(i,1) = (2*(vIPNmag(i,1))*lambdadot(i,2));
     
     aIPN(i,1) = aIPNmag(i,1)*cosd(mbn(i,5));
     aIPN(i,2) = aIPNmag(i,1)*sind(mbn(i,5));
     
     ratio(i,1) = (rIPNmag(i,1))/(rTmag(i,1));
     
     rIPN(i+1,3) = rIPN(i,1)+((i)*vIPN(i,1)) + ((1/2)*aIPN(i,1)*((i)^2));
     rIPN(i+1,4) = rIPN(i,2)+((i)*vIPN(i,2)) + ((1/2)*aIPN(i,2)*((i)^2));
     
     if ratio(i,1) > 1
    break
     else 
     end
%           if i > 1 && d(i,1) > d(i-1,1)
%     break
%      else 
%      end
%      mat3(i,7) = mbn(i,1);
%      delta(i,1) = 
     
%      mat(i,1) = theta(i,1); mat(i,2) = s(i,1);
%      mat2(i,1) = a3(i,1); mat2(i,2) = a3(i,2); mat2(i,3) = rTmag(i,1);
%      mat3(i,1) = rImag(i,1); mat3(i,2) = s(i,1); mat3(i,3) = rTmag(i,1); mat3(i,4) = K; mat3(i,5) = K1(i,1); mat3(i,6) = sindelta(i,1);
%      mat4(i,1) = K1(i,1) ; mat4(i,2) = K;
%      mat5(i,1) = rIPN(i,1) ; mat5(i,2) = rIPN(i,2);mat5(i,3) = pT(i,1);mat5(i,4) = pT(i,2);mat5(i,5) = d(i,1);mat5(i,6) = vIPNmag(i,1);
%     sin_delta(i,1) = (1/k)*((rImag(i))/(rTmag(i))); 
%     
%     cos_delta(i,1) = sqrt(1-((sin_delta(i))^2));
%     
%     vI(i,1) = vImag*cos_delta(i);
%     vI(i,2) = vImag*sin_delta(i);


%  ______________________________________________________________________________________________   
 
%     subplot(2,1,1);
% %     
%     quiver(rfT(1),rfT(2),vfT(1),vfT(2),'Autoscale','off','Color','r','LineWidth',3)
%     hold off;
% 
%     axis([MN3 MX3 MN3 MX3]) %defining the X,Y range for for the plots axis
%     pause(0.09)
%     drawnow limitrate
% %  ______________________________________________________________________________________________   

%     subplot(1,1,1);
%     axis([2*MN3 2*MX3 2*MN3 2*MX3])
%     hold on;
%     plot([rI0(1),rfT(1)],[rI0(2),rfT(2)]);
%     hold on;
%     quiver(rfT(1),rfT(2),vfT(1),vfT(2),'Autoscale','off','Color','r','LineWidth',1)
%     hold on;
%     plot(rfT(1),rfT(2),'o', 'MarkerSize' ,6, 'MarkerFaceColor', 'c'); %produces dot on the plot
%     hold on;
%     plot(vffT(1),vffT(2),'o', 'MarkerSize' ,6, 'MarkerFaceColor', 'k');
%     hold on;
%     plot(rI0(1),rI0(2),'o', 'MarkerSize' ,6, 'MarkerFaceColor', 'b'); %produces dot on the plot
%     hold off;
%     
%     pause(0.2)
%     drawnow limitrate

% end  
% rIPN(i,1)
% rIPN(i,2)
    subplot(1,1,1);
%         axis([1000000 1000000])
%             hold on;

%     plot([rIPN(1),rfT(1)],[rIPN(2),rfT(2)]);
%     hold on;
    plot(pT(i,1),pT(i,2),'o', 'MarkerSize' ,6, 'MarkerFaceColor', 'c'); %produces dot on the plot
    hold on;
    plot(vTs(i,1),vTs(i,2),'s', 'MarkerSize' ,6, 'MarkerFaceColor', 'g'); %produces dot on the plot
    hold on;
    plot(vTc(i,1),vTc(i,2),'s', 'MarkerSize' ,6, 'MarkerFaceColor', 'g'); %produces dot on the plot
    hold on;
    %     plot([rIPN(i,3),pT(i,1)],[rIPN(i,4),pT(i,2)],'LineWidth',1);
%     hold on;
%     plot(rIPN(i,1),rIPN(i,2),'s', 'MarkerSize' ,6, 'MarkerFaceColor', 'r'); %produces dot on the plot
%     hold on;
    plot([rIPN(i,1),pT(i,1)],[rIPN(i,2),pT(i,2)],'LineWidth',1);
    hold on;

%     plot(rIPN(i,3),rIPN(i,4),'s', 'MarkerSize' ,6, 'MarkerFaceColor', 'm'); %produces dot on the plot
%     hold on;
%     plot([rIPN(i,3),pT(i,1)],[rIPN(i,4),pT(i,2)],'LineWidth',1);
%     hold on;
%     plot([vIPN(i,1),vT(i,1)],[vIPN(i,2),vT(i,2)],'LineWidth',2);
%     hold on;
%     plot([O(1,1),pT(i,1)],[O(1,2),pT(i,2)],'LineWidth',2);
%     hold on;
%     
%   subplot(2,1,2);
%     pl1 = i;
%     pl2 = angl(i,1);
%     plot(pl1,pl2,'--bo')
%     hold on 
    
%     subplot(3,1,3);
%     pl3 = angl(i,2);
%     plot(pl1,pl3,'--ro')
%     hold on
%     plot([vT(i,1),pT(i,1)],[vT(i,2),pT(i,2)]);
%     hold on;0
%     plot(vT(i,1),vT(i,2),'h', 'MarkerSize' ,6, 'MarkerFaceColor', 'r'); %produces dot on the plot
%     hold on;
%     plot(vIPN(i,1),vIPN(i,2),'d', 'MarkerSize' ,6, 'MarkerFaceColor', 'r'); %produces dot on the plot
%     hold on;
    plot(rIPN(i,1),rIPN(i,2),'s', 'MarkerSize' ,6, 'MarkerFaceColor', 'r'); %produces dot on the plot
    hold on;
    plot(vIPNs(i,1),vIPNs(i,2),'d', 'MarkerSize' ,6, 'MarkerFaceColor', 'r'); %produces dot on the plot
    hold on;
    plot(vIPNc(i,1),vIPNc(i,2),'d', 'MarkerSize' ,6, 'MarkerFaceColor', 'r'); %produces dot on the plot
    hold on;
%     plot(pT(i,1),pT(i,2),'o', 'MarkerSize' ,6, 'MarkerFaceColor', 'c'); %produces dot on the plot
%     hold on;
%     plot([rIPN(i,1),pT(i,1)],[rIPN(i,2),pT(i,2)]);
%     hold on;
%     axis([AXST])
% %         axis([2*MN3 2*MX3 2*MN3 2*MX3])
% %         axis2 
%     hold on;
    
    pause(0.00000005)
    drawnow limitrate
    end

% MX4 = max([rIPN  a3])
% MN4 = min(rIPN,rfT)
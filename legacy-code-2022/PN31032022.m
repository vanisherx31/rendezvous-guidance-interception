clear; close all; clc; clear figure; clf

% for j = 1:2
    
time = 160;
 
vT = [12 18]; %defining the target velocity
vTmag = norm(vT); %target velocity magnitude
rT = [200000 30000]; %defining the target position
rTmag = sqrt((rT(1,1))^2 + (rT(1,2))^2);; %target position magnitude

[a3 b3 c3 d3 Mx1 Mn1] =  vectorR2(rT(1),rT(2),vT(1),vT(2),time); %(a3 = first position; b3 = immidiate next position; c3 = vector coordinate on quiver; d3 = end point of velocity vector originated from a3)

vImag = 22.19; %defining velocity magnitude for interceptor

% K = (vImag/vTmag); %velocity ratio

rI0 = [100 100];

 t = 0: 1: time;
 %__________________Defining the Axis_____________________________________________________________________
 
 MX1 = max([Mx1]);
 MX2 = min([Mx1]);
 MN1 = max([Mn1]);
 MN2 = min([Mn1]);
 
  MX = [MX1 MX2];
  MN = [MN1 MN2];
  
  
  MX3 = max([MN(1) MX(1) MN(2) MX(2)]) - (0.10*max([MN(1) MX(1) MN(2) MX(2)]));
  MN3 = min([MN(1) MX(1) MN(2) MX(2)]);
  
  v60 = [MN(1) MX(1) MN(2) MX(2)]; %(-x +x -y +y)

%Running the loop for producing live  
    for i=1:length(t) 

    rfT(1) = a3(i,1); % rf(1) accessing x from a3 matrix during running the loop
    rfT(2) = a3(i,2); % rf(2) accessing y from a3 matrix during running the loop
    
    rf2T(1) = b3(i,1); % rf2(1) accessing x from b3 matrix during running the loop
    rf2T(2) = b3(i,2); % rf2(2) accessing y from b3 matrix during running the loop
    
    vfT(1) = c3(i,1); % vf(1) accessing x from c3 matrix during running the loop
    vfT(2) = c3(i,2); % vf(2) accessing y from c3 matrix during running the loop
    
    vffT(1) = d3(i,1); % vff(1) accessing x from d3 matrix during running the loop
    vffT(2) = d3(i,2); % vff(2) accessing y from d3 matrix during running the loop
    
    vTmagp(i) = sqrt((rfT(1) - vffT(1))^2 + (rfT(2) - vffT(2))^2); %finding velocity magnitude everytime from a3 and d3 while running the loop
    
    rI(i,1) = rI0(1);
    rI(i,2) = rI0(2);
    
    rIPN(1,1) = rI(1,1);
    rIPN(1,2) = rI(1,2);
    
    i;
    
%        rIPN(i,1)
%        rIPN(i,2)
    
    if i == 1

        rIPN(1,1) = rI(1,1);
        rIPN(1,2) = rI(1,2);

    else
        rIPN(i-1,1)
        vIPN(i-1,1)
        i*vIPN(i-1,1)
        i*vIPN(i-1,2)
        rIPN(i,1) = rIPN(i-1,1)+(i*vIPN(i-1,1));
        rIPN(i,2) = rIPN(i-1,2)+(i*vIPN(i-1,2));
    end

        rIPNmag(i,1) = sqrt(((rIPN(i,1))^2) + ((rIPN(i,2))^2)); %Interceptor distance from origin
        rTmag(i,1) = sqrt((a3(i,1))^2 + (a3(i,2))^2); %Target distance from origin

%     theta01(i,1) = angle(rfT(1),rfT(2),vffT(1),vffT(2)); %angle between target vector and X-axis
%     lambda(i,1) = angle(rI(i,1),rI(i,2),rfT(1),rfT(2)); %angle between LOS and X-axis
%     theta(i,1) = theta01(i,1) - lambda(i,1); %angle between target vector and LOS
    
    K = (vImag)/(vTmag); %velocity ratio of interceptor to the target
    K1(i,1) = (rIPNmag(i,1))/(rTmag(i,1)); %position ratio of interceptor to the target
%     rImag(i,1) = norm(rI); %Interceptor position magnitude from origin
    
%     rTmag(i,1) = norm(rfT); %Target position magnitude from origin
    
     theta(i,1) = vectorangle([rIPN(i,1),rIPN(i,2)],[a3(i,1),a3(i,2)],[a3(i,1),a3(i,2)],[d3(i,1),d3(i,2)]);
    
     s(i,1) = sind(theta(i,1));
%     s(i,1) = sin(theta(i,1));
     
     sindelta(i,1) = ((K1(i,1)/K)*(s(i,1)));
     
     mbn(i,1) = asind(sindelta(i,1));
     mbn(i,2) = asin(sindelta(i,1));
     
     vIPN(i,1) = vImag*cosd(mbn(i,1));
     vIPN(i,2) = vImag*sind(mbn(i,1));
     
     

%      rIPN(i+1,1) = rI(i,1)+(i*vIPN(i,1));
%      rIPN(i+1,2) = rI(i,2)+(i*vIPN(i,2));
     
     rIPN(i,1) = rIPN(i,1)+(i*vIPN(i,1));
     rIPN(i,2) = rIPN(i,2)+(i*vIPN(i,2));
      
     d(i,1) = (((rIPN(i,2)-a3(i,2))^2)+((rIPN(i,1)-a3(i,1))^2));
     vIPNmag(i,1) = sqrt(((vIPN(i,1))^2) + ((vIPN(i,2))^2))
     
%      mat3(i,7) = mbn(i,1);
%      delta(i,1) = 
     
%      mat(i,1) = theta(i,1); mat(i,2) = s(i,1);
%      mat2(i,1) = a3(i,1); mat2(i,2) = a3(i,2); mat2(i,3) = rTmag(i,1);
%      mat3(i,1) = rImag(i,1); mat3(i,2) = s(i,1); mat3(i,3) = rTmag(i,1); mat3(i,4) = K; mat3(i,5) = K1(i,1); mat3(i,6) = sindelta(i,1);
     mat4(i,1) = K1(i,1) ; mat4(i,2) = K;
     mat5(i,1) = rIPN(i,1) ; mat5(i,2) = rIPN(i,2);mat5(i,3) = a3(i,1);mat5(i,4) = a3(i,2);mat5(i,5) = d(i,1);mat5(i,6) = vIPNmag(i,1);
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
rIPN(i,1)
rIPN(i,2)
    subplot(1,1,1);

%     plot([rIPN(1),rfT(1)],[rIPN(2),rfT(2)]);
%     hold on;
    plot([rIPN(i,1),rfT(1)],[rIPN(i,2),rfT(2)]);
    hold on;
    plot(rIPN(i,1),rIPN(i,2),'s', 'MarkerSize' ,6, 'MarkerFaceColor', 'r'); %produces dot on the plot
    hold on;
    plot(rfT(1),rfT(2),'o', 'MarkerSize' ,6, 'MarkerFaceColor', 'c'); %produces dot on the plot
    hold on;
    plot([rIPN(i,1),rfT(1)],[rIPN(i,2),rfT(2)]);
    hold on;
    axis([-10000 600000 -10000 260000])
%         axis([2*MN3 2*MX3 2*MN3 2*MX3])
%         axis2 
    hold on;
    
    pause(0.2)
    drawnow limitrate
    end

% MX4 = max([rIPN  a3])
% MN4 = min(rIPN,rfT)
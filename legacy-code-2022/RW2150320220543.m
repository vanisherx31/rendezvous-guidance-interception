 clear; close all; clc

 p0 = [2 0];     %given position
 time = 60;       %given time
%  v = [10 10]     %given velocity
 t = 0: 1: time;
 px = p0(1); py = p0(2);


for i=1:length(t)
    
    tsec = i - 1
    
%     ______________________producing constant velocity________________    

%     vx(i)=v(1);    %for constant velocity condition
%     vy(i)=v(2);    %for constant velocity condition

%     ______________________producing variable velocity________________    
    
%     vx(i)=-5 + (5+5)*rand(1,1); %pops positive and negative real numbers
%     vy(i)=-5 + (5+5)*rand(1,1); %pops positive and negative real numbers

    vx(i)=randi([-50 50],1,1);    %pops positive and negative randow integers between -50 and 50 in 1x1 matrix
    vy(i)=randi([-20 20],1,1);    %pops positive and negative randow integers between -50 and 50 in 1x1 matrix

    c = vx';
    d = vy';

    v = [c d]; %velocity column matrix
    
    magvt(i) = sqrt(c(i)^2 + d(i)^2); %velocity magnitude matrix
    magv = magvt'; %velocity magnitude column matrix
    
    px(i+1) = px(i) + c(i)*i;
    py(i+1) = py(i) + d(i)*i;
    theta(i) = angle(px(i),py(i),px(i+1),py(i+1));
    
    a = px';
    b = py';
    p = [a b]
    
    pf = [p(i+1,1) p(i+1,2)] %accessing elements inside the p matrix the last element that was created
    
    O = theta'
    
end

    p
    Mx = 1.0*max(p); %accessing the maximum x and y values inside the p matrix
    Mn = 1.0*min(p); %accessing the minimum x and y values inside the p matrix
    
    
for i=1:length(t)
    
    i;
    
    bv = [p(i,1) p(i,2)]; %position vector whose value changes at every time instance taking the values from p matrix
    bv1 = [p(i+1,1) p(i+1,2)]; %position vector whose value changes at every next time instance taking the values from p matrix
    bv2 = bv1 - bv; %producing the second coordinate for quiver so that it can match bv1 coordinates in plot
    
    slpt(i) = ((bv1(2) - bv(2))/(bv1(1) - bv(1))); %slope matrix from bv2 and bv
    slp = slpt'; %creating coulmn slope matrix
   slp2 = slpt(i);
    %slp = ((bv2(2) - bv(2))/(bv2(1) - bv(1))); % slope from bv2 and bv
    
    inptt(i) = bv(2) - slp(i)* bv(1); %intercept matrix from bv2 and bv
    inpt = inptt'; %creating coulmn intercept matrix
    inpt2 = inptt(i);
    
%     [xout,yout] = linecirc(slp(i),inpt(i),bv(1),bv(2),magv(i));
%     Xin = [xout,yout];
%     ____________________produces the simultaion________________
%
%     ______________________making the vector________________

%     quiver(bv(1),bv(2),bv2(1),bv2(2),'Autoscale','off','Color','r','LineWidth',2)
%     hold on;
%     ______________________making the line________________

%     x = [bv(1) bv1(1)];
%     y = [bv(2) bv1(2)];
%     plot([ x(1) x(2)], [y(1) y(2)],'Color','b','LineWidth',1.2) %line
%     hold on
    
%     ______________________making the circle________________

    r = abs(magv(i)); %Radius of circle
    x0 = bv(1); y0 = bv(2);  %Center point of circle:
    thcirc = 0:0.01:2*pi; %increament in theta 0,0.01,0.02....360
    x2 = r*cos(thcirc) + x0;
    y2 = r*sin(thcirc) + y0;
%     plot(x2,y2) %circle
%     hold on

%     ______________________finding the the intersection________________    

     [xout,yout] = linecirc(slp2,inpt2,x0,y0,r);
 
%      plot(xout(1),yout(1),'o', 'MarkerSize' ,6, 'MarkerFaceColor', 'c'); %produces dot on the plot
%      hold on;
%      
%      plot(xout(2),yout(2),'o', 'MarkerSize' ,6, 'MarkerFaceColor', 'm'); %produces dot on the plot
%      hold on;
%     ______________________finding the nearest point________________  

    a1 = [xout(1) yout(1)];
    b1 = [xout(2) yout(2)];
    P = [b1(1) b1(2); a1(1) a1(2)];
    PQ = [bv1(1) bv1(2)];
    [k,dist] = dsearchn(P,PQ);


%     plot(P(:,1),P(:,2),'ko')
%     hold on
%     plot(PQ(:,1),PQ(:,2),'*g')
%     hold on
%      plot(P(k,1),P(k,2),'*r')
%      hold on;
%     legend('Data Points','Query Points','Nearest Points','Location','sw')
     
     
%     ______________________making the final vector________________

    bv3(1) = P(k,1); %assigning nearest point to bv3
    bv3(2) = P(k,2); %assigning nearest point to bv3

   
    bv4 = bv3 - bv; %creating respective bv4 quiver second coordinate nearest point to bv3

    bv5(i,1) = bv(1);
    bv5(i,2) = bv(2);
    bv6(i,1) = bv4(1);
    bv6(i,2) = bv4(2);
    bv7(i,1) = bv2(1);
    bv7(i,2) = bv2(2);
    
%     quiver(bv(1),bv(2),bv4(1),bv4(2),'Autoscale','off','Color','g','LineWidth',2)
%     hold off;

%     axis([Mn(1) Mx(1) Mn(2) Mx(2)]) %defining the X,Y range for for the plots axis

%     pause(0.1)
%     drawnow limitrate

end

Mx1 = 2*max(bv5);
Mn1 = 2*min(bv5);

 

for i=1:length(t)

    rf(1) = bv5(i,1)
    rf(2) = bv5(i,2)
    
    rf2(1) = bv7(i,1)
    rf2(2) = bv7(i,2)
    
    vf(1) = bv6(i,1)
    vf(2) = bv6(i,2)
    quiver(rf(1),rf(2),vf(1),vf(2),'Autoscale','off','Color','r','LineWidth',3)
%     hold on;
    
     h = quiver(rf(1),rf(2),rf2(1),rf2(2),'Autoscale','off','Color','b','LineWidth',1.5)
%     hold off;
  
%     axis([Mn1(1) Mx1(1) Mn1(2) Mx1(2)]) %defining the X,Y range for for the plots axis
    
    pause(0.1)
    drawnow limitrate

end

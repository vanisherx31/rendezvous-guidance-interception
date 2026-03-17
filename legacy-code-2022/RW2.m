 clear; close all; clc

p0 = [2 0];     %given position 
time = 10;       %given time 

t = 0: 1: time;
px = p0(1); py = p0(2);


for i=1:length(t)
    
    tsec = i - 1
    
    %       vx(i)=-5 + (5+5)*rand(1,1); %pops positive and negative real numbers
    %       vy(i)=-5 + (5+5)*rand(1,1); %pops positive and negative real numbers
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
    Mx = 2.0*max(p); %accessing the maximum x and y values inside the p matrix
    Mn = 2.0*min(p); %accessing the minimum x and y values inside the p matrix
    
    
for i=1:length(t)
    
    i;
    
    bv = [p(i,1) p(i,2)]; %position vector whose value changes at every time instance taking the values from p matrix
    bv1 = [p(i+1,1) p(i+1,2)]; %position vector whose value changes at every next time instance taking the values from p matrix
    bv2 = bv1 - bv; %producing the second coordinate for quiver so that it can match bv1 coordinates in plot
    
    slpt(i) = ((bv1(2) - bv(2))/(bv1(1) - bv(1))); %slope matrix from bv2 and bv
    slp = slpt'; %creating coulmn slope matrix
    %slp = ((bv2(2) - bv(2))/(bv2(1) - bv(1))); % slope from bv2 and bv
    
    inptt(i) = bv(2) - slp(i)* bv(1); %intercept matrix from bv2 and bv
    inpt = inptt'; %creating coulmn intercept matrix
    
    
%     [xout,yout] = linecirc(slp(i),inpt(i),bv(1),bv(2),magv(i));
%     Xin = [xout,yout];
%     ____________________produces the simultaion________________
%     
%     plot(bv(1),bv(2),'o', 'MarkerSize' ,15, 'MarkerFaceColor', 'm'); %produces dot on the plot
%     hold on;
%     plot(xout(1),yout(2),'o', 'MarkerSize' ,50, 'MarkerFaceColor', 'c'); %produces dot on the plot
    quiver(bv(1),bv(2),bv2(1),bv2(2),'Autoscale','off','Color','r','LineWidth',2)
    hold on;
%     quiver(bv(1),bv(2),xout(2),yout(2),'Autoscale','off','Color','b','LineWidth',3)
%     hold on;
%     plot(xout(1),xout(2),'o', 'MarkerSize' ,7, 'MarkerFaceColor', 'm'); %produces dot on the plot
%     hold on;
%     plot(yout(1),yout(2),'o', 'MarkerSize' ,7, 'MarkerFaceColor', 'y'); %produces dot on the plot
%     hold on;
%     ______________________making the circle________________
%     % Position of line:
     x = [bv(1) bv1(1)];
     y = [bv(2) bv1(2)];
     plot([ x(1) x(2)], [y(1) y(2)],'Color','b','LineWidth',1.5) %line
    hold on
   % Center point of circle:
%     x0 = bv(1);
%     y0 = bv(2);
   % Radius of circle:
%     r =magv;
%     t = linspace(0,2*pi,300);
%     x2 = r*cos(t) + x0;
%     y2 = r*sin(t) + y0;
%     plot(x2,y2) %circle
%     hold on
%     [xc,yc] = polyxpoly(x1,y1,x2,y2)
%     centers = [bv(1) bv(2)];
%     radii = magv(i);
% 
%     viscircles(centers,radii);
% 
     hold off;
     axis([Mn(1) Mx(1) Mn(2) Mx(2)]) %defining the X,Y range for for the plots axis
     pause(0.3)
     drawnow limitrate

end

% %Random Data
% x = (1:0.01:2*pi)';
% y = sin(x);
% %Animated Figure
% figure;
% hold on;
% plot(x(1),y(1),'db');
% axis([min(x) max(x) min(y) max(y)]);
% xlabel('X', 'Interpreter','Latex');
% ylabel('Y', 'Interpreter','Latex');
% grid on;
% box on;
% for k = 2:length(x) %loop
%     plot(x(k),y(k),'db');
%     drawnow
% end

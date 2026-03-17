clear; close all; clc; clf

% for j = 1:2
    
 time = 150;

[a3 b3 c3 d3 Mx1 Mn1] =  vectorR2(-20,-10,10,10,time);

[a4 b4 c4 d4 Mx2 Mn2] =  vectorR2(200,-10,20,20,time);

 t = 0: 1: time;
 
 MX1 = max([Mx1 Mx2]);
 MX2 = min([Mx1 Mx2]);
 MN1 = max([Mn1 Mn2]);
 MN2 = min([Mn1 Mn2]);
 
  MX = [MX1 MX2];
  MN = [MN1 MN2];
  
  
  MX3 = max([MN(1) MX(1) MN(2) MX(2)]) - (0.10*max([MN(1) MX(1) MN(2) MX(2)]));
  MN3 = min([MN(1) MX(1) MN(2) MX(2)]);
  
  v60 = [MN(1) MX(1) MN(2) MX(2)] %(-x +x -y +y)

    for i=1:length(t)

    rf(1) = a3(i,1);
    rf(2) = a3(i,2);
    
    rf2(1) = b3(i,1);
    rf2(2) = b3(i,2);
    
    vf(1) = c3(i,1);
    vf(2) = c3(i,2);
    
    vff(1) = d3(i,1);
    vff(2) = d3(i,2);
    
    AJ(i) = sqrt((rf(1) - vff(1))^2 + (rf(2) - vff(2))^2);
    
    rf1(1) = a4(i,1);
    rf1(2) = a4(i,2);
    
    rf12(1) = b4(i,1);
    rf12(2) = b4(i,2);
    
    vf1(1) = c4(i,1);
    vf1(2) = c4(i,2);
%  ______________________________________________________________________________________________   
 
    subplot(2,1,1);
    
    quiver(rf(1),rf(2),vf(1),vf(2),'Autoscale','off','Color','r','LineWidth',3)
    hold on;

%     quiver(rf(1),rf(2),rf2(1),rf2(2),'Autoscale','off','Color','b','LineWidth',1.5)
%     hold on;

    quiver(rf1(1),rf1(2),vf1(1),vf1(2),'Autoscale','off','Color','b','LineWidth',3)
    hold off;

%     quiver(rf1(1),rf1(2),rf12(1),rf12(2),'Autoscale','off','Color','m','LineWidth',1.5)
%     hold off;

    axis([MN3 MX3 MN3 MX3]) %defining the X,Y range for for the plots axis
%    axis([-2000 2000 -2000 2000])
%     axis(['auto x' 'auto y'])

%     axis off
    pause(0.09)
    drawnow limitrate
%  ______________________________________________________________________________________________   

    subplot(2,1,2);
    plot(rf(1),rf(2),'o', 'MarkerSize' ,6, 'MarkerFaceColor', 'c'); %produces dot on the plot
    hold on;
    
    plot(rf1(1),rf1(2),'o', 'MarkerSize' ,6, 'MarkerFaceColor', 'm'); %produces dot on the plot
    hold off;
    
    axis([MN3 MX3 MN3 MX3])
    pause(0.09)
    drawnow limitrate

end 
% end

clear; close all; clc 

time = 40;

[a b c Mx1 Mn1] =  vectorR2(0,0,time);

[a1 b1 c1 Mx2 Mn2] =  vectorR2(10,-10,time);

 t = 0: 1: time;
 
 MX1 = max([Mx1 Mx2]);
 MX2 = min([Mx1 Mx2]);
 MN1 = max([Mn1 Mn2]);
 MN2 = min([Mn1 Mn2]);
 
%  MX = [MX1 MX2];
%  MN = [MN1 MN2];

    for i=1:length(t)

    rf(1) = a(i,1);
    rf(2) = a(i,2);
    
    rf2(1) = b(i,1);
    rf2(2) = b(i,2);
    
    vf(1) = c(i,1);
    vf(2) = c(i,2);
    
    rf1(1) = a1(i,1);
    rf1(2) = a1(i,2);
    
    rf12(1) = b1(i,1);
    rf12(2) = b1(i,2);
    
    vf1(1) = c1(i,1);
    vf1(2) = c1(i,2);
    
    quiver(rf(1),rf(2),vf(1),vf(2),'Autoscale','off','Color','r','LineWidth',2)
    hold on;
    
    quiver(rf(1),rf(2),rf2(1),rf2(2),'Autoscale','off','Color','b','LineWidth',1.5)
    hold on;
  
    quiver(rf1(1),rf1(2),vf1(1),vf1(2),'Autoscale','off','Color','r','LineWidth',2)
    hold on;
    
    quiver(rf1(1),rf1(2),rf12(1),rf12(2),'Autoscale','off','Color','b','LineWidth',1.5)
    hold off;
     axis([-1500 1500 -1500 1500]) %defining the X,Y range for for the plots axis
   
%     axis(['auto x' 'auto y'])

%     axis off
    pause(0.1)
    drawnow limitrate

end 


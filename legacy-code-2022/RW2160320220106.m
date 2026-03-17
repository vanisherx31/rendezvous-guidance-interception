clear; close all; clc 

time = 250;

[a3 b3 c3 Mx1 Mn1] =  vectorR2(-200,-100,time);

[a4 b4 c4 Mx2 Mn2] =  vectorR2(200,-100,time);

 t = 0: 1: time;
 
 MX1 = max([Mx1 Mx2]);
 MX2 = min([Mx1 Mx2]);
 MN1 = max([Mn1 Mn2]);
 MN2 = min([Mn1 Mn2]);
 
  MX = 3.0*[MX1 MX2];
  MN = 4.5*[MN1 MN2];
  
  v60 = [MN(1) MX(1) MN(2) MX(2)] %(-x +x -y +y)

    for i=1:length(t)

    rf(1) = a3(i,1);
    rf(2) = a3(i,2);
    
    rf2(1) = b3(i,1);
    rf2(2) = b3(i,2);
    
    vf(1) = c3(i,1);
    vf(2) = c3(i,2);
    
    rf1(1) = a4(i,1);
    rf1(2) = a4(i,2);
    
    rf12(1) = b4(i,1);
    rf12(2) = b4(i,2);
    
    vf1(1) = c4(i,1);
    vf1(2) = c4(i,2);
    
    quiver(rf(1),rf(2),vf(1),vf(2),'Autoscale','off','Color','r','LineWidth',2)
    hold on;
    
    quiver(rf(1),rf(2),rf2(1),rf2(2),'Autoscale','off','Color','b','LineWidth',1.5)
    hold on;
  
    quiver(rf1(1),rf1(2),vf1(1),vf1(2),'Autoscale','off','Color','r','LineWidth',2)
    hold on;
    
    quiver(rf1(1),rf1(2),rf12(1),rf12(2),'Autoscale','off','Color','b','LineWidth',1.5)
    hold off;
    
    axis([MN(2) MX(2) MN(2) MX(2)]) %defining the X,Y range for for the plots axis
   
%     axis(['auto x' 'auto y'])

%     axis off
    pause(0.02)
    drawnow limitrate

end 


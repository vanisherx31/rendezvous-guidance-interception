
%WPNAV_SPEED = 9;

%sim('ABCtest1', 20000);

%close all;
%clear all;
%clc

for i=1:RunTime 
    timeCFC(i)=i;
    if (timeCFC(i)<Clmb||timeCFC(i)>ClmbFC)
        yCFC(i)=0;
    else
        yCFC(i)=1;
    end
end
subplot(4,1,1)
plot(timeCFC,yCFC)

for i=1:RunTime 
    timeCFCBC(i)=i;
    if (timeCFCBC(i)<ClmbFC||timeCFCBC(i)>ClmbFCBC)
        yCFCBC(i)=0;
    else
        yCFCBC(i)=1;
    end
end

subplot(4,1,2)
plot(timeCFCBC,yCFCBC)

for i=1:RunTime 
    timeCFCBCD75(i)=i;
    if (timeCFCBCD75(i)<ClmbFCBC||timeCFCBCD75(i)>ClmbFCBCD75Gnd)
        yCFCBCD75(i)=0;
    else
        yCFCBCD75(i)=1;
    end
end
subplot(4,1,3)
plot(timeCFCBCD75,yCFCBCD75);

for i=1:RunTime 
    timeCFCBCD75Gnd(i)=i;
    if (timeCFCBCD75Gnd(i)<ClmbFCBCD75Gnd)
        yCFCBCD75Gnd(i)=0;
    else
        yCFCBCD75Gnd(i)=1;
    end
end
subplot(4,1,4)
plot(timeCFCBCD75Gnd,yCFCBCD75Gnd);

%subplot(5,1,1)
%    p11=plot(timeCFC,yCFC);hold on;
%    p12=plot(timeCFCBC,yCFCBC);hold on;
%    p13=plot(timeCFCBCD75,yCFCBCD75);
%    p14= plot(timeCFCBCD75Gnd,yCFCBCD75Gnd);
%    hold off;
%    drawnow limitrate

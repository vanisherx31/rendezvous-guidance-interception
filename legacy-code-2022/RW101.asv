clear; close all; clc; clear figure; clf

O = [0 0];
t = [6 8];
% t = randi([-10 10],1,2);
vt = [5 5];
% vt = randi([-10 10],1,2);
xpls = [3 0];
% w2 = randi([-10 10],1,2);

lambda(1,1) = vectorangleR2(xpls,O,t,O); %head and then tail of vector
lambda(1,2) = deg2rad(lambda(1,1))

realtheta(1,1) = vectorangleR2(t,O,vt,t) %angle between velocity vector and LOS
if realtheta(1,1)<360 && realtheta(1,1)>270
    theta(1,1) = 360 - (realtheta(1,1))
elseif realtheta(1,1)<270 && realtheta(1,1)>180
    theta(1,1) = 360 - (realtheta(1,1))
else
    theta(1,1) = realtheta(1,1)
end
theta(1,2) = deg2rad(theta(1,1))
realtheta(1,2) = deg2rad(realtheta(1,1))

a1 = vectorangleR2(xpls,O,vt,t); %angle vt-t-Xpls

% if a1(1,1)<360 && a1(1,1)>270
%     a2(1,1) = 360 - (a1(1,1))
% elseif a1(1,1)<270 && a1(1,1)>180
%     a2(1,1) = 360 - (a1(1,1))
% else
%     a2(1,1) = a1(1,1)
% end

%     if realtheta(1,1)>90 && realtheta(1,1)<180
%     mklm = angleplot(t(1,1),t(1,2),0,(0 + a1(1,1)),(0.5*vTmag));
%     hold on;

vTmag = sqrt(((vt(1,1)-t(1,1))^2)+((vt(1,2)-t(1,2))^2));

mklm = angleplot(t(1,1),t(1,2),0,(0 + deg2rad(a1(1,1))),(0.5*vTmag));
hold on;

axs = [0 12 0 12]; 
axis(axs);

hold on;
plot(t(1,1),t(1,2),'s', 'MarkerSize' ,6, 'MarkerFaceColor', 'r'); %produces dot on the plot
hold on;
plot(xpls(1,1),xpls(1,2),'.', 'MarkerSize' ,6, 'MarkerFaceColor', 'r'); %produces dot on the plot
hold on;
plot(vt(1,1),vt(1,2),'^', 'MarkerSize' ,7, 'MarkerFaceColor', 'y'); %produces dot on the plot
hold on;
plot([vt(1,1),t(1,1)],[vt(1,2),t(1,2)],'LineWidth',1);
hold on;
plot([O(1,1),t(1,1)],[O(1,2),t(1,2)],'LineWidth',1);
hold on;
plot([O(1,1),xpls(1,1)],[O(1,2),xpls(1,2)],':','LineWidth',3);
hold on;
% plot([vt(1,1),vt(1,2)],[t(1,2),t(1,2)],'LineWidth',2);
% hold on;

%% angle between target velocity vector and LOS

axis(axs);
hold on;
if realtheta(1,1)>90 && realtheta(1,1)<180
    tvl1 = lambda(1,2);
    tvl2 = (lambda(1,2) + theta(1,2));
    tvl = angleplot(t(1,1),t(1,2),tvl1,tvl2,vTmag);
    hold on;
elseif realtheta(1,1)<270 && realtheta(1,1)>180
    tvl1 = lambda(1,2);
    tvl2 = lambda(1,2)+ realtheta(1,2);
    tvl = angleplot(t(1,1),t(1,2),tvl1,tvl2,vTmag);
    hold on;
elseif realtheta(1,1)<360 && realtheta(1,1)>270
    tvl1 = lambda(1,2);
    tvl2 = lambda(1,2)+ realtheta(1,2);
    tvl = angleplot(t(1,1),t(1,2),tvl1,tvl2,vTmag);
    hold on;
elseif realtheta(1,1)==45
    tvl1 = lambda(1,2);
    tvl2 = lambda(1,2)+ realtheta(1,2);
    tvl = angleplot(t(1,1),t(1,2),tvl1,tvl2,vTmag);
    hold on;
elseif realtheta(1,1)==90
    tvl1 = lambda(1,2);
    tvl2 = lambda(1,2)+ realtheta(1,2);
    tvl = angleplot(t(1,1),t(1,2),tvl1,tvl2,vTmag);
    hold on;
else
    tvl1 = lambda(1,2);
    tvl2 = (lambda(1,2) + theta(1,2));
    tvl = angleplot(t(1,1),t(1,2),tvl1,tvl2,vTmag);
    hold on;
end
%     angleplot(O(1,1),O(1,2),lambda(1,2),0,vTmag);
%     hold on;
axis(axs)
hold on;

rad2deg((lambda(1,2) + theta(1,2))-(lambda(1,2)));
rad2deg((lambda(1,2) + (pi/2)));
rad2deg((lambda(1,2) + theta(1,2)));

%% components radial and tangential component of vt
if(lambda(1,2) + theta(1,2)) > (lambda(1,2) + (pi/2)) && rad2deg((lambda(1,2) + theta(1,2))-(lambda(1,2))) ~= 180 && rad2deg(lambda(1,2) + theta(1,2)) > 180
    axis(axs)
    hold on;
    if realtheta(1,1)>90  && realtheta(1,1)<180
        rdtn1 = (lambda(1,2) + (pi));
        rdtn2 = (lambda(1,2) + ((pi/2)));
        rdtn3 = (lambda(1,2) + realtheta(1,2));
        %         rdtn = angleplot2(t(1,1),t(1,2),rdtn1,rdtn2,1*(vTmag));
        rdtn = angleplot4(t(1,1),t(1,2),rdtn1,rdtn2,rdtn3,1*(vTmag));
        hold on;
    elseif realtheta(1,1)>180  && realtheta(1,1)<270
        rdtn1 = (lambda(1,2) + (pi));
        rdtn2 = (lambda(1,2) + ((3*pi/2)));
        rdtn3 = (lambda(1,2) + realtheta(1,2));
        rdtn = angleplot4(t(1,1),t(1,2),rdtn1,rdtn2,rdtn3,1*(vTmag));
        
        %         rdtn = angleplot2(t(1,1),t(1,2),rdtn1,rdtn2,1*(vTmag));
        %         rdtn = angleplot4(t(1,1),t(1,2),rdtn1,rdtn2,realtheta(1,2),1*(vTmag));
        hold on;
    elseif realtheta(1,1)==180
        rdtn1 = (lambda(1,2) + (pi/2));
        rdtn2 = (lambda(1,2) + (pi));
        rdtn3 = (lambda(1,2) + realtheta(1,2));
        rdtn = angleplot4(t(1,1),t(1,2),rdtn1,rdtn2,rdtn3,1*(vTmag));
        
        %         rdtn = angleplot3(t(1,1),t(1,2),rdtn1,rdtn2,1*(vTmag));
        hold on;
    else
        rdtn1 = (lambda(1,2) + (pi) + (2*pi));
        rdtn2 = (lambda(1,2) + (pi/2));
        rdtn3 = (lambda(1,2) + realtheta(1,2));
        rdtn = angleplot4(t(1,1),t(1,2),rdtn1,rdtn2,rdtn3,1*(vTmag));
        
        %         rdtn = angleplot2(t(1,1),t(1,2),rdtn1,rdtn2,1*(vTmag));
        hold on;
    end
    
elseif (lambda(1,2) + theta(1,2)) > (lambda(1,2) + (pi/2)) && rad2deg((lambda(1,2) + theta(1,2))-(lambda(1,2))) ~= 180
    
    if realtheta(1,1)>90  && realtheta(1,1)<180
        rdtn1 = (lambda(1,2) + (pi));
        rdtn2 = (lambda(1,2) + (pi/2));
        rdtn3 = (lambda(1,2) + realtheta(1,2));
        %         rdtn = angleplot2(t(1,1),t(1,2),rdtn1,rdtn2,1*(vTmag));
        rdtn = angleplot4(t(1,1),t(1,2),rdtn1,rdtn2,rdtn3,1*(vTmag));
        hold on;
    elseif realtheta(1,1)>180  && realtheta(1,1)<270
        rdtn1 = (lambda(1,2) + (pi))
        rdtn2 = (lambda(1,2) + ((3*pi/2)))
        rdtn3 = (lambda(1,2) + realtheta(1,2));
        rdtn = angleplot4(t(1,1),t(1,2),rdtn1,rdtn2,rdtn3,1*(vTmag));
        %         rdtn = angleplot2(t(1,1),t(1,2),rdtn1,rdtn2,1*(vTmag));
        hold on;
    else
        rdtn1 = (lambda(1,2) + (pi/2))
        rdtn2 = (lambda(1,2) + (pi))
        rdtn3 = (lambda(1,2) + realtheta(1,2));
        rdtn = angleplot4(t(1,1),t(1,2),rdtn1,rdtn2,rdtn3,1*(vTmag));
        %         rdtn = angleplot2(t(1,1),t(1,2),rdtn1,rdtn2,1*(vTmag));
        hold on;
    end
    
elseif(lambda(1,2) + theta(1,2)) > (lambda(1,2) + (pi/2)) && rad2deg((lambda(1,2) + theta(1,2))-(lambda(1,2))) == 180
    rdtn1 = (lambda(1,2) + (pi/2))
    rdtn2 = (lambda(1,2) + (pi))
    rdtn3 = (lambda(1,2) + realtheta(1,2));
    rdtn = angleplot4(t(1,1),t(1,2),rdtn1,rdtn2,rdtn3,1*(vTmag));
    %         rdtn = angleplot3(t(1,1),t(1,2),rdtn1,rdtn2,1*(vTmag));
    hold on;
else
    if realtheta(1,1)>270  && realtheta(1,1)<360
        rdtn1 = lambda(1,2);
        rdtn2 = (lambda(1,2) + (3*pi/2))
        rdtn3 = (lambda(1,2) + realtheta(1,2));
        rdtn = angleplot4(t(1,1),t(1,2),rdtn1,rdtn2,rdtn3,1*(vTmag));
        %         rdtn = angleplot2(t(1,1),t(1,2),rdtn1,rdtn2,(vTmag));
        hold on;
    else
        if realtheta(1,1)==0  || realtheta(1,1)==180
            rdtn1 = (lambda(1,2) + (pi/2))
            rdtn2 = (lambda(1,2) + (0))
            rdtn3 = (lambda(1,2) + realtheta(1,2));
            rdtn = angleplot4(t(1,1),t(1,2),rdtn1,rdtn2,rdtn3,1*(vTmag));
            %                 rdtn = angleplot3(t(1,1),t(1,2),rdtn1,rdtn2,1*(vTmag));
            hold on;
        else
            rdtn1 = lambda(1,2);
            rdtn2 = (lambda(1,2) + (pi/2));
            rdtn3 = (lambda(1,2) + realtheta(1,2));
            %                 rdtn = angleplot2(t(1,1),t(1,2),rdtn1,rdtn2,(vTmag));
            rdtn = angleplot4(t(1,1),t(1,2),rdtn1,rdtn2,rdtn3,1*(vTmag));
            hold on;
        end
    end
end
%     angleplot(t(1,1),t(1,2),lambda(1,2),(lambda(1,2) + (pi/2)),vTmag);
%     hold on;
%     angleplot(pT(i,1),pT(i,2),lambda(i,4),(lambda(i,4)+theta(i,4)),vTmag)
%     hold on;
%     rIPN(i,1),rIPN(i,2)
%     angleplot(rIPN(i,1),rIPN(i,2),lambda(i,4),(lambda(i,4)+ mbn(i,6)),vIPNmag)
%     hold on;
axis(axs)
hold on;
%     pause(0.00000005)

tn = [rdtn(1,1) rdtn(1,2)];

rd = [rdtn(2,1) rdtn(2,2)];

rdm = sqrt((((rd(1 ,1))-(t(1,1)))^(2))+((((rd(1 ,2))-(t(1,2)))^(2))));
tnm = sqrt((((tn(1 ,1))-(t(1,1)))^(2))+((((tn(1 ,2))-(t(1,2)))^(2))));

rdmtnm = sqrt(((rdm)^(2))+((tnm)^(2)))

%%  %bkp = dbstatus % to save the current breakpoints
    %dbstop(bkp)    % to restore the saved breakpoints
%% 
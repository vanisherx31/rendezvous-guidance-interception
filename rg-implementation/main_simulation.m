clear; clc; close all

%% Simulation parameters
dt = 0.5;
N  = 600;

Amax = 8;

xmin = 0; xmax = 6000;
ymin = 0; ymax = 8000;

capture_radius = 50;

%% Robot initial state
rR = [6000 50];
vR = [0 0];

%% Storage
RX = [];
RY = [];
TX = [];
TY = [];

%% Figure setup
figure
hold on
grid on
axis equal

xlim([xmin xmax])
ylim([ymin ymax])

rectangle('Position',[xmin ymin xmax ymax],'EdgeColor','k','LineWidth',2)

robotPath  = plot(NaN,NaN,'r','LineWidth',1);
targetPath = plot(NaN,NaN,'b','LineWidth',1);

robotDot  = plot(NaN,NaN,'ro','MarkerFaceColor','r','MarkerSize',8);
targetDot = plot(NaN,NaN,'bo','MarkerFaceColor','b','MarkerSize',8);

LOSline = plot(NaN,NaN,'c','LineWidth',1.5);

% legend('Boundary','Robot Path','Target Path','Robot','Target','LOS')

%% Simulation loop
for k = 1:N
    
    t = k*dt;
    
    %% Target motion (zigzag / unpredictable)
    
    rT = [3000 + 2000*sin(0.01*t), ...
          4000 + 2500*sin(0.015*t) + 600*cos(0.07*t)];
    
    vT = [2000*0.01*cos(0.01*t), ...
          2500*0.015*cos(0.015*t) - 600*0.07*sin(0.07*t)];
    
    %% Distance
    
    r = rT - rR;
    dRT = norm(r);
    
    %% Interception check
    
    if dRT < capture_radius
        disp("TARGET INTERCEPTED!")
        break
    end
    
    %% Line of sight
    
    LOS = r / dRT;
    
    %% Maximum closing velocity
    
    vrmax = sqrt(2*dRT*Amax);
    
    max_robot_speed = 150;
    
    speed = min(vrmax,max_robot_speed);
    
    %% Desired velocity toward target
    
    v_des = speed * LOS;
    
    %% Feasible Acceleration Region
    
    FAR = [ 0  Amax
            Amax 0
            0 -Amax
           -Amax 0];
    
    %% Feasible Velocity Region
    
    FVR = vR + FAR*dt;
    
    %% Choose feasible velocity
    
    v_cmd = v_des;
    
    %% Propagate robot
    
    rR = rR + v_cmd*dt;
    vR = v_cmd;
    
    %% Keep robot inside boundary
    
    rR(1) = min(max(rR(1),xmin),xmax);
    rR(2) = min(max(rR(2),ymin),ymax);
    
    %% Store paths
    
    RX(end+1) = rR(1);
    RY(end+1) = rR(2);
    
    TX(end+1) = rT(1);
    TY(end+1) = rT(2);
    
    %% Update plots
    
    set(robotPath,'XData',RX,'YData',RY)
    set(targetPath,'XData',TX,'YData',TY)
    
    set(robotDot,'XData',rR(1),'YData',rR(2))
    set(targetDot,'XData',rT(1),'YData',rT(2))
    
    set(LOSline,'XData',[rR(1) rT(1)],'YData',[rR(2) rT(2)])
    
    drawnow
    
end

title("Robot Interception Simulation")

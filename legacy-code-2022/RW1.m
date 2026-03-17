clear all; clc ; 

px = 10; py = 20;
p0 = [px py];
time = 50;
v = [10 10]     %given velocity
t = 0: 1: time;
a10 = [0,100,100,0];
a11 = [0,0,100,100];
for i=1:length(t)
    
    tsec = i - 1
    
%     ______________________producing constant velocity________________    

%     vx(i)=v(1);    %for constant velocity condition
%     vy(i)=v(2);    %for constant velocity condition

%     ______________________producing variable velocity________________    
    
%     vx(i)=-5 + (5+5)*rand(1,1); %pops positive and negative real numbers
%     vy(i)=-5 + (5+5)*rand(1,1); %pops positive and negative real numbers

    vx(i)=randi([-1 1],1,1);    %pops positive and negative randow integers between -50 and 50 in 1x1 matrix
    vy(i)=randi([-1 1],1,1);    %pops positive and negative randow integers between -50 and 50 in 1x1 matrix

    if (vx(1,i) == 0 && vy(1,i) == 0)
        
        vx(1,i) = 2;
        vy(1,i) = 2;
        
        c(i,1) = vx(1,i); %adjusting the row to the column matrix
        d(i,1) = vy(1,i); %adjusting the row to the column matrix
    else
        
    c = vx';
    d = vy';

    v = [c d]; %velocity column matrix
    
    end
%     c = vx';
%     d = vy';

%     v = [c d]; %velocity column matrix
    
    magvt(i) = sqrt(c(i)^2 + d(i)^2); %velocity magnitude matrix
    magv = magvt'; %velocity magnitude column matrix
    
    px(i+1) = px(i) + c(i)*i;
    py(i+1) = py(i) + d(i)*i;
    theta(i) = angle(px(i),py(i),px(i+1),py(i+1));
     
    a = px';
    b = py';
    p = [a b]

    pf = [p(i+1,1) p(i+1,2)] %accessing elements inside the p matrix the last element that was created
     
    [in(i),on(i)] = inpolygon(p(i,1),p(i,2),a10,a11) 
%     in(i,1)
%     [pp(i,1) pp(i,2)] = [in(i,1) in(i,2)]
%     O = theta';
      
end

% function[co] = angleplot3(x,y,theta1,theta2,theta3,L);
% theta1;theta2;
% xEnd = x+L(1,1)*cos((theta3)-(theta1))*cos(theta2);          % X coordinate of arrow end
% yEnd = y+L(1,1)*cos((theta3)-(theta1))*sin(theta2);          % Y coordinate of arrow end
% xEnd2 = x+L(1,1)*sin((theta3)-(theta1))*cos(theta1);          % X coordinate of arrow end
% yEnd2 = y+L(1,1)*sin((theta3)-(theta1))*sin(theta1);          % Y coordinate of arrow end
% points = linspace(theta1, theta2);    % 100 points from 0 to theta
% cos(points);
% (L(1,1)/2).*cos(points);
% xCurve = x+(L(1,1)/2).*cos(points);  % X coordinates of curve
% yCurve = y+(L(1,1)/2).*sin(points);  % Y coordinates of curve
% plot(x+[-L(1,1) L(1,1)], [y y], '--k');   % Plot dashed line
% hold on;                        % Add subsequent plots to the current axes
% axis([x+[-L(1,1) L(1,1)] y+[-L(1,1) L(1,1)]]);      % Set axis limits
% axis equal;                     % Make tick increments of each axis equal
% arrow([x y], [xEnd yEnd],'FaceColor', 'c');      % Plot arrow
% % h1 = plot(xCurve, yCurve, '-k');     % Plot curve
% % h2 = plot(x, y, 'o', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'w');  % Plot point
% % arrow([x y], [xEnd2 yEnd2],'FaceColor', 'g');
% co = [0 0 ; xEnd yEnd];
% end
function[co,h1,h2] = angleplot4(x,y,theta1,theta2,theta3,L);
rad2deg(theta1) 
rad2deg(theta2)
rad2deg(theta3)

rad2deg((theta3)-(theta1))
rad2deg((theta2)-(theta3))

xEnd = x+abs(L(1,1)*cos((theta2)-(theta3)))*cos(theta2);          % X coordinate of arrow end for tangential
yEnd = y+abs(L(1,1)*cos((theta2)-(theta3)))*sin(theta2);          % Y coordinate of arrow end for tangential
xEnd2 = x+abs(L(1,1)*sin((theta2)-(theta3)))*cos(theta1);          % X coordinate of arrow end for radial
yEnd2 = y+abs(L(1,1)*sin((theta2)-(theta3)))*sin(theta1);          % Y coordinate of arrow end for radial

% xEnd2 = x+abs(L(1,1)*cos((theta3)-(theta1)))*cos(theta1);          % X coordinate of arrow end for radial
% yEnd2 = y+abs(L(1,1)*cos((theta3)-(theta1)))*sin(theta1);          % Y coordinate of arrow end for radial

points = linspace(theta1, theta2);    % 100 points from 0 to theta
cos(points);
(L(1,1)/2).*cos(points);
xCurve = x+(L(1,1)/(3.5)).*cos(points);  % X coordinates of curve
yCurve = y+(L(1,1)/(3.5)).*sin(points);  % Y coordinates of curve
plot(x+[-L(1,1) L(1,1)], [y y], '--k');   % Plot dashed line
hold on;                        % Add subsequent plots to the current axes
axis([x+[-L(1,1) L(1,1)] y+[-L(1,1) L(1,1)]]);      % Set axis limits
axis equal;                     % Make tick increments of each axis equal

co = [xEnd yEnd ; xEnd2 yEnd2];
if rad2deg((theta2)-(theta3)) == 0
%     h1 = plot(xCurve, yCurve, '--k' ,'Color', 'g');
    arrow([x y], [xEnd yEnd],'FaceColor', 'b');
else
    arrow([x y], [xEnd yEnd],'FaceColor', 'g');      % Plot arrow
    h1 = plot(xCurve, yCurve, '--k' ,'Color', 'g');     % Plot curve
    % h2 = plot(x, y, 'o', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'w');  % Plot point
    arrow([x y], [xEnd2 yEnd2],'FaceColor', 'b');
end 
end
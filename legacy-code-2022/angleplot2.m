function[co,h1,h2] = angleplot2(x,y,theta1,theta2,L);
theta1;theta2;
xEnd = x+L(1,1)*cos(theta2);          % X coordinate of arrow end
yEnd = y+L(1,1)*sin(theta2);          % Y coordinate of arrow end
xEnd2 = x+L(1,1)*cos(theta1);          % X coordinate of arrow end
yEnd2 = y+L(1,1)*sin(theta1);          % Y coordinate of arrow end
points = linspace(theta1, theta2);    % 100 points from 0 to theta
cos(points);
(L(1,1)/2).*cos(points);
xCurve = x+(L(1,1)/(2.5)).*cos(points);  % X coordinates of curve
yCurve = y+(L(1,1)/(2.5)).*sin(points);  % Y coordinates of curve
plot(x+[-L(1,1) L(1,1)], [y y], '--k');   % Plot dashed line
hold on;                        % Add subsequent plots to the current axes
axis([x+[-L(1,1) L(1,1)] y+[-L(1,1) L(1,1)]]);      % Set axis limits
axis equal;                     % Make tick increments of each axis equal
arrow([x y], [xEnd yEnd],'FaceColor', 'g');      % Plot arrow
h1 = plot(xCurve, yCurve, '--k' ,'Color', 'g');     % Plot curve
% h2 = plot(x, y, 'o', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'w');  % Plot point
arrow([x y], [xEnd2 yEnd2],'FaceColor', 'k');
co = [xEnd yEnd ; xEnd2 yEnd2];
end
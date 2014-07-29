%% Module for visualizing optimal frustrum sizes

% A "bowl" is an inverted frustrum.
% r1 is the top of the frustrum (i.e., the BOTTOM of the bowl)
% r2 is the base of the frustrum (i.e., the TOP of the bowl)
clear ; close all; clc

%% Settings

% Step size in the plot
step_size = 1/10;
% Bounds of the critical ratio
min_crit_ratio = 0;
max_crit_ratio = 5;

% Resolution of the angles in the plot
angle_res = 1;
% Minimum exterior bowl angle
min_degrees = 5;

%% Graph variables
[crit_ratio, exterior_angle] = meshgrid( ...
    min_crit_ratio:step_size:max_crit_ratio , ...
    min_degrees:angle_res:90);

% Convert to radians
exterior_angle = exterior_angle * pi / 180;

[vol, grad_h, grad_theta] = frustrum(crit_ratio, exterior_angle);

% For each exterior angle, find the critical ratio where the volume is
% maximized
max_ratio_at_fixed_angle = max(vol,[],1);

figure;
plot(crit_ratio, max_ratio_at_fixed_angle);
title('Volume of a frustrum');
xlabel('Critical Ratio');
ylabel('Volume');

figure;
surf(crit_ratio, exterior_angle, vol, 'EdgeColor', 'none');
title('Volume of a frustrum');
xlabel('Critical Ratio');
ylabel('Exterior Angle (radians)');
zlabel('Volume');





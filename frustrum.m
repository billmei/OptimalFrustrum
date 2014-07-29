function [ vol, grad_h, grad_theta ] = frustrum( crit_ratio, exterior_angle )
% Calculates the relative volume of a frustrum based on its critical
% ratio and the exterior angle. Also calculates the gradient based on
% height and crit_ratio

r1 = 1;
h = crit_ratio .* r1;
r2 = cos(exterior_angle) .* (r1 .^ 2 + h.^2);

vol = (h .* pi/3) .* (r1 .^ 2 + r2 .^ 2 + r1 .* r2);
grad_h = (pi/3) .* (3 .* (h .^ 2) .* (cos(exterior_angle) .^ 2) + ...
    2 .* h .* cos(exterior_angle) + 1);
grad_theta = (-pi/3) .* (h .^2) .* sin(exterior_angle) .* ...
    (2 .* h .* cos(exterior_angle) + 1);

end


clear all
close all
tic
% Parameters
m  = 1;     % mass
b  = 10;    % damping constant
k  = 10;  % spring consta
F0 = 1;     % amplitude of external force
F_fric_mag = F0*1;
f=F_fric_mag;
x_eq = f/k;

% Initial conditions
x0 = 0;  % initial position
v0 = 0;  % initial velocity

% Time span
tspan = [0 20];

% ODE solver
[t, y] = ode45(@(t, y) spring_mass_damper(t, y, m, b, k, F0, f), tspan, [x0; v0]);

% Plot results
figure;
plot(t, y(:, 1));
title('Displacement vs. Time');
xlabel('Time (s)');
ylabel('Displacement (m)');
% t
%% 
% ForceMat = zeros(size(t));
% for i=1:length(t)    
%     ForceMat(i)=STEPfunc(1,t(i),y(i,:),f);
% end
% %%
% figure
% plot(t,ForceMat)
% title('Force')
figure
plot(t,y(:,2))
title('velocity')
    %%
figure
hold on
plot(t, y(:, 1));
% plot(t,ForceMat)
%%
% figure;
% plot(y(1:10:end,1),ForceMat(1:10:end))
% ylim([0 10])

% Force is F_ind=F_fric-ky
% Indentation is not the same as y. 
toc
disp(max(y(:,1)))

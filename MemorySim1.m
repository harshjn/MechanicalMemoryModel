clear all
close all


global Fswitch;
Fswitch = 0; % This switch decides when to dis-engage indentor force

tic
% Parameters
m  = 1;     % mass
b  = 10;    % damping constant
k  =10;  % spring consta
F0 = 0.25;     % amplitude of external force
F_fric_mag = 0.1;
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
tMat = (0:0.1:100)';
F_appliedMat=[ceil(100*tMat(1:50))/100 * F0 ; ...
    10*F0-F0*ceil(tMat(51:100)*100)/100; 0*tMat(101:end)];

F_applied = interp1(tMat,F_appliedMat,t);

ForceMat = zeros(size(t));
for i=1:length(t)    
    ForceMat(i)=STEPfunc(F0,t(i),k,b,y(i,:),f);
end
%
figure
yyaxis left
plot(t,ForceMat)
yyaxis right
plot(t,y(:,2))
title('velocity')

figure
plot(t,F_applied)
title('Force')

figure
hold on
plot(t, y(:, 1));
% plot(t,ForceMat)
%%
figure
yyaxis left
plot(t,-1*smooth(ForceMat,10))
figure;
plot(y(1:end,1),-1*smooth(ForceMat,10),'.')
% ylim([0 10])
% 
% % Force is F_ind=F_fric-ky
% % Indentation is not the same as y. 
% toc
% disp(max(y(:,1)))

%% Plot hysteresis
I_applied = F_applied/max(F_applied)*0.01;
PosMat=interp1(linspace(0,20,200),I_applied,t);

scatter(circshift(PosMat,20),-smooth(ForceMat,30))
%Circshift is used to account for the delay. 

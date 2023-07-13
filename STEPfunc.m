function ForceOut = STEPfunc(F0,t,x,F_fric_mag)
t
x(1); % is the position
x(2); % is the velocity. 

% if(x(1)<0)
%     disp('x negative. Not allowed')
%     pause(5)
% %     break
% end

F_fric = -sign(x(2))*F_fric_mag;

if t < 5
    ForceOut = ceil(100*t)/100 * F0 + F_fric;
    
elseif t >= 5 && t <= 10
    ForceOut =  10-ceil(t*100)/100 * F0+ F_fric;
    
else
    ForceOut = F_fric;
end





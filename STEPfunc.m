function ForceOut = STEPfunc(F0,t,k,b,x,f)

global Fswitch;

t
x(1); % is the position
x(2); % is the velocity. 

% if(x(1)<0)
%     disp('x negative. Not allowed')
%     pause(5)
% %     break
% end
F_sponge=  - (k)*x(1);
% F_fric = -sign(x(2))*F_fric_mag;


tMat = (0:0.1:100)';
F_appliedMat=[ceil(100*tMat(1:50))/100 * F0 ; ...
    10*F0-F0*ceil(tMat(51:100)*100)/100; 0*tMat(101:end)];

F_applied = interp1(tMat,F_appliedMat,t);



F_friction = -sign(x(2))*min([abs(F_applied-k*x(1)) f]);


if (F_sponge+F_applied+F_friction<0 && t>5)
    Fswitch =1
    'switch ON'
end


if Fswitch==0

    ForceOut=F_sponge+F_applied+F_friction;

else
    F_friction = -sign(x(2))*min([abs(k*x(1)) f]);
    ForceOut=F_sponge+F_friction;

end




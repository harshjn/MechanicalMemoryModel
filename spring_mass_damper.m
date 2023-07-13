
function dy = spring_mass_damper(t, y, m, b, k, F0, f)
    dy = zeros(2, 1);
    dy(1) = y(2);
%     if t<5
%         k=20;
%     elseif y(1)>0.1 && t>5
%         k=20;
%     else
%         k=20;
%     end

    dy(2) = STEPfunc(F0,t,y,f)/m - (b/m)*y(2) - (k/m)*y(1);
end

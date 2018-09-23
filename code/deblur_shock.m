%% function definition of shock_filter function

function out = deblur_shock(U,c,iter)
out = U;
for i = 1 : iter
   out = deblur_shock_step(out,c); 
end
end



function out = deblur_shock_step(U,c)
dt = 0.1 * c;
lap_U = 4*del2(U);
[G_mag,~] = imgradient(U,'intermediate');
update = -1*sign(lap_U).*G_mag;
out = U + update*dt;
end
%% function definition of blur_step function

function out = blur_heat(U,c,iter)
out = U;
for i = 1 : iter
   out = blur_heat_step(out,c); 
end
end

function out = blur_heat_step(U,c)
dt = 0.1 * c;
update = 4*del2(U);
out = U + update*dt;

end
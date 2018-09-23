%% function definition of blur_step function

function out = blur_heat_space_vary(U,c,iter)
out = U;
for i = 1 : iter
   out = blur_heat_vary_step(out,c); 
end
end

function out = blur_heat_vary_step(U,c)
[m,n] = size(U);
C = repmat(linspace(c,2*c,n),m,1);
dt = 0.1;
update = 4*del2(U).*C;
out = U + update*dt;
end
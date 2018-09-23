%% function definition of deblur function

function out = deblur_heat(U,c,beta,iter)
out = U;
for i = 1 : iter
   out = deblur_heat_step(out,c,beta); 
     figure('Name',strcat('i=',int2str(i)));
     imshow(mat2gray(out));
end
end
%% Helper Function
function out = deblur_heat_step(U,c,beta)

dt = 0.1;
[Ux , Uy] = imgradientxy(U,'intermediate');
[Uxx , ~] = gradient(Ux);
[Uxy , Uyy] = gradient(Uy);

Ux_2 = Ux.*Ux;
Uy_2 = Uy.*Uy;

Unn = (Uxx.*Ux_2 + 2*Uxy.*Ux.*Uy + Uyy.*Uy_2)./(Ux_2 + Uy_2 + 1); %%Added 1 in the denominator


update = -c*4*del2(U) + beta*Unn;
out = U + update*dt;
end
%% function definition of deblur_mean_shift function

function out = deblur_mean_shift(U,hs,hr,iter)
out = U;
for i = 1 : iter
   out = deblur_mean_shift_step(out,hs,hr); 
end
end

function out = deblur_mean_shift_step(image,hs,hr)
    m = size(image,1);
    n = size(image,2);
    out = zeros(m,n);
    patch_size = hs;
    temp_I = (1:m)';
    I = repmat(temp_I,1,n);
    temp_J = (1:n);
    J = repmat(temp_J,m,1);
    for i = 1 : m
        for j = 1:n
            min_x = max(1,i-patch_size);
            max_x = min(m,i+patch_size);
            min_y = max(1,j-patch_size);
            max_y = min(n,j+patch_size);
            patch = image(min_x:max_x,min_y:max_y);
            p = image(i,j);
            temp_color_in = ((patch - p).^2)/(hr*hr);
            kern_color = epanechnikov(temp_color_in);
            kern = kern_color;
            den = sum(sum(kern));
            step = 0.1;
            out(i,j) = p - step * ((sum(sum(patch.*kern))/den) - p);
        end
    end
end
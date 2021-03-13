function [output] = random01(size)
r = rand(1,size);
for n = 1:size
    if (r(1,n) > 0.5)
        r(1,n) = 1;
    else
        r(1,n) = 0;
    end
output = r;
end
end


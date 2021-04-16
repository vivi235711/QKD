function output = random01(size, ratio)
output = rand(1,size);
for n = 1:size
    output(1,n) = output(1,n) < ratio;       
end
end
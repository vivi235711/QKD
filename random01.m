function output = random01(size, ratio)
output = rand(1,size);
for n = 1:size
    output(1,n) = output(1,n) < ratio;       
end
% 
% numberOfOnes = round(ratio*size);
% output = zeros(1, size);
% indexes = randperm(size, numberOfOnes);
% output(indexes) = 1;
end
function [outputArg1] = random01(inputArg1)

for n = 1:length(inputArg1)
    if (inputArg1(n) > 0.5)
        inputArg1(1,n) = 1;
    else
        inputArg1(1,n) = 0;
    end
    outputArg1 = inputArg1;
end
end


function [outputArg1] = send(inputArg1,inputArg2)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
outputArg1(1,length(inputArg1)) = qubit;
for n = 1:length(inputArg1)
    if (inputArg1(1,n) == 0)
    else
        outputArg1(1,n).state = [0 1;1 0]*outputArg1(1,n).state;
    end
for i = 1:length(inputArg1)
    if (inputArg2(1,i) == 0)
    else
        outputArg1(1,i).state = 1/sqrt(2)*[1 1;1 -1]*outputArg1(1,i).state;
    end
end

end


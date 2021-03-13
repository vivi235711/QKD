function [qubits] = send(Xa,Ha)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
qubits(1,length(Xa)) = qubit;
for n = 1:length(Xa)
    if (Xa(1,n) == 0)
    else
        qubits(1,n).state = [0 1;1 0]*qubits(1,n).state;
    end
end
for n = 1:length(Xa)
    if (Ha(1,n) == 0)
    else
        qubits(1,n).state = 1/sqrt(2)*[1 1;1 -1]*qubits(1,n).state;
    end
end

end


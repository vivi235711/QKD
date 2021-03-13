function [ bit, qubits ] = measure( qubits, Hb )
r = rand(1,length(Hb));
bit = zeros(1,length(Hb));
for n = 1:length(Hb)
    if (Hb(1,n)==0)
    else
        qubits(1,n).state = 1/sqrt(2)*[1 1;1 -1]*qubits(1,n).state;
    end
end

for n = 1:length(Hb)
    if (([1 0]*qubits(1,n).state)^2 > r(1,n))
        bit(1,n) = 0;
    else
        bit(1,n) = 1;
    end
end

end


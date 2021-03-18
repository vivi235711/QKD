function [Ha, Sa, Hb, Sb, Ce, He, Se, qubits] = BB84(size, Erate)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
Ha = random01(size, 0.5);
Sa = random01(size, 0.5);
Hb = random01(size, 0.5);
%send
qubits = send(Sa, Ha);
%eve
Ce = random01(size, Erate);
He = random01(size, 0.5);
[Se, qubits]  = Eve_measure( qubits, Ce ,He );
%receive
[Sb, qubits] = measure( qubits, Hb );

end

function output = random01(size, ratio)
output = rand(1,size);
for n = 1:size
    output(1,n) = output(1,n) < ratio;       
end
end

function qubits = send(Sa,Ha)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
qubits(1,length(Sa)) = qubit;
for n = 1:length(Sa)    
    qubits(1,n).state = (1/sqrt(2)*[1 1;1 -1])^Ha(1,n)*[0 1;1 0]^Sa(1,n)*[1;0];
end
end

function  [Sb, qubits]  = measure( qubits, Hb )
Sb = zeros(1,length(Hb));
for n = 1:length(Hb)
    Sb(1,n) = ([1 0]*(1/sqrt(2)*[1 1;1 -1])^Hb(1,n)*qubits(1,n).state)^2 < rand;
    qubits(1,n).state = (1/sqrt(2)*[1 1;1 -1])^Hb(1,n)*[0 1;1 0]^Sb(1,n)*[1;0]; 
end
end

function  [Se, qubits]  = Eve_measure( qubits, Ce ,He )
Se = zeros(1,length(Ce));
for n = 1:length(Ce)
    if(Ce(1,n)==1)
        Se(1,n) = ([1 0]*(1/sqrt(2)*[1 1;1 -1])^He(1,n)*qubits(1,n).state)^2 < rand;
        qubits(1,n).state = (1/sqrt(2)*[1 1;1 -1])^He(1,n)*[0 1;1 0]^Se(1,n)*[1;0]; 
    end
end
end
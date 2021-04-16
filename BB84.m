function [Ha, Sa, Hb, Sb, Ce, He, Se, qubits, rate] = BB84(size, Erate)
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
rate = correct_rate(Sa,Sb,Ha,Hb,size);
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

function [rate1] = correct_rate(Sa,Sb,Ha,Hb,size)
count1 = 0;
count2 = 0;
for n = 1:size
    if(Ha(1,n) == Hb(1,n))
        count1 = count1 + 1;
        if(Sa(1,n) == Sb(1,n))
            count2 = count2 + 1;
        end        
    end    
end
rate1 = count2/count1;
end
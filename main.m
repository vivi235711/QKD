size = 10000;

rate = zeros(1,100);
for n = 1:100
    [Ha, Sa, Hb, Sb, Ce, He, Se, qubits] = BB84(size, n/100);
    rate(1,n) = correctness(Sa,Sb,Ha,Hb,size);
end
plot(rate);
size = 100000;

rate = zeros(10,11);
x = 0:10;
for n = 1:11
    x(1,n) = x(1,n)/10;
end
for m = 1:10    
    for n = 1:11
        [Ha, Sa, Hb, Sb, Ce, He, Se, qubits, rate(m,n)] = BB84(size, (n-1)/10);
    end
end
p = plot(x,mean(rate));
xlabel('Eve attack rate');
ylabel('correct rate');
p.Marker = '*';
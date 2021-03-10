size = 5;
Ha = rand(1,size);
Ha = random01(Ha);
Xa = rand(1,size);
Xa = random01(Xa);
Hb = rand(1,size);
Hb = random01(Hb);
qubits = send(Xa,Ha);
disp(Ha);
disp(Xa);
for n = 1:length(qubits)
    disp(qubits(1,n).state);
end
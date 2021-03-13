size = 5;
Ha = random01(size);
Xa = random01(size);
Hb = random01(size);
qubits = send(Xa,Ha);
disp(Xa);
disp(Ha);
disp(Hb);
% for n = 1:length(qubits)
%     disp(qubits(1,n).state);
% end
% 
[result, qubits] = measure(qubits, Hb);
% 
% for n = 1:length(qubits)
%     disp(qubits(1,n).state);
% end
disp(result);
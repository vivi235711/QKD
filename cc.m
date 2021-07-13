size = 10000;
error_rate = 1:20;
for n = 1:20
    error_rate(1,n) = error_rate(1,n)/100;
end
repeat = 4;
time = 10;

rate1 = zeros(length(error_rate),repeat+1,time);
rate2 = zeros(length(error_rate),repeat+1,time);

lenth1 = zeros(length(error_rate),repeat+1,time);
keyl1 = zeros(length(error_rate),time);
keyl2 = zeros(length(error_rate),time);
x = 1:repeat+1;
for m = 1:length(error_rate)
    
    for n = 1:time   
        [rate1(m,1:repeat+1,n), keyl1(m,n)] = error_remove(size,error_rate(1,m), repeat);
        [rate2(m,1:repeat+1,n), keyl2(m,n)] = error_correct(size,error_rate(1,m), repeat);
    end
end

plot(error_rate,mean(keyl1,2),error_rate,mean(keyl2,2));

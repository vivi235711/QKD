size = 10000;
error_rate = 1:20;
for n = 1:20
    error_rate(1,n) = error_rate(1,n)/100;
end
repeat = 4;
time = 1000;

rate1 = zeros(length(error_rate),repeat+1,time);
rate2 = zeros(length(error_rate),repeat+1,time);

lenth1 = zeros(length(error_rate),repeat+1,time);
keyAl1 = zeros(length(error_rate),time);
keyBl1 = zeros(length(error_rate),time);
keyAl2 = zeros(length(error_rate),time);
keyBl2 = zeros(length(error_rate),time);
x = 1:repeat+1;
for m = 1:length(error_rate)
    
    for n = 1:time   
        [rate1(m,1:repeat+1,n), lenth1(m,1:repeat+1,n), keyAl1(m,n), keyBl1(m,n)] = error_remove(size,error_rate(1,m), repeat);
        [rate2(m,1:repeat+1,n), keyAl2(m,n), keyBl2(m,n)] = error_correct(size,error_rate(1,m), repeat);
    end
end

plot(error_rate,mean(keyAl1,2),error_rate,mean(keyAl2,2));

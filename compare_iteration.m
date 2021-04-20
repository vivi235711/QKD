size = 10000;
error_rate = 1:20;
for n = 1:20
    error_rate(1,n) = error_rate(1,n)/100;
end
repeat = 7;
time = 1000;

rate1 = zeros(length(error_rate),repeat+1,time);
rate2 = zeros(length(error_rate),repeat+1,time);

lenth1 = zeros(length(error_rate),repeat+1,time);
success = zeros(length(error_rate),2,time);
x = 1:repeat+1;
for m = 1:length(error_rate)
    
    for n = 1:time   
        [rate1(m,1:repeat+1,n), lenth1(m,1:repeat+1,n)] = error_remove(size,error_rate(1,m), repeat);
        [rate2(m,1:repeat+1,n)] = error_correct(size,error_rate(1,m), repeat);
         success(m,1,n) = find(rate1(m,:,n)==1,1)-1;
         success(m,2,n) = find(rate2(m,:,n)==1,1)-1;
    end
end

plot(mean(success,3));

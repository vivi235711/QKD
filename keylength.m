size = 10000;
%error_rate = 0.1;
repeat = 5;
time = 100;
error_rate = 1:20;
for n = 1:20
    error_rate(1,n) = error_rate(1,n)/100;
end
%rate1 = zeros(time,repeat+1);
%rate2 = zeros(time,repeat+1);
rate = zeros(length(error_rate),repeat+1,time);
keyl = zeros(length(error_rate),time);
%lenth1 = zeros(time,repeat+1);
x = 1:repeat+1;

for n = 1:time   
    %[rate1(n,1:repeat+1), lenth1(n,1:repeat+1)] = error_remove(size,error_rate, repeat);
    %[rate2(n,1:repeat+1)] = error_correct(size,error_rate, repeat);
    for m = 1:length(error_rate)
        [rate(m,1:repeat+1,n), keyl(m,n)] = error_correct(size,error_rate(1,m), repeat);
    end
    
end
%p = plot(x,mean(rate1),'*',x,mean(lenth1),x,mean(rate2));
f1 = figure;
p = plot(x,mean(rate,3));
f2 = figure;
p2 = plot(error_rate,mean(keyl,2));
% size = 10000;
% error_rate = 1:20;
% for n = 1:20
%     error_rate(1,n) = error_rate(1,n)/100;
% end
% repeat = 4;
% time = 10;
% 
% rate2 = zeros(length(error_rate),repeat+1,time);
% 
% lenth2 = zeros(length(error_rate),repeat+1,time);
% keyl2 = zeros(length(error_rate),time);
% x = 1:repeat+1;
% for m = 1:length(error_rate)
%     
%     for n = 1:time   
%         [rate2(m,1:repeat+1,n), lenth2(m,1:repeat+1,n), keyl2(m,n)] = error_remove(size,error_rate(1,m), repeat);
%         
%     end
% end

% x= error_rate;
% y1 = mean(keyl1,2);
% plot(x,y1)
% 
% hold on 
% y2 = mean(keyl2,2);
% plot(x,y2)
% 
% legend('error remove','error correct')
% hold off

% % figure
% % plot(error_rate,mean(success(:,1,:),3),error_rate,mean(success(:,2,:),3));
%p = plot(x,mean(rate1),'*',x,mean(lenth1),x,mean(rate2));
% error_rate = 1:20;
% for n = 1:20
%     error_rate(1,n) = error_rate(1,n)/100;
% end
% rate = zeros(20,6,10);
% keyl = zeros(20,10);
% for m = 1:length(error_rate)
%     
%     for n = 1:10   
%         [rate(m,:,n), keyl(m,n)] = error_correct(10000,error_rate(1,m),5);
%         
%     end
% end

for n = 1:10   
        [rate, keyl] = error_correct(10000,0.1,5);
        
end
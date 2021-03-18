function [rate1] = correctness(Sa,Sb,Ha,Hb,size)
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


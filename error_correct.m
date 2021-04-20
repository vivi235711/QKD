function [rate, keyl] = error_correct(size,error_rate,repeat)
Sa = random01(size, 0.5);
error_distribution = random01(size, error_rate);
Sb = Sa;
for n = 1:size
    Sb(1,n) = mod((Sb(1,n)+1*error_distribution(1,n)),2);
end
block_size = ceil(0.73/error_rate);
rate = zeros(1, repeat+1);
rate(1,1) = correct_rate(Sa, Sb, size);
global reveal
reveal = 0;
for n = 1:repeat    
    [Sa, Sb] = compare_and_correct(Sa, Sb, block_size, size);
    rate(1,n+1) = correct_rate(Sa, Sb, size);
    [Sa, Sb] = shuffle(Sa, Sb);
    block_size = block_size*2;
end
revea = reveal/2;

keyl = hash(Sa, Sb, revea, error_rate, 1);
%[keyA, keyB] = hash(Sa, Sb, revea, error_rate, 1);
%keyl = length(keyA);
end

function [Sa, Sb] = compare_and_correct(Sa, Sb, block_size, size)
parities_a = zeros(1,ceil(size/block_size));
parities_b = zeros(1,ceil(size/block_size));
for n = 1:length(parities_a)
    if(n ~= length(parities_b))
        parities_a(1,n) = parity(Sa((n-1)*block_size+1:n*block_size));
        parities_b(1,n) = parity(Sb((n-1)*block_size+1:n*block_size));
    else
        parities_a(1,n) = parity(Sa([(n-1)*block_size+1,size]));
        parities_b(1,n) = parity(Sb([(n-1)*block_size+1,size]));
    end
    
    if(parities_a(1,n) ~= parities_b(1,n))
        [Sa,Sb] = compare_block(Sa, Sb, n, block_size, size);        
    end
    
end

end

function [Sa,Sb] = compare_block(Sa, Sb, n, block_size, size)
if(n < ceil(size/block_size))
    blocka = Sa((n-1)*block_size+1:n*block_size);
    blockb = Sb((n-1)*block_size+1:n*block_size);
    [blocka,blockb] = split_half(blocka, blockb);
    Sa((n-1)*block_size+1:n*block_size) = blocka;
    Sb((n-1)*block_size+1:n*block_size) = blockb;
else
    blocka = Sa((n-1)*block_size+1:size);
    blockb = Sb((n-1)*block_size+1:size);
    [blocka,blockb] = split_half(blocka, blockb);
    Sa((n-1)*block_size+1:size) = blocka;
    Sb((n-1)*block_size+1:size) = blockb;

end
end

function [blocka,blockb] = split_half(blocka, blockb)
l = length(blocka);
if(l == 1)
    if(blocka ~= blockb)
        blockb = mod(blockb+1,2);
    end
    
else  
    
    if(parity(blocka(1:ceil(l/2))) ~= parity(blockb(1:ceil(l/2))))
        [blocka(1:ceil(l/2)), blockb(1:ceil(l/2))] = split_half(blocka(1:ceil(l/2)), blockb(1:ceil(l/2)));        
    else
        [blocka(ceil(l/2)+1:l), blockb(ceil(l/2)+1:l)] = split_half(blocka(ceil(l/2)+1:l), blockb(ceil(l/2)+1:l));        
    end
end
end

function [p] = parity(s)
c  = sum(s);
p = mod(c,2);   
global reveal
reveal = reveal+1;
end

function [rate] =  correct_rate(Sa, Sb,size)
count = 0;
for n = 1:size
	if(Sa(1,n) == Sb(1,n))
        count = count + 1;
	end   
end
rate = count/size;
end


function [Sa_new, Sb_new] = shuffle(Sa, Sb)
r = 1:length(Sa);
r = r(randperm(length(r)));
Sa_new = zeros(1,length(r));
Sb_new = zeros(1,length(r));
for n = 1:length(r)
    Sa_new(1,n) = Sa(1,r(1,n));
    Sb_new(1,n) = Sb(1,r(1,n));
end
end

function [r] =hash(Sa, Sb, reveal, error_rate, s)
    r = length(Sa) - ceil(length(Sa)*error_rate) - reveal - s;
    if r<1
        r = 0;
    end
%     if r < 1
%         keyA = [];
%         keyB = [];
%     else
%         H = zeros(r, length(Sa));
%         for n = 1:r        
%                 H(n,:) = random01(length(Sa), 0.5);
%         end
%         keyA = H * Sa';
%         keyB = H * Sb';
%         for n = 1:r        
%                 keyA(n,1) = mod(keyA(n,1),2);
%                 keyB(n,1) = mod(keyB(n,1),2);
%         end
%     end
end

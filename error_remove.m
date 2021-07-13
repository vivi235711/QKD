function [rate,  keyl] = error_remove(size,error_rate, repeat)
Sa = random01(size, 0.5);
error_distribution = random01(size, error_rate);
Sb = Sa;
for n = 1:size
    Sb(1,n) = mod((Sb(1,n)+1*error_distribution(1,n)),2);
end
block_size = ceil(0.73/error_rate);
rate = zeros(1, repeat+1);
lenth = zeros(1, repeat+1);
global reveal
reveal = 0;
rate(1,1) = correct_rate(Sa, Sb);
lenth(1,1) = (length(Sa)/size);

for n = 1:repeat    
    [Sa, Sb] = compare_and_remove(Sa, Sb, block_size);
    rate(1,n+1) = correct_rate(Sa, Sb);
    lenth(1,n+1) = (length(Sa)/size);
    [Sa, Sb] = shuffle(Sa, Sb);
    %block_size = block_size*2;
end
revea = reveal/2;
keyl = hash(Sa, Sb, revea, error_rate, 1);
%[keyA, keyB] = hash(Sa, Sb, revea, error_rate, 1);
%keyl = length(keyA);
end

function [Sa, Sb] = compare_and_remove(Sa, Sb, block_size)
size = length(Sa);
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
        global reveal 
        reveal = reveal-2;
        if(n ~= length(parities_b))
            Sa((n-1)*block_size+1:n*block_size) = 2;
            Sb((n-1)*block_size+1:n*block_size) = 2;
        else
            Sa([(n-1)*block_size+1,size]) = 2;
            Sb([(n-1)*block_size+1,size]) = 2;
        end
    end
end
Sa(Sa==2) = [];
Sb(Sb==2) = [];
end

function [p] = parity(s)
c  = sum(s);
p = mod(c,2);   
global reveal
reveal = reveal+1;
end

function [rate] =  correct_rate(Sa, Sb)
count = 0;
for n = 1:length(Sa)
	if(Sa(1,n) == Sb(1,n))
        count = count + 1;
	end   
end
rate = count/length(Sa);
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

% HW #7 
% 8.1 Convert the for loop to while loop in slide 2 

k = 0;

while k < 4

    k = k + 1;
    disp (k)

end 

% 8.2 Convert the while loop to for loop (with break) in slide 5. 

matnum = 7
guess = input( 'Your guess please (11 quit): ' );

%load splat 
while guess ~= matnum
    %sound(y, Fs)
    if guess == 11 
        break 
    end 

     if guess > matnum 
        disp( 'Too high' )
   
    else
     disp( 'Too low' )

end;
    guess = input( 'Your next guess please: ' );
 
end

disp( 'Correct' )

%load handel
%sound (y, Fs)

% 8.3 Convert the while loop to for loop (without break) in slide 12. 

matnum = 7
guess = 0;

%load splat 
while guess ~= matnum
    %sound(y, Fs)
    guess = input( 'Your guess please (11 quit): ' );
    if guess == 12 
        continue 
    end 

     if guess > matnum 
        disp( 'Too high' )
   
    else
     disp( 'Too low' )
end;
   
end

disp( 'Correct' )

%load handel
%sound (y, Fs)

% 8.8 Write a program to compute the sum of the series 1^2 + 2^2 + 3^2 ...
% such that the sum is as large as possible without exceeding 1000. The
% program should display how many terms are used in the sum. 

terms = 0;
sum = 0;
n=0;

while sum < 1000;

    if sum == 936;
    break 
end 

    if sum < 1000;
     terms = terms + 1;
     n = n + 1;

    end 

     for n = 1:terms;
     sum = (n*(2*n + n)*(n + 1)/6)

end 

    disp(sum)
    disp(terms)

end

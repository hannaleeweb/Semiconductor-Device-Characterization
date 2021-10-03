% HW 2-6 
%
% The following statements all assign logical expressions to the variable
% x. See if you can correctly determine the value of x in each case before
% checking your answer with MATLAB. 
% a) x = 3 > 2 (ans: x = logical 1)
% b) x = 2 > 3 (ans: x = logical 0)
% c) x = -4 <= -3 (ans: x = logical 1)
% d) x = 1 < 1 (ans: x = logical 0)
% e) x = 2~ = 2 (ans: x = logical 0)
% f) x = 3 == 3 (ans: x = logical 1)
% g) x = 0 < 0.5 < 1 (ans: x = logical 0)

% Work through the following script by hand. Draw up a table of the values
% of i, j, and m to show how they change while the script executes. Check
% your answers by running the script:

v = [3 1 5];
    i = 1;
        for j = v
            i = i + 1; 
            if i == 3
                i = i + 2;
                m = i + j;
            end
        end 
        
i = 1
j = 5
m = 6
v = 3

%2.25 A plumber opens a savings about with $100,000 at the beginning of
%January. He then makes a deposit of $1000 at the end of each month for the
%next 12 months (starting at the end of January). Interest is calculated
%and added to this account at the end of each month (before the $1000
%deposit is made). The monthly interest rate depends on the amount A in his
%account at the time interest is calculated, in the following way:

          A <= 110 000:   1%
110 000 < A <= 125 000: 1.5%
          A >  125 000:   2%
          
%Write a program that displays, under suitable headings, for each of the 12
%months, the situation at the end of the month as follows: the number of
%the month, the interest rate, the amount of interest, and the new balance.
%(Answer: values in the last row of output should be 12, 0.02, 2534.58,
%130263.78)

balance=input('enter the balance; ')
if A <= 110 000
    d=1
else if balance 110 000 < A <= 125 000
    d=1.5
else if balance A >  125 000
    d=2
    end
    
switch d
    case 1
        disp( 'enter the month; ')
        disp( 'enter the interest rate; ' )
        disp( 'enter the amount of interest: ')
        disp( 'enter the new balance; ')
        
    case 1.5
        disp( 'enter the month; ')
        disp( 'enter the interest rate; ' )
        disp( 'enter the amount of interest: ')
        disp( 'enter the new balance; ')
        
    case 2
        disp( 'enter the month; ')
        disp( 'enter the interest rate; ' )
        disp( 'enter the amount of interest: ')
        disp( 'enter the new balance; ')
        
    otherwise 
        disp ('Zero' );
end 
    end 
        
        
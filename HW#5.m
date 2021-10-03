%HW #5
(a) a ~= b (ans: 1 X 3 logical 배열 1 1 0)
(b) a < b (ans: 1 x 3 logical 배열 0 1 0)
(c) a < b < a (ans: 1 x 3 logical 배열 1 0 1)
(d) a < b < b (ans: 1 x 3 logical 배열 0 1 1)
(e) (a | ~a) (ans: 1 x 3 logical 배열 1 1 1)
(f) b & (~b) (ans: 1 x 3 logical 배열 0 0 0)
(g) a (~(~b)) (ans: 0 2)
(h) a = b == a (determine final value of a) (ans: 1 x 3 logical 배열 0 0 1)

%5.3 Write some MATLAB statements on the command line which use logical
%vectors to count how many elements of a vector x are negative, zero, or
%positive. Check that they work, e.g., with the vector: 
[-4 0 5 -3 0 3 7 -1 6]

a = 0:8; x = [-4 0 5 -3 0 3 7 -1 6]
x = x .* (x < 0) + x .* (x == 0) + x .*( x > 0)
plot (a,x)

%5.4 The Receive of Revenue (Internal Revenuw Service) decides to change
%the tax table used in Section 5.5 slightly by introducting an extra tax
%bracket and changing the tax-rate in the third bracket as follows: 

%income tax the logical way

inc = [5000 10000 15000 30000 50000]

tax = 0.1*inc .* (inc <= 10000);
tax = tax + (inc > inc / 10000 + inc <= 20000) 
   .* (0.2 * (inc - 10000 ) + 1000);
tax = tax + (inc > 20000) .* (0.3 * (inc - 20000) + 3000) ; 
tax = tax + (inc > 40000) .* (0.5 * (inc - 40000) + 9000) ; 

disp(inc' tax']

%5.6 Write some statements on the command line to remove the largest
%element(s) from a vector. Try it out on x = [1 2 5 0 5]. The idea is to
%end up with [1 2 0] in x. Use find and the empty vector [ ].

x = [1 2 5 0 5]
find (x >= max(x))
































% Homework #2-5 
tic
s = 0;
for n = 1:1000;
    s = s + n^2;
end
toc 


% 2.19) Work out by hand the out of the following script for n=4
n = input ('Number of terms? ');
 s =0;
 for k = 1:n
     s = s+1 / (k^2);
 end;
 disp(sqrt(6*s))
 
 % If you run this script for larger and larger values of n, you will find 
 % that the output approaches a well-known limit. Can you figure out what it
 % is? Now rewrite the script using vectors and array operations.
 
 disp(sqrt(6*s))
    2.4495    1.2247    0.8165    0.6124
    
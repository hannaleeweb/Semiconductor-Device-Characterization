% HW #8
% 10.3 Write and test a function double(x) which doubles its input
% argument, i.e., the statement x=double(x) should double the value in x. 

% function f(x) = double(x)

% f(x) = 2*x; 

f = inline ('2*x', 'x')

% 10.4 Write and test a function swop(x,y) which will exchange the values
% of its input arguments. 

% function f(X) = x^2 + y^2 ; 

% f(x,y) = x^2 + y^2;

% swop(x,y)

f = inline ('y.^2 + x.^2', 'y', 'x');


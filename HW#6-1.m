% HW6-1
%Set up any 3 x 3 matrix a. Write some command-line statements to perform
%the following operations on a: 

(a) interchange columns 2 and 3 

a = [1 2 3; 4 5 6; 7 8 9]
b = [1 2 3; 4 5 6; 7 8 9]
a(:,[2 3]) = b(:,[3 2])

a = [1 3 2; 4 6 5; 7 9 8]

% (b) add a fourth column ( of 0s);

a = (4, 4) = 0

a = [1 3 2 0; 4 6 5 0; 7 9 8 0; 0 0 0 0 ]

% (c) insert a row of 1st as the new second row of a (ie. move the current
% second and third rows down); 

a = [1 2 3];

repmat(a,[3 1])

% (d) remove the second column

a = [1 2 3; 4 5 6; 7 8 9];

a(:, 2) = []

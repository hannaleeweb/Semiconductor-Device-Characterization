% HW # 6-4

% Choose any photo you like and add color photo frame outside of the photo.
% You may choose the color of the photo frame as you like. 

M = imread('lovetriangle.jpg');

figure(1), imshow(M);

figure(2), imshow(M(5:88,215:335));

S = M; % Add Photo frame 

S (1:5, :) = 0; S(end-5: end, :) = 0;

S (:,1:5) =  0; S(:,end-5:end) = 0;

figure (3), imshow(S); 



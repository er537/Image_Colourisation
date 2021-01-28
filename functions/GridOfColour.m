% Load Image

% proportion of image to partially colour, between 0 and 1
proportion = 0.1;
% read in image
C = imread('peppa.png');
% make the image greyscale
G = greyscale(C);
% create the grid to recolour, 1s where you want colour, 0s where 
% you don't
D = uniform_grid(G,proportion);
% takes the greyscale image, the coloured image and the recolour 
% grid to produce the partially coloured image
P = partial_recolour(G,C,D);

imshow(P)


function D = random_grid(G,proportion)

    G_size = size(G);
    % take a logical array of whether a random number between 0 and 1 is 
    % less than proportion and reshape it to the size of the image
    D = reshape(rand(1,G_size(1)*G_size(2))<proportion,G_size(1),G_size(2));


end

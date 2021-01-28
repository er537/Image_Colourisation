function D = random_grid(G,proportion)

    G_size = size(G);
    height = round(rand(1,round(sqrt(proportion)*G_size(1)))*G_size(1));
    width = round(rand(1,round(sqrt(proportion)*G_size(2)))*G_size(2));
    H = full(sparse(1,height,1,1,G_size(1)));
    W = full(sparse(1,width,1,1,G_size(2)));
    D = H'*W;

end
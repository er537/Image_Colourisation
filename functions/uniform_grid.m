function D = uniform_grid(G,proportion)
    
    % Create a uniform grid of 1s where you want colour and 0s
    % where you don't
    G_size = size(G);
    height = round(linspace(1,G_size(1),round(sqrt(proportion)*G_size(1))));
    width = round(linspace(1,G_size(2),round(sqrt(proportion)*G_size(2))));
    H = full(sparse(1,height,1,1,G_size(1)));
    W = full(sparse(1,width,1,1,G_size(2)));
    D = H'*W;

end

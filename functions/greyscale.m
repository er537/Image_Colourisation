function G = greyscale(A)

    G = rgb2gray(A);
    G = repmat(G,1,1,3);
    
end


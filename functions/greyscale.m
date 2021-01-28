function G = greyscale(A)

    % Create a greyscale image with 3 colour values
    G = rgb2gray(A);
    G = repmat(G,1,1,3);
    
end


function P = partial_recolour(G,C,D)

    % Given a matrix of 1s where you want colour and 0s where
    % you don't produce a partially coloured image
    inv_D = uint8(ones(size(D))-D);
    D = uint8(D);
    P = inv_D.*G+D.*C;
    
end

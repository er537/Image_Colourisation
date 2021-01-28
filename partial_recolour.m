function P = partial_recolour(G,C,D)

    inv_D = uint8(ones(size(D))-D);
    D = uint8(D);
    P = inv_D.*G+D.*C;
    
end
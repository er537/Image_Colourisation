function D = customised_grid(G,coordinates)

    G_size = size(G);
    D = zeros(G_size(1),G_size(2));
    A = ones(1+min(G_size(1),coordinates(2)+5)-max(1,coordinates(2)-5),1+min(G_size(2),coordinates(1)+5)-max(1,coordinates(1)-5));
    D(max(1,coordinates(2)-5):min(G_size(1),coordinates(2)+5),max(1,coordinates(1)-5):min(G_size(2),coordinates(1)+5))=ones(size(A));

end


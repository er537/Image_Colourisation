function uniform=uniform(image)
    grey = 0.3 * image(:,:,1) + 0.59 * image(:,:,2) + 0.11 * image(:,:,3); %convert image to greyscale
    triple=cat(3,grey,grey,grey);
    uniform=triple; %initialize array for the random selection of coloured pixels
    
    %make every 5th element in the 'uniform' greyscale image coloured again
    for i=1:5:500
        for j=1:5:511
            uniform(i,j,:)=image(i,j,:);
        end
    end

end

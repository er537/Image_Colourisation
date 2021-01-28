function random=random(image)
    grey = 0.3 * image(:,:,1) + 0.59 * image(:,:,2) + 0.11 * image(:,:,3); %convert image to greyscale
    triple=cat(3,grey,grey,grey);
    random=triple; %initialize array for the random selection of coloured pixels
 
    I=randperm(500,100); %generates 100 random integers (without repetition) between 1 and 500

    %make random elements (determined by I and J) in 'random' greyscale image
    %coloured again. To check this this works change the 100 in I and J to 500
    %and 'random' is just the full colour image again
    for i=I
        J=randperm(511,100); %generates 100 random integers between 1 and 511. Note that this is inside the for loop so that a new random J is created for every I
        for j=J
            random(i,j,:)=image(i,j,:);
        end
    end
   
end

  
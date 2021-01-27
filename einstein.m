einstein=imread('einstein.jpg');

grey_einstein = 0.3 * einstein(:,:,1) + 0.59 * einstein(:,:,2) + 0.11 * einstein(:,:,3); %convert image to greyscale

triple=cat(3,grey_einstein,grey_einstein,grey_einstein);
uniform=triple; %initialize array for the uniform selection of coloured pixels
random=triple; %initialize array for the random selection of coloured pixels


%make every 5th element in the 'uniform' greyscale image coloured again
for i=1:5:607
    for j=1:5:700
        uniform(i,j,:)=einstein(i,j,:);
    end
end


I=randperm(607,100); %generates 100 random integers (without repetition) between 1 and 500

%make random elements (determined by I and J) in 'random' greyscale image
%coloured again. To check this this works change the 100 in I and J to 500
%and 'random' is just the full colour image again
for i=I
    J=randperm(700,100); %generates 100 random integers between 1 and 511. Note that this is inside the for loop so that a new random J is created for every I
    for j=J
        random(i,j,:)=einstein(i,j,:);
    end
end

imshow(random);
angelina=imread('angelina.jpg');
%imshow(angelina);

grey_ang = 0.3 * angelina(:,:,1) + 0.59 * angelina(:,:,2) + 0.11 * angelina(:,:,3); %convert image to greyscale
%imshow(grey_ang);

triple=cat(3,grey_ang,grey_ang,grey_ang); %still a greyscale image but now with dimension (3,:,:). Eg the greyscale 'triple'. The three 'layers' contain the same value 'gamma'
%imshow(triple);
uniform=triple; %initialize array for the uniform selection of coloured pixels
random=triple; %initialize array for the random selection of coloured pixels

%make every 5th element in the 'uniform' greyscale image coloured again
for i=1:5:500
    for j=1:5:511
        uniform(i,j,:)=angelina(i,j,:);
    end
end

%imshow(uniform); %uniform is now the greyscale image with every 5th element coloured

I=randperm(500,100); %generates 100 random integers (without repetition) between 1 and 500

%make random elements (determined by I and J) in 'random' greyscale image
%coloured again. To check this this works change the 100 in I and J to 500
%and 'random' is just the full colour image again
for i=I
    J=randperm(511,100); %generates 100 random integers between 1 and 511. Note that this is inside the for loop so that a new random J is created for every I
    for j=J
        random(i,j,:)=angelina(i,j,:);
    end
end

imshow(random);
        


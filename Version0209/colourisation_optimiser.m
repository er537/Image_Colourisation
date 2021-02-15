clear,clc,close all
%input colorinfoFig, greyscaleFig
C=imread('Picture/blurred1.jpg');

%%%%%%%%%%%%%%%%%%%%update on 15 Feb by Shenghao%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
C = imresize(C,0.5);% If you need to scale your image, use this line. 
%%%%%%%%%%%%%%%%%%%%update on 15 Feb by Shenghao%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
proportion=0.005;
delta=2e-5;
p=0.5;
greyscaleFig = greyscale(C);
G=greyscaleFig(:,:,1);
D=uniform_grid(G,proportion);
sigma1 = 100;
sigma2 = 100;

y0 = [delta;p;sigma1;sigma2];

options = optimset('PlotFcns',@optimplotfval);

%%%%%%%%%%%%%%%%%%%%update on 15 Feb by Shenghao%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global Iter; % calculate the number of iteration 
Iter = 0;
%%%%%%%%%%%%%%%%%%%%update on 15 Feb by Shenghao%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


y = fminsearch(@(y)error_func(C,G,D,y),y0,options);


function error_func = error_func(C,G,D,y)

    delta=y(1);
    p=y(2);
    sigma1 = y(3);
    sigma2 = y(4);

    g = [];
    type = 'Gaussian';

    n=0; %keeps track of the number of colour points
    m = 0; %keeps track of total number of points
    for i= 1:size(D,1)
        for j=1:size(D,2)
            m = m+1;
            if D(i,j)==1
                n=n+1;
                x(n,:)=[i j];
                f_R(n,:)=double(C(i,j,1));
                f_G(n,:)=double(C(i,j,2));
                f_B(n,:)=double(C(i,j,3));
                g(end+1) = G(i,j);
            end
        end
    end

    % calculate K_D
    Rx = pdist2(x,x);% distant matrix between colour points
    [gx1,gx2] = meshgrid(g,g);
    Gx = double(abs(gx1-gx2)); % greyscale gap matrix
    K_D = kernal(Rx,Gx,sigma1,sigma2,p,type);


    % coefficient
    a_R=(K_D+n*delta.*eye(n))\f_R;
    a_G=(K_D+n*delta.*eye(n))\f_G;
    a_B=(K_D+n*delta.*eye(n))\f_B;


    [k,l] = size(D);
    xx = 1:1:l;
    yy = 1:1:k;
    [Ay,Ax] = meshgrid(xx,yy); % position of z(all the points)
    F_R=zeros(size(D));
    F_G=zeros(size(D));        
    F_B=zeros(size(D));

    for j = 1:n
        R = ((Ay-x(j,2)).^2+(Ax-x(j,1)).^2).^0.5;
        Gz = double(abs(G - G(x(j,1),x(j,2))));
        KK = kernal(R,Gz,sigma1,sigma2,p,type);
        F_R = F_R + a_R(j).*KK;
        F_G = F_G + a_G(j).*KK;
        F_B = F_B + a_B(j).*KK;
    end
    
    
%%%%%%%%%%%%%%%%%%%%update on 15 Feb by Shenghao%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%put 3m inside the sqrt. Maybe unnecessary.
    error_func = sqrt(((norm(F_R-double(C(:,:,1)),'fro')^2+...
                norm(F_G-double(C(:,:,2)),'fro')^2+...
                    norm(F_B-double(C(:,:,3)),'fro')^2))/(3*m));
%%%%%%%%%%%%%%%%%%%%update on 15 Feb by Shenghao%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %%%%%%%%%%%%%%%%%%%%update on 15 Feb by Shenghao%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                
    global Iter;
    % show the result of the iteration every 10 times.
    if(mod(Iter,10)==0)  
        figure
        C2 = cat(3,F_R,F_G,F_B);
        C2 = uint8(C2);
        imshow(C2);
    end
    Iter = Iter+1; % update the number of the iteration.
    %%%%%%%%%%%%%%%%%%%%update on 15 Feb by Shenghao%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                
end
 





function [r, c] = harris(im, sigma, thresh, radius, display_corners)
    
    dx = [-1 0 1; -1 0 1; -1 0 1];
    dy = dx';
    
    Ix = conv2(im, dx, 'same');   
    Iy = conv2(im, dy, 'same');    

    g = fspecial('gaussian',max(1,fix(6*sigma)), sigma);
    
    Ix2 = conv2(Ix.^2, g, 'same'); 
    Iy2 = conv2(Iy.^2, g, 'same');
    Ixy = conv2(Ix.*Iy, g, 'same');
    
    cim = (Ix2.*Iy2 - Ixy.^2)./(Ix2 + Iy2 + eps); % Harris corner measure

    if nargin > 2   
	
	
	sze = 2*radius+1;                   
	mx = ordfilt2(cim,sze^2,ones(sze)); 
	cim = (cim==mx)&(cim>thresh);       
	
	[r,c] = find(cim);                  % Find row,col coords.
	
	if nargin==5 & display_corners      % overlay corners on original image
	    figure, imagesc(im), axis image, colormap(gray), hold on
	    plot(c,r,'ys'), title('corners detected');
	end
    
    else  % leave cim as a corner strength image and make r and c empty.
	r = []; c = [];
    end
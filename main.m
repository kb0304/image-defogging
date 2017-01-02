pkg load image

#Path to image to be defogged
path_to_file = 'media/hazed2.jpg';

#Coefficient of defogging
W = .9  ;

#Size of window
ws = 3;

I = imread(path_to_file);

#Calculation of Coarse map
Mcorse = double(min(min(ordfilt2(I(:,:,1),1,ones(ws,ws),'symmetric'),ordfilt2(I(:,:,2),1,ones(ws,ws),'symmetric')),ordfilt2(I(:,:,3),1,ones(ws,ws),'symmetric')));

#Calculation of atmospheric intensity
A = max(max(Mcorse));

#Calculation of fine map
Mfine = double(min(min(I(:,:,1),I(:,:,2)),I(:,:,3)));

#Calculation of transmission map
Mt = double(ordfilt2(Mcorse, ws*ws, ones(ws,ws), 'symmetric'));
Mt = min(Mt, Mfine);

#Getting defogged image
t = 1 - (W/A)*Mt;
J = A - (A-I)./(max(t,0.01));

subplot(1,2,1), imshow(uint8(I));
subplot(1,2,2), imshow(uint8(J));
% ---------------------------- NDVI ---------------------------------------
% Compute the Normalized Difference Vegetation Index (NDVI) using the following
% formula: [(Band_3 - Band_2)./(Band_3 + Band_2)]. The NDVI shows the relative
% abundance of actively photosynthesizing vegetation. In other words, it
% assesses how healthy the vegetation is!

% Pull the bands.
Band_3 = hdfread('SPCraterASTERData.hdf','VNIR_Swath','Fields','ImageData3N');
Band_2 = hdfread('SPCraterASTERData.hdf','VNIR_Swath','Fields','ImageData2');
Band_1 = hdfread('SPCraterASTERData.hdf','VNIR_Swath','Fields','ImageData1');

% Calculate NDVI.
% Before we can calculate this, let's look at the format (aka "class" of
% Bands 1, 2, and 3 in the MATLAB Workspace. You will notice that they are
% "uint8", which means they are 8-bit integers! This isn't useful to us,
% especially if we want to do division because division of integers can
% only result in whole numbers. So, we first need to convert these bands to
% a class known as "single" so that we can do some band ratioing!
Band_2 = im2single(Band_2);
Band_3 = im2single(Band_3);
SPCrater_NDVI = (Band_3 - Band_2) ./ (Band_3 + Band_2);

% Display the image.
figure(5)
% Note that because the range of numbers in our NDVI ratio is between
% 0 and 1, we need to display the image's colors using an appropriate scale
% [0 1]
imshow(SPCrater_NDVI,'DisplayRange',[0 1])
xlabel('Longitude (pixels)')
ylabel('Latitude (pixels)')
title('NDVI computed from ASTER Image')
% ---------------------------- VNIR or CIR --------------------------------
% Pull bands 3N, 2, and 1 from the HDF file into their own matrices. These
% bands are in the VNIR (aka CIR) range and will highlight actively
% photosynthesizing vegetation (showns as red), undisturbed bedrock and
% soils (browns, greens, and greys), and the built environment (blues,
% greens, reddish-purples, and whites)
Band_3 = hdfread('SPCraterASTERData.hdf','VNIR_Swath','Fields','ImageData3N');
Band_2 = hdfread('SPCraterASTERData.hdf','VNIR_Swath','Fields','ImageData2');
Band_1 = hdfread('SPCraterASTERData.hdf','VNIR_Swath','Fields','ImageData1');

% Construct an RGB matrix from the three bands into one 3D matrix.
SPCrater_321 = cat(3,Band_3,Band_2,Band_1);

% Display the image
figure(1)
imshow(SPCrater_321)
xlabel('Longitude (pixels)')
ylabel('Latitude (pixels)')
title('ASTER Bands 3, 2, 1')

% Perform histogram equalization stretch on the image
for i=1:3
    SPCrater_321_stretch(:,:,i)=histeq(SPCrater_321(:,:,i));
end

% Display the image
figure(2)
imshow(SPCrater_321_stretch)
xlabel('Longitude (pixels)')
ylabel('Latitude (pixels)')
title('ASTER Bands 3, 2, 1 (stretched)')
% ---------------------------- SWIR ---------------------------------------
% Pull bands 8, 6, and 4 from the HDF file into their own matrices. These
% bands are in the SWIR range and will highlight spectral features
% diagnostic for iron oxides, illite, kaolinite, and carbonates.
Band_8 = hdfread('SPCraterASTERData.hdf','SWIR_Swath','Fields','ImageData8');
Band_6 = hdfread('SPCraterASTERData.hdf','SWIR_Swath','Fields','ImageData6');
Band_4 = hdfread('SPCraterASTERData.hdf','SWIR_Swath','Fields','ImageData4');

% Construct an RGB matrix from the three bands into one 3D matrix.
SPCrater_864 = cat(3 , Band_8 , Band_6 , Band_4);

% Perform histogram equalization stretch on the image
for i=1:3
    SPCrater_864_stretch(:,:,i)=histeq(SPCrater_864(:,:,i));
end
% Display the image
figure(3)
imshow(SPCrater_864_stretch)
xlabel('Longitude (pixels)')
ylabel('Latitude (pixels)')
title('ASTER Bands 8, 6, 4')
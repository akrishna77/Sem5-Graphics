% -------------------------- TIR ------------------------------------------
% Pull bands 13, 12, and 10 from the HDF file into their own matrices.
% These bands are in the TIR range and will highlight spectral features
% diagnostic for silicates, iron- and magnesium-bearing minerals and rocks,
% and carbonates. Quartzites are bright red, basaltic rocks are blue,
% granitoids are purple-violet, and carbonates are greenish yellow.
Band_13 = hdfread('SPCraterASTERData.hdf','TIR_Swath','Fields','ImageData13');
Band_12 = hdfread('SPCraterASTERData.hdf','TIR_Swath','Fields','ImageData12');
Band_10 = hdfread('SPCraterASTERData.hdf','TIR_Swath','Fields','ImageData10');

% Construct an RGB matrix from the three bands into one 3D matrix.
SPCrater_131210 = cat(3 , Band_13 , Band_12 , Band_10);

% Do a decorrelation stretch to enhance differences in colors.
SPCrater_131210_decorr = decorrstretch(SPCrater_131210,'Tol',0.01);

% Display the image
figure(4)
imshow(SPCrater_131210_decorr)
xlabel('Longitude (pixels)')
ylabel('Latitude (pixels)')
title('ASTER Bands 13, 12, 10')
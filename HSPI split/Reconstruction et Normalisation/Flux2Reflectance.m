%% INPUTS
% reconstructed_image: Measured hypercube
% Wavelengths: Wavelengths sampled by the spectrometer
% Lref: Reflectance standard data
function normalised_image=Flux2Reflectance(reconstructed_image,Wavelengths,Lref)

figure
imagesc(mean(reconstructed_image,3))
[x,y]=ginput(2); % Select two pixels inside the reflectance standard zone 
close
x=round(x);
y=round(y);


%% Normalisation coefficient
ref=interp1(Lref(:,1),Lref(:,2),Wavelengths); % Data interpolation of reflectance standard 
Ref_pixels=squeeze(mean(mean(reconstructed_image(y(1):y(2),x(1):x(2),:))));% Pixel intensities of the standard 

normalisation_coeff=(ref./Ref_pixels);

%% Hypercube normalisation

normalised_image=zeros(size(reconstructed_image)); % Reflectance normalised hypercube initialisation
for i=1:size(reconstructed_image,3)
    normalised_image(:,:,i)=reconstructed_image(:,:,i).*normalisation_coeff(i);
end

end
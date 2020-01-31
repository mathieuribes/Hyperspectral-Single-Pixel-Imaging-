function [Wavelengths_cropped,image_cropped]=Wavelengths_cropping(reconstructed_image,Wavelengths,lambda_min,lambda_max)

raws=logical((Wavelengths>=lambda_min).*(Wavelengths<=lambda_max));
Wavelengths_cropped=Wavelengths(raws);
image_cropped=reconstructed_image(:,:,raws);
end


%% INPUTS: 
% Preal: Real spectral Fourier coefficients
% Pim: Imaginary spectral Fourier coefficients

% OUTPUTS:
% reconstructed_image: Images hypercube
% reconstructed_spectra: Fourier spectra hypercube
function [reconstructed_image,reconstructed_spectra]=ReconstructionHypercubes_split(Preal,Pim)

%% Spectrum and image reconstruction
half_dimension=((-3+sqrt(9-8*(1-size(Preal,2))))/4);  % Half dimension of the images to reconstruct
Width=half_dimension+1;   % Width of half spectra
Height=2*half_dimension+1; % Height of half spectra


% data formatting
 Preal_form=reshape(Preal',Height,Width,size(Preal,1));      % real coefficients formatting
 Pim_form=reshape(Pim',Height,Width,size(Pim,1));            % imaginary coefficients formatting
 
Right_spectrum=(Preal_form-1i.*Pim_form);                    % calculation and shaping of the complex coefficients of the right part of the spectrum
Left_spectrum=rot90(conj(Right_spectrum(:,2:end,:)),2);      % calculation of the left part of the spectrum by conjugate symmetry

reconstructed_spectra=cat(2,Left_spectrum,Right_spectrum);  % concatenation of the left and right parts of the spectrum 
reconstructed_image=abs(ifft2(reconstructed_spectra));      % Images hypercube reconstruction

end
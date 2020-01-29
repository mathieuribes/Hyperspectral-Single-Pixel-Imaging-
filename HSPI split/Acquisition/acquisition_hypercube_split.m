%% acquisition_hypercube allows to display patterns and reconstruct a Fourier spectrum depending on desired spatial dimensions and pattern display rate
% INPUTS:
% half_dimension: Half dimension of the Fourier spectrum to be reconstructed
% wrapper: wrapper
% display_rate: display rate in seconds

% OUTPUTS:
% Preal : Real Fourier coefficients spectrally sampled
% Pim: Imaginary Fourier coefficients spectrally sampled

function [Preal,Pim,Wavelengths] = acquisition_hypercube_split(half_dimension,wrapper,display_rate,path)

% Full screen display
fig=figure(1);
set(fig,'DefaultFigureColor',[1 1 1]); % White background
set(fig,'Units', 'Normalized');
set(fig,'MenuBar','none') % enlève la barre d'outil
set(gca,'Visible','off') % enlève les axes
set(gca,'Position',[0 0 1 1]) % image en plein écran
colormap(gray)
pause(5)

% Initialisations
Preal=zeros(2048,(2*half_dimension+1)*(half_dimension+1)); % Real Fourier coefficients 
Pim=zeros(2048,(2*half_dimension+1)*(half_dimension+1));   % Imaginary Fourier coefficients

% Patterns dimensions depending on video projector resolution 
Width=800;
Height=600;

% Patterns dimensions 
x=1:Width;
y=1:Height;
[Y,X]=meshgrid(x,y);


barre_progression=waitbar(0,'1','Name','Patterns displaying ...');
steps=(2*half_dimension+1)*(half_dimension+1);
step=1;

pause(1)
init=wrapper.getSpectrum(0);% Spectrometer initialisation 

% Patterns displaying and acquisition of the Fourier spectrum using split
% patterns method to correct numerical level of cosine functions
for j=0:half_dimension % column scanning
    for k=-half_dimension:half_dimension   % line scanning
        
        waitbar(step/steps,barre_progression,strcat(sprintf('%12.1f',100*(step/steps)),' %')) % progress bar evolution
        [pos_r,neg_r,pos_im,neg_im]=CreationPatternsSplit(X,Y,j,k);
        
        %% Real patterns acquisition
        imagesc(pos_r)% display of the real positive pattern
        colormap(gray)
        caxis([0,1])
        pause(display_rate); % pause setting the rate at which patterns are displayed 
        Preal(:,step)=wrapper.getSpectrum(0);
        
        imagesc(neg_r)% display of the real negative pattern
        colormap(gray)
        caxis([0,1])
        pause(display_rate);% pause setting the rate at which patterns are displayed
        Preal(:,step)=Preal(:,step)-wrapper.getSpectrum(0);% real pattern projection acquisition
        
        
        %% Imaginary patterns acquisition
        imagesc(pos_im)% display of the imaginary positive pattern
        colormap(gray)
        caxis([0,1])
        pause(display_rate); % pause setting the rate at which patterns are displayed
        
        Pim(:,step)=wrapper.getSpectrum(0);
        
        imagesc(neg_im)% display of the imaginary negative pattern
        colormap(gray)
        caxis([0,1])
        pause(display_rate);% pause setting the rate at which patterns are displayed
        Pim(:,step)=Pim(:,step)-wrapper.getSpectrum(0);% Imaginary pattern acquisition 
        
        step=step+1;
    end
end
close(barre_progression);
pause(5)

Wavelengths=wrapper.getWavelengths(0);          % Get the spectrometer's sampled wavelengths vector

cd(path)
save('mesure_real.txt','Preal','-ascii')        % saving the hypercube of real coefficients
save('mesure_im.txt','Pim','-ascii')            % saving the hypercube of imaginary coefficients
save('wavelengths.txt','Wavelengths','-ascii')  % wavelengths vector saving

end


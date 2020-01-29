%% Script for the acquisition of a hypercube with the Flame spectrometer

close all
clc

%% Input parameters

Tint=3000000;   % Integration time
Nscan=5;        % Scans to average
display_rate=190e-3; % display rate in seconds
resolution=81;  % WARNING : here spatial resolution must be odd number (Fourier spectrum considerations)
half_dimension=(resolution-1)/2; % Half dimension of the Fourier spectrum to be reconstructed

%% Wrapper

disp('---------------------------------------')
disp('Wrapper''s creation ')
disp('---------------------------------------')

wrapper=creation_wrapper();
spectro_parameters(wrapper,Tint,Nscan)

disp('Wrapper enabled')
disp('---------------------------------------')

%% Hypercube acquisition

path= uigetdir('Select save folder'); % Select folder a folder where to save acquisition data

disp('Projection of Fourier patterns onto the scene') 
disp('---------------------------------------')

DialogBox % Dialog box to start acquisitions after positioning the figure that will display the patterns

% Acquisition 
[Preal,Pim,Wavelengths] = acquisition_hypercube_splitv2(half_dimension,wrapper,display_rate,path);

disp('Hypercube acquired')
disp('---------------------------------------')
disp(' End of the acquisition')



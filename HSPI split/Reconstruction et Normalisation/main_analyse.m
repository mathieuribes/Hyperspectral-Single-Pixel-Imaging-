%% Hypercube reconstruction and reflectance normalisation

clear all 
close all
clc

%% Load data

path=uigetdir;                                        % data path
cd(path)
Pim=load('mesure_im.txt');                            % Imaginary coefficients
Preal=load('mesure_real.txt');                        % Real coefficients
Wavelengths=load('wavelengths.txt');
half_dimension=((-3+sqrt(9-8*(1-size(Preal,2))))/4);  % Half dimension of the images to reconstruct

%% Hypercube reconstruction
[reconstructed_image,reconstructed_spectrum] = ReconstructionHypercubes_split(Preal,Pim);
% Wavelengths cropping
lambda_min=450; % nm
lambda_max=750; % nm
[Wavelengths_cropped,image_cropped]=Wavelengths_cropping(reconstructed_image,Wavelengths,lambda_min,lambda_max);

%% Reflectance normalisation
% Load reflectance standard data 
load('RefBlanc');
Lref=RefBlanc;   % Reflectance standard data
Lref(:,2)=Lref(:,2)*100; % Reflectance in percentage
% Select two pixels inside the reflectance standard zone to normalise
% hypercubes
normalised_image=Flux2Reflectance(image_cropped,Wavelengths_cropped,Lref);


%% Gerbil export
path = uigetdir('*.txt', 'Saving folder for Gerbil Hypercube'); % Saving folder
cd(path)
mat2ms(normalised_image,Wavelengths,path,'Hypercube',1)

%% Python export
info=enviinfo(normalised_image);
enviwrite(normalised_image,info,'Hypercube.dat');


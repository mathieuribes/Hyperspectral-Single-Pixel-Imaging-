Date: 31/01/2020
Authors: Mathieu Ribes, Gaspard Russias, Antoine Fournier
This is a suite of Matlab scripts that allows to create Fourier patterns, acquire and reconstruct hyperspectral single pixel hypercubes.
This supplementary materials was made available with the article "Towards low-cost hyperspectral single-pixel imaging for plant phenotyping" submitted on 17/01/2020.

Installations instructions :
-----------------------------------
Install Ocean Optics wrapper at https://www.oceaninsight.com/support/software-downloads/ (accessed on 31/01/2020)


Operating instructions HSPI Split
-----------------------------------

To initiate an acquisition:
- Open the "main_Acquisition.m" file.
- Fill in the integration times, the number of scans to average, the patterns display rate and the image resolution (which must be an odd number)
 such as :
  resolution=(2*half_dimension+1)*(2*half_dimension+1) pixels.
  In this program, split patterns are created automatically according to the size parameter during acquisition.
Split patterns are used in order to remove artefacts from numerical levels to describe sine functions.

The program allows to acquire and save in a desired directory 3 vectors 
[Preal,Pim,Wavelengths]

------------------------------------

To reconstruct an acquisition:

- Open the file "main_analyse.m".
- load (if necessary) the vectors [Preal,Pim,Wavelengths].
- Rebuilding the hypercube
- Normalization is done by selecting the reference field 
  Be careful that it is not in a shaded area.

- It is possible to export hypercubes on Gerbil and Python 

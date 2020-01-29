function mat2ms(A, wl, path, name, normalize)
% MAT2MS  Write out multispectral/hyperspectral image in Gerbil format
%   C = MAT2MS(A, wl, path, name, normalize) writes out a multispectral image from matrix A
%   A is a 3d matrix in the order row, column, wavelength
%   wl is a vector that holds the center wavelength for each band
%   path specifies the destination folder
%   name specifies the image file name (without extension .txt)
%   (note that the image consists of one .txt file and several .png files in a subfolder)
%   when normalize is set to 1, the image range will be normalized based on the data;
%   otherwise, we expect the data to be in range [0,255]

if (normalize == 1)
    maxval = max(A(:));
    minval = min(A(:));
    range = maxval - minval;
    A = (A + minval) * (255./range);
end

fid = fopen([path '/' name '.txt'], 'w');
mkdir(path, name);

nz = size(A, 3);

fprintf(fid, '%d %s\n', nz, [name '/']);
for i = 1:nz
    filename = sprintf('%s_%02d.png', name, i);
    imwrite(A(:,:,i)/255., [path '/' name '/' filename], 'BitDepth', 16);
    fprintf(fid, '%s %d\n', filename, wl(i));
end

fclose(fid);
end

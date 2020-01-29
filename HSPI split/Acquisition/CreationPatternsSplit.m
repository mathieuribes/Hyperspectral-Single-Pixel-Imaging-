%% Function to create the 4 split patterns  for a pair of spatial frequencies(j,k)
% INPUTS:
% X,Y 
% j,k: spatial frequencies sampling

% OUTPUTS:
% pos_r: Real positive pattern
% pos_im: Imaginary positive pattern
% neg_r: Real negative pattern 
% neg_im: Imaginary negative pattern

function [pos_r,neg_r,pos_im,neg_im]=CreationPatternsSplit(X,Y,j,k)

hauteur=size(X,1);
largeur=size(X,2);

% fréquences spatiales
u=k/hauteur;
v=j/largeur;

A=2*pi*X*u;
B=2*pi*Y*v;

Pr=cos(A+B);
Pi=sin(A+B);

pos_r=Pr.*(Pr>=0);
neg_r=abs(Pr.*(Pr<0));

pos_im=Pi.*(Pi>=0);
neg_im=abs(Pi.*(Pi<0));
end

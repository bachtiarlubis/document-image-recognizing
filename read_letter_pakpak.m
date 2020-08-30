function [letter,vd]=read_letter_pakpak(imagn,num_letters)
%%
% Some modification :
%   1. add more output variable
%
%%
% Computes the correlation between template and input image
% and its output is a string containing the letter.
% Size of 'imagn' must be 42 x 24 pixels
% Example:
% imagn=imread('D.bmp');
% letter=read_letter(imagn)
load templates_pakpak.mat
templatesPakpak = templates_pakpak;
comp=[ ];
for n=1:num_letters %num_letter
    sem=corr2(templatesPakpak{1,n},imagn);
    comp=[comp sem];
end
vd=find(comp==max(comp)); % value is vector so "if vd(1,1)==" not just "if vd =="
%*-*-*-*-*-*-*-*-*-*-*-*-*-

if vd(1,1)==1
    letter='<';
elseif vd(1,1)==2
    letter='a';
elseif vd(1,1)==3
    letter='b';
elseif vd(1,1)==4 % vd == 4 has been changed
    letter='c';
elseif vd(1,1)==5
    letter='d';
elseif vd(1,1)==6
    letter='e';
elseif vd(1,1)==7
    letter='g';
elseif vd(1,1)==8
    letter='h';
elseif vd(1,1)==9
    letter='i';
elseif vd(1,1)==10
    letter='I';
elseif vd(1,1)==11
    letter='j';
elseif vd(1,1)==12
    letter='k';
elseif vd(1,1)==13
    letter='l';
elseif vd(1,1)==14
    letter='m';
elseif vd(1,1)==15
    letter='n';
elseif vd(1,1)==16
    letter='o';
elseif vd(1,1)==17
    letter='p';
elseif vd(1,1)==18
    letter='r';
elseif vd(1,1)==19 % vd == 19 has been changed
    letter='s';
elseif vd(1,1)==20
    letter='t';
elseif vd(1,1)==21
    letter='U';
elseif vd(1,1)==22
    letter='w';
elseif vd(1,1)==23
    letter='y';
else
    letter='*';
end
function letter=read_letter_mandailing(imagn,num_letters)
% Computes the correlation between template and input image
% and its output is a string containing the letter.
% Size of 'imagn' must be 42 x 24 pixels
% Example:
% imagn=imread('D.bmp');
% letter=read_letter(imagn)
load templates_mandailing.mat;
templatesMandailing = templates_mandailing;
comp=[ ];
for n=1:num_letters %num_letter
    sem=corr2(templatesMandailing{1,n},imagn);
    comp=[comp sem];
end
vd=find(comp==max(comp));
% vdIdx = vd;
%*-*-*-*-*-*-*-*-*-*-*-*-*-

if vd==1
    letter='\';
elseif vd==2
    letter=']';
elseif vd==3
    letter='a';
elseif vd==4
    letter='b';
elseif vd==5
    letter='c';
elseif vd==6
    letter='d';
elseif vd==7
    letter='e';
elseif vd==8
    letter='f';
elseif vd==9
    letter='g';
elseif vd==10
    letter='h';
elseif vd==11
    letter='i';
elseif vd==12
    letter='I';
elseif vd==13
    letter='j';
elseif vd==14
    letter='k';
elseif vd==15
    letter='l';
elseif vd==16
    letter='L';
elseif vd==17
    letter='m';
elseif vd==18
    letter='n';
elseif vd==19
    letter='o';
elseif vd==20
    letter='p';
elseif vd==21
    letter='q';
elseif vd==22
    letter='r';
elseif vd==23
    letter='s';
elseif vd==24
    letter='t';
elseif vd==25
    letter='U';
elseif vd == 26
    letter ='v';
elseif vd == 27
    letter ='w';
elseif vd==28
    letter='x';
elseif vd==29
    letter='y';
elseif vd==30
    letter='z';
else
    letter='*';
end
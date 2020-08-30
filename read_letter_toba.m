function letter=read_letter_toba(imagn,num_letters)
% Computes the correlation between template and input image
% and its output is a string containing the letter.
% Size of 'imagn' must be 42 x 24 pixels
% Example:
% imagn=imread('D.bmp');
% letter=read_letter(imagn)
load templates_toba.mat
templatesToba = templates_toba;
comp=[ ];
for n=1:num_letters %num_letter
    sem=corr2(templatesToba{1,n},imagn);
    comp=[comp sem];
end
vd=find(comp==max(comp));
%*-*-*-*-*-*-*-*-*-*-*-*-*-

if vd(1,1)==1||vd(1,1)==2
    letter='a';
elseif vd(1,1)==3||vd(1,1) == 4
    letter='b';
elseif vd(1,1)==5
    letter='c';
elseif vd(1,1)==6 || vd(1,1)==7
    letter='d';
elseif vd(1,1)==8||vd(1,1)==9
    letter='e';
elseif vd(1,1)==10
    letter='f';
elseif vd(1,1)==11 ||vd(1,1)==12
    letter='g';
elseif vd(1,1)==13
    letter='h';
elseif vd(1,1)==14 
    letter='i';
elseif vd(1,1)==15
    letter='I';
elseif vd(1,1)==16||vd(1,1)==17
    letter='j';
elseif vd(1,1)==18
    letter='k';
elseif vd(1,1)==19 || vd(1,1)== 20
    letter='l';
elseif vd(1,1)==21
    letter='m';
elseif vd(1,1)==22 || vd(1,1)==23
    letter='n';
elseif vd(1,1)==24 || vd(1,1)==25
    letter='o';
elseif vd(1,1)==26
    letter='p';
elseif vd(1,1)==27
    letter='q';
elseif vd(1,1)==28||vd(1,1)==29
    letter='r';
elseif vd(1,1)==30
    letter='s';
elseif vd(1,1)==31||vd(1,1)==32
    letter='t';
elseif vd(1,1)==33 || vd(1,1)== 34
    letter='T';
elseif vd(1,1)==35
    letter='U';
elseif vd(1,1)==36
    letter='v';
elseif vd(1,1)==37
    letter='w';
elseif vd(1,1)== 38
    letter ='x';
elseif vd(1,1)==39 ||vd(1,1)==40
    letter = 'y';
% Toba Handwritten
elseif vd(1,1)==41 || vd(1,1)==42 || vd(1,1)==43 
    letter ='a';
elseif vd(1,1)==44 || vd(1,1)==45 || vd(1,1)==46 || vd(1,1)==47 || vd(1,1)==48 || vd(1,1)==49 || vd(1,1)==50 ||...
        vd(1,1)==51 || vd(1,1)==52 || vd(1,1)==53 || vd(1,1)==54 || vd(1,1)==55 || vd(1,1)==56
    letter ='d';
elseif vd(1,1)==57 || vd(1,1)==58 || vd(1,1)==59 || vd(1,1)==60 || vd(1,1)==61 || vd(1,1)==62 || vd(1,1)==63 ||...
        vd(1,1)==64 || vd(1,1)==65 || vd(1,1)==66 || vd(1,1)==67 || vd(1,1)==68
    letter ='f';
elseif vd(1,1)==69 || vd(1,1)==70 || vd(1,1)==71
    letter ='g';
elseif vd(1,1)==72
    letter ='I';
elseif vd(1,1)==73
    letter ='k';
elseif vd(1,1)==74 || vd(1,1)==75 || vd(1,1)==76 || vd(1,1)==77 || vd(1,1)==78
    letter ='l';
elseif vd(1,1)==79 || vd(1,1)==80
    letter ='m';
elseif vd(1,1)==81 || vd(1,1)==82
    letter ='n';
elseif vd(1,1)==83 ||vd(1,1)==84 ||vd(1,1)==85 ||vd(1,1)==86 ||vd(1,1)==87 ||vd(1,1)==88 ||vd(1,1)==89 ||...
        vd(1,1)==90 ||vd(1,1)==91 %% this one isn't exist in our main project, this should be added later.
    letter ='o';
elseif vd(1,1)==92
    letter ='p';
elseif vd(1,1)==93 || vd(1,1)==94 || vd(1,1)==95 || vd(1,1)==96 || vd(1,1)==97 || vd(1,1)==98 || vd(1,1)==99
    letter ='r';
elseif vd(1,1)==100 || vd(1,1)==101 || vd(1,1)==102 || vd(1,1)==103
    letter ='y';
% End
else
    letter='*';
end
function letter=read_letter_karo(imagn,num_letters)
% Computes the correlation between template and input image
% and its output is a string containing the letter.
% Size of 'imagn' must be 42 x 24 pixels
% Example:
% imagn=imread('D.bmp');
% letter=read_letter(imagn)
%
load templates_karo.mat
templatesKaro =  templates_karo;
comp=[ ];
%n=1:length(templates_karo)%num_letter
for n=1:num_letters 
    sem=corr2(templatesKaro{1,n},imagn);
    comp=[comp sem];
end

vd=find(comp==max(comp));
%vdIdx = vd;
%*-*-*-*-*-*-*-*-*-*-*-*-*-

if vd(1,1)==1 
    letter='a';
elseif vd(1,1) ==2
    letter = 'b';
elseif vd(1,1)==3
    letter='c';
elseif vd(1,1) == 4
    letter ='d';
elseif vd(1,1)==5 
    letter='e';
elseif  vd(1,1) ==6
    letter ='f';
elseif vd(1,1)==7
    letter='g';
elseif  vd(1,1)==8
    letter ='h';
elseif vd(1,1)==9
    letter='i';
elseif vd(1,1)==10
    letter ='I';
elseif vd(1,1)==11
    letter='j';
elseif vd(1,1)==12
    letter='k';
elseif vd(1,1)==13
    letter ='l';
elseif vd(1,1)==14
    letter='m';
elseif vd(1,1)==15
    letter='n';
elseif vd(1,1)==16
    letter ='e';
elseif vd(1,1)==17
    letter='p';
elseif vd(1,1)==18
    letter ='q';
elseif vd(1,1)==19
    letter='r';
elseif  vd(1,1)==20
    letter ='s';
elseif vd(1,1)==21
    letter='t';
elseif vd(1,1) ==22
    letter ='u';
elseif vd(1,1)==23
    letter='U';
elseif vd(1,1)==24
    letter ='v';
elseif vd(1,1)==25
    letter='w';
elseif vd(1,1)==26
    letter ='x';
elseif vd(1,1)==27
    letter='y';
elseif vd(1,1) == 28
    letter ='z';

% elseif vd==29
%     letter='o';
% elseif  vd==30
%     letter ='o';
% elseif vd==31
%     letter='p';
% elseif vd==32
%     letter='q';
% elseif vd==33 
%     letter='r';
% elseif vd==34
%     letter ='r';
% elseif vd==35
%     letter='s';
% elseif vd== 36
%     letter ='s';
% elseif vd==37
%     letter='t';
% elseif vd==38
%     letter ='t';
% elseif vd==39 
%     letter='u';
% elseif vd==40
%     letter ='u';
% elseif vd==41
%     letter='U';
% elseif vd==42
%     letter='v';
% elseif vd==43
%     letter='w';
% elseif vd==44
%     letter ='w';
% elseif vd == 45
%     letter ='x';
% elseif vd == 46
%     letter = 'y';
% elseif vd == 47
%     letter ='y';

else
    %if vd == 48
        letter='*';
    %end
end
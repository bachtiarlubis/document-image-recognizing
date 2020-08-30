workspace;
clc;
close all; 
%clear inputBatakReal;
clear; % the originak


% my_folder = 'D:\pcd\tester\TemplateMatchingSemhas\all_aksara_letters\simalungun\edited_simalungun_images';
my_folder = 'D:\pcd\tester\TemplateMatchingSemhas\all_aksara_letters\simalungun\allSimalungunLetters';
filenames =dir(fullfile(my_folder,'*.bmp'));
total_images = numel(filenames);
%save_folder = 'D:\pcd\tester\TemplateMatching\all_aksara_letters';
fontsize = 18;
letters =[];
figure(1);
for n = 1 : total_images
	fullname = fullfile(my_folder, filenames(n).name);
% 	our_images = logical(imread(fullname)); % the original
    theTemplates = imread(fullname);% new modified
%     % cropping the pads
%     [f, c]=find(our_images); % finding row(f) and column(c) indices  
%     croped_pads=our_images(min(f):max(f),min(c):max(c));%Cropping all pad of image
%     % end 
%     %paded_image = padarray(croped_pads,[2 2], 'both'); % the original
%     resizedImage = imresize(croped_pads, [50 50]); % the original
%     
%     subplot(1,3,1);
%     imshow(our_images);
%     title('Original Image', 'FontSize', fontsize);
%     
%     subplot(1,3,2);
%     imshow(croped_pads);
%     title('Croped Image', 'FontSize', fontsize);
    
    letters = [letters, theTemplates]; % original
    %letters(1,n) = theTemplates; % tester
    
    imshow(theTemplates);
    title('Template Images', 'FontSize', fontsize);
    
    pause(0.05);
    
 
%     save_Path = fullfile(save_folder,filenames(n).name);
%     imwrite(resizedImage,save_Path);
end
characters = (letters);
% templates_simalungun = mat2cell(characters,50,...
%         [50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50,...   % 20
%         50]);
templates_simalungun = mat2cell(characters,50,...
        [50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50,...   % 20
        50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50,...
        50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50,...
        50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50,...
        50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50,...
        50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50,...
        50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50,...
        50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50,...
        50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50,...
        50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50,...
        50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50,...
        50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50,...
        50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50,...
        50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50,...
        50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50]);

save ('templates_simalungun.mat','templates_simalungun')
clear;

myicon = imread('a.png');
msgbox('The Process Finished !','Success', 'custom',myicon);
disp ('create_templates_simalungun.m done !');
close all;
% end new added

%% Old Version
%{
% TRAINING SIMALUNGUN
direcotry = 'letters_numbers_simalungun\';
%Letter
A=imread(strcat(direcotry,'a.bmp'));
figure; imshow (A);
%Penambahan karakter a1-a4
% a1=imread('letters_numbers_karo\a1.bmp');
% figure; imshow (a1);
% a2=imread('letters_numbers_karo\a2.bmp');
% figure; imshow (a2);
% a3=imread('letters_numbers_karo\a3.bmp');
% figure; imshow (a3);
% a4=imread('letters_numbers_karo\a4.bmp');
%figure; imshow (a4);
B=imread(strcat(direcotry,'b.bmp'));
figure; imshow (B);
% C=imread('letters_numbers_karo\c.bmp');
% figure; imshow (C);
D=imread(strcat(direcotry,'d.bmp'));
figure; imshow (D);
E=imread(strcat(direcotry,'e.bmp'));
figure; imshow (E);
% F=imread('letters_numbers_karo\f.bmp');
% figure; imshow (F);
G=imread(strcat(direcotry,'g.bmp'));
figure; imshow (G);
H=imread(strcat(direcotry,'h.bmp'));
figure; imshow (H);
% I=imread('letters_numbers_karo\i.bmp');
% figure; imshow (I);
i1=imread(strcat(direcotry,'i1.bmp'));
figure; imshow (i1);
J=imread(strcat(direcotry,'j.bmp'));
figure; imshow (J);
K=imread(strcat(direcotry,'k.bmp'));
figure; imshow (K);
L=imread(strcat(direcotry,'l.bmp'));
figure; imshow (L);
M=imread(strcat(direcotry,'m.bmp'));
figure; imshow (M);
N=imread(strcat(direcotry,'n.bmp'));
figure; imshow (N);
O=imread(strcat(direcotry,'o.bmp'));
figure; imshow (O);
P=imread(strcat(direcotry,'p.bmp'));
figure; imshow (P);
% Q=imread('letters_numbers_karo\q.bmp');
% figure; imshow (Q);
R=imread(strcat(direcotry,'r.bmp'));
figure; imshow (R);
S=imread(strcat(direcotry,'s.bmp'));
figure; imshow (S);
T=imread(strcat(direcotry,'t.bmp'));
figure; imshow (T);
% U=imread('letters_numbers_karo\u.bmp');
% figure; imshow (U);
u1=imread(strcat(direcotry,'u1.bmp'));
figure; imshow (u1);
% V=imread('letters_numbers_karo\v.bmp');
% figure; imshow (V);
W=imread(strcat(direcotry,'w.bmp'));
figure; imshow (W);
% X=imread(strcat(direcotry,'x.bmp'));
% figure; imshow (X);
Y=imread(strcat(direcotry,'y.bmp'));
figure; imshow (Y);
Z=imread(strcat(direcotry,'z.bmp'));
figure; imshow (Z);


%%  letter=[A a1 a2 a3 a4 B C D E F G H I i1 J K L M...
%      N O P Q R S T U u1 V W X Y Z];
 letter=[A B D E G H i1 J K L M...
     N O P R S T u1 W Y Z];

character=[letter];

% templates_simalungun=mat2cell(character,42, ...
%     [24 24 24 24 24 ...
%     24 24 24 24 24 ... 
%     24 24 24 24 24 ... 
%     24 24 24 24 24 ...
%     24 24 24 24 24 ... 
%     24 24 24 24 24 ...
%     24 24]);


templates_simalungun=mat2cell(character,42, ...
    [24 24 24 24 24 ... %1
    24 24 24 24 24 ...  %2
    24 24 24 24 24 ...  %3
    24 24 24 24 24 ...  %4
    24]);  % 21 column
    

save ('templates_simalungun','templates_simalungun')
clear all
myicon = imread('a.png');
h=msgbox('Data training simalungun selesai !','Success !','custom',myicon);
close all
%msgbox('Data Training Selesai...');
%}
workspace;
clc;
close all; 
%clear inputBatakReal;
clear; % the originak


my_folder = 'D:\pcd\tester\TemplateMatchingSemhas\all_aksara_letters\pakpak\edited_pakpak_images';
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
templates_pakpak = mat2cell(characters,50,...
        [50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50,......  % 20
        50, 50, 50]);   % 40
%         50, 50, 50, 50, 50, 50, 50, 50]);   % 60
%         50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50,......   % 80
%         50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50,......   % 100
%         50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50,......   % 120
%         50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50,......   % 140
%         50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50,......   % 160
%         50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50,......   % 180
%         50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50,......   % 200
%         50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50,......   % 220
%         50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50,......   % 240
%         50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50,......   % 260
%         50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50,......   % 280
%         50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50,......   % 300
%         50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50,......   % 320
%         50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50,......   % 340
%         50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50,......   % 360
%         50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50,......   % 380
%         50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50,......   % 400
%         50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50,......   % 420
%         50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50,......   % 440
%         50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50]);                       % 456

save ('templates_pakpak.mat','templates_pakpak')
clear;

myicon = imread('a.png');
msgbox('The Process Finished !','Success', 'custom',myicon);
disp ('create_templates_pakpak.m done !');
close all;
% end new added


% Old Version
%{
% TRAINING PAKPAK
directory = 'letters_numbers_pakpak\';
%Letter
A=imread(strcat(directory,'a.bmp'));
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
B=imread(strcat(directory,'b.bmp'));
figure; imshow (B);
C=imread(strcat(directory,'c.bmp'));
figure; imshow (C);
D=imread(strcat(directory,'d.bmp'));
figure; imshow (D);
E=imread(strcat(directory,'e.bmp'));
figure; imshow (E);
F=imread(strcat(directory,'f.bmp'));
figure; imshow (F);
G=imread(strcat(directory,'g.bmp'));
figure; imshow (G);
H=imread(strcat(directory,'h.bmp'));
figure; imshow (H);
I=imread(strcat(directory,'i.bmp'));
figure; imshow (I);
i1=imread(strcat(directory,'i1.bmp'));
figure; imshow (i1);
J=imread(strcat(directory,'j.bmp'));
figure; imshow (J);
K=imread(strcat(directory,'k.bmp'));
figure; imshow (K);
L=imread(strcat(directory,'l.bmp'));
figure; imshow (L);
M=imread(strcat(directory,'m.bmp'));
figure; imshow (M);
N=imread(strcat(directory,'n.bmp'));
figure; imshow (N);
O=imread(strcat(directory,'o.bmp'));
figure; imshow (O);
P=imread(strcat(directory,'p.bmp'));
figure; imshow (P);
Q=imread(strcat(directory,'q.bmp'));
figure; imshow (Q);
R=imread(strcat(directory,'r.bmp'));
figure; imshow (R);
S=imread(strcat(directory,'s.bmp'));
figure; imshow (S);
T=imread(strcat(directory,'t.bmp'));
figure; imshow (T);
u1=imread(strcat(directory,'u1.bmp'));
figure; imshow (u1);
% U=imread('letters_numbers_karo\u1.bmp');
% figure; imshow (U);
% V=imread(strcat(directory,'v.bmp'));
% figure; imshow (V);
W=imread(strcat(directory,'w.bmp'));
figure; imshow (W);
% X=imread('letters_numbers_karo\x.bmp');
% figure; imshow (X);
Y=imread(strcat(directory,'y.bmp'));
figure; imshow (Y);
% Z=imread('letters_numbers_karo\z.bmp');
% figure; imshow (Z);


%%  letter=[A a1 a2 a3 a4 B C D E F G H I i1 J K L M...
%      N O P Q R S T U u1 V W X Y Z];
 letter=[A B C D E F G H I i1 J K L M...
     N O P Q R S T u1 W Y]; % 24 letters images 

character=[letter];

% templates_pakpak=mat2cell(character,42, ...
%     [24 24 24 24 24 ...
%     24 24 24 24 24 ... 
%     24 24 24 24 24 ... 
%     24 24 24 24 24 ...
%     24 24 24 24 24 ... 
%     24 24 24 24 24 ...
%     24 24]);


templates_pakpak=mat2cell(character,42, ...
    [24 24 24 24 24 ... %1
    24 24 24 24 24 ...  %2
    24 24 24 24 24 ...  %3
    24 24 24 24 24 ...  %4
    24 24 24 24]); % 24 column

save ('templates_pakpak','templates_pakpak')
clear all
myicon = imread('a.png');
h=msgbox('Data training pakpak selesai !','Success !','custom',myicon);
close all;
%msgbox('Data Training Selesai...');
%}
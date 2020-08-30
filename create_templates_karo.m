workspace;
clc;
close all; 
%clear inputBatakReal;
clear; % the originak


my_folder = 'D:\pcd\tester\TemplateMatchingSemhas\all_aksara_letters\karo\edited_karo_images\eachOne';
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
templates_karo = mat2cell(characters,50,...
        [50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50,......  % 20
        50, 50, 50, 50, 50, 50, 50, 50]);   % 40
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

save ('templates_karo.mat','templates_karo')
clear;

myicon = imread('a.png');
uiwait(msgbox('The Process Finished !','Success', 'custom',myicon));
disp ('create_templates_aksara_beta.m done !');
close all;
% end new added

%% Old Version
%{
% TRAINING KARO
%Letter
A=imread('letters_numbers_karo\A.bmp');
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
B=imread('letters_numbers_karo\b.bmp');
figure; imshow (B);
C=imread('letters_numbers_karo\c.bmp');
figure; imshow (C);
D=imread('letters_numbers_karo\d.bmp');
figure; imshow (D);
E=imread('letters_numbers_karo\e.bmp');
figure; imshow (E);
F=imread('letters_numbers_karo\f.bmp');
figure; imshow (F);
G=imread('letters_numbers_karo\g.bmp');
figure; imshow (G);
H=imread('letters_numbers_karo\h.bmp');
figure; imshow (H);
I=imread('letters_numbers_karo\i.bmp');
figure; imshow (I);
i1=imread('letters_numbers_karo\i1.bmp');
figure; imshow (i1);
J=imread('letters_numbers_karo\j.bmp');
figure; imshow (J);
K=imread('letters_numbers_karo\k.bmp');
figure; imshow (K);
L=imread('letters_numbers_karo\l.bmp');
figure; imshow (L);
M=imread('letters_numbers_karo\m.bmp');
figure; imshow (M);
N=imread('letters_numbers_karo\n.bmp');
figure; imshow (N);
O=imread('letters_numbers_karo\o.bmp');
figure; imshow (O);
P=imread('letters_numbers_karo\p.bmp');
figure; imshow (P);
Q=imread('letters_numbers_karo\q.bmp');
figure; imshow (Q);
R=imread('letters_numbers_karo\r.bmp');
figure; imshow (R);
S=imread('letters_numbers_karo\s.bmp');
figure; imshow (S);
T=imread('letters_numbers_karo\t.bmp');
figure; imshow (T);
U=imread('letters_numbers_karo\u.bmp');
figure; imshow (U);
u1=imread('letters_numbers_karo\u1.bmp');
figure; imshow (u1);
V=imread('letters_numbers_karo\v.bmp');
figure; imshow (V);
W=imread('letters_numbers_karo\w.bmp');
figure; imshow (W);
X=imread('letters_numbers_karo\x.bmp');
figure; imshow (X);
Y=imread('letters_numbers_karo\y.bmp');
figure; imshow (Y);
Z=imread('letters_numbers_karo\z.bmp');
figure; imshow (Z);


%%  letter=[A a1 a2 a3 a4 B C D E F G H I i1 J K L M...
%      N O P Q R S T U u1 V W X Y Z];
 letter=[A B C D E F G H I i1 J K L M...
     N O P Q R S T U u1 V W X Y Z];

character=[letter];

% templates_karo=mat2cell(character,42, ...
%     [24 24 24 24 24 ...
%     24 24 24 24 24 ... 
%     24 24 24 24 24 ... 
%     24 24 24 24 24 ...
%     24 24 24 24 24 ... 
%     24 24 24 24 24 ...
%     24 24]);


templates_karo=mat2cell(character,42, ...
    [24 24 24 24 24 ... %1
    24 24 24 24 24 ...  %2
    24 24 24 24 24 ...  %3
    24 24 24 24 24 ...  %4
    24 24 24 24 24 ...  %5
    24 24 24]); % 28 column

save ('templates_karo','templates_karo')
clear all
myicon = imread('a.png');
h=msgbox('Data training karo selesai','Success','custom',myicon);
close all
%msgbox('Data Training Selesai...');
%}
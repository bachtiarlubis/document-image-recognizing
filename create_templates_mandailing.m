workspace;
clc;
close all; 
%clear inputBatakReal;
clear; % the originak


my_folder = 'D:\pcd\tester\TemplateMatchingSemhas\all_aksara_letters\mandailing\edited_mandailing_images';
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
    
    letters = [letters, theTemplates]; % original
    %letters(1,n) = theTemplates; % tester
    
    imshow(theTemplates);
    title('Template Images', 'FontSize', fontsize);
    
    pause(0.05);
    
 
%     save_Path = fullfile(save_folder,filenames(n).name);
%     imwrite(resizedImage,save_Path);
end
characters = (letters);
templates_mandailing = mat2cell(characters,50,...
        [50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50,......  % 20
        50, 50, 50, 50, 50, 50, 50, 50, 50, 50]);   % 40
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

save ('templates_mandailing.mat','templates_mandailing')
clear;

myicon = imread('a.png');
msgbox('The Process Finished !','Success', 'custom',myicon);
disp ('create_templates_mandailing.m done !');
close all;
% end new added

%{
% TRAINING MANDAILING
%Letter
directory = 'letters_numbers_mandailing\';
%Penambahan karakter a1-a4
% a1=imread('letters_numbers_karo\a1.bmp');
% figure; imshow (a1);
% a2=imread('letters_numbers_karo\a2.bmp');
% figure; imshow (a2);
% a3=imread('letters_numbers_karo\a3.bmp');
% figure; imshow (a3);
% a4=imread('letters_numbers_karo\a4.bmp');
%figure; imshow (a4);

%strcat function is for concatenate the variable with the string !
A0=imread(strcat(directory,'0.bmp'));
figure; imshow (A0);
A1=imread(strcat(directory,'1.bmp'));
figure; imshow (A1);
A2=imread(strcat(directory,'2.bmp'));
figure; imshow (A2);
A3=imread(strcat(directory,'3.bmp'));
figure; imshow (A3);
A4=imread(strcat(directory,'4.bmp'));
figure; imshow (A4);
A5=imread(strcat(directory,'5.bmp'));
figure; imshow (A5);
A6=imread(strcat(directory,'6.bmp'));
figure; imshow (A6);
A7=imread(strcat(directory,'7.bmp'));
figure; imshow (A7);
A=imread(strcat(directory,'a.bmp')); %9
figure; imshow (A);
B=imread(strcat(directory,'b.bmp')); % 10
figure; imshow (B);
C=imread(strcat(directory,'c.bmp')); %11
figure; imshow (C);
D=imread(strcat(directory,'d.bmp')); %12
figure; imshow (D);
E=imread(strcat(directory,'e.bmp'));    %13
figure; imshow (E);
F=imread(strcat(directory,'f.bmp'));    %14
figure; imshow (F);
G=imread(strcat(directory,'g.bmp'));    %15
figure; imshow (G);
H=imread(strcat(directory,'h.bmp'));    %16
figure; imshow (H);
I=imread(strcat(directory,'i.bmp'));    %17
figure; imshow (I);
i1=imread(strcat(directory,'i1.bmp'));  %18
figure; imshow (i1);
J=imread(strcat(directory,'j.bmp'));    %19
figure; imshow (J);
K=imread(strcat(directory,'k.bmp'));    %20
figure; imshow (K);
L=imread(strcat(directory,'l.bmp'));    %21
figure; imshow (L);
M=imread(strcat(directory,'m.bmp'));    %22
figure; imshow (M);
N=imread(strcat(directory,'n.bmp'));    %23
figure; imshow (N);
O=imread(strcat(directory,'o.bmp'));    %24
figure; imshow (O);
P=imread(strcat(directory,'p.bmp'));    %25
figure; imshow (P);
Q=imread(strcat(directory,'q.bmp'));    %26
figure; imshow (Q);
R=imread(strcat(directory,'r.bmp'));    %27
figure; imshow (R);
S=imread(strcat(directory,'s.bmp'));    %28
figure; imshow (S);
T=imread(strcat(directory,'t.bmp'));    %29
figure; imshow (T);
% U=imread(strcat(directory,'u.bmp'));
% figure; imshow (U);
u1=imread(strcat(directory,'u1.bmp'));  % 30
figure; imshow (u1);
V=imread(strcat(directory,'v.bmp'));    % 31
figure; imshow (V);
W=imread(strcat(directory,'w.bmp'));    % 32
figure; imshow (W);
X=imread(strcat(directory,'x.bmp'));    % 33
figure; imshow (X); 
Y=imread(strcat(directory,'y.bmp'));    % 34
figure; imshow (Y);
Z=imread(strcat(directory,'z.bmp'));    % 35
figure; imshow (Z);


%%  letter=[A a1 a2 a3 a4 B C D E F G H I i1 J K L M...
%      N O P Q R S T U u1 V W X Y Z];
 letter=[A0 A1 A2 A3 A4 A5 A6 A7 A B C D E F G H I i1 J K L M...
     N O P Q R S T u1 V W X Y Z];

character=[letter];

% templates_mandailing=mat2cell(character,42, ...
%     [24 24 24 24 24 ...
%     24 24 24 24 24 ... 
%     24 24 24 24 24 ... 
%     24 24 24 24 24 ...
%     24 24 24 24 24 ... 
%     24 24 24 24 24 ...
%     24 24]);


templates_mandailing=mat2cell(character,42, ...
    [24 24 24 24 24 ... % 1
    24 24 24 24 24 ...  % 2
    24 24 24 24 24 ...  % 3
    24 24 24 24 24 ...  % 4
    24 24 24 24 24 ...  % 5
    24 24 24 24 24 ...  % 6
    24 24 24 24 24]); % 7 = 35 column
    

save ('templates_mandailing','templates_mandailing')
clear all;
myicon = imread('a.png');
h=msgbox('Data training mandailing selesai !','Success !','custom',myicon);
close all;
%msgbox('Data Training Selesai...');
%}
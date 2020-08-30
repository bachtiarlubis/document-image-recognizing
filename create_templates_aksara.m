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
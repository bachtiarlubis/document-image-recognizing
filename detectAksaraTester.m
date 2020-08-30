clc;
clear clearvars;
workspace;
close all

[FileName,PathName]=uigetfile('D:\pcd\tester\TemplateMatchingSemhas\Input dokumen batak\dokumen simalungun\*.jpg',' Choose an Aksara Document Image');
fullFileName = fullfile(PathName,FileName);
baseFileName = 'dok_simalungun1.jpg';
% fullFileName = fullfile(PathName,FileName);
originalImage = imread(fullFileName);
imshow(originalImage, []);
%grayscaling
grayImage = rgb2gray(originalImage);
pause(0.05);
imshow(grayImage, []);
%binarizing
binaryImage = ~im2bw(grayImage, graythresh(grayImage));
pause(0.05);
imshow(binaryImage, []);
%area opening
areaOpenImage = bwareaopen(binaryImage, 24);
pause(0.05);
imshow(areaOpenImage, []);

%%
% load templates_karo.mat
% load templates_mandailing.mat
% load templates_pakpak.mat
load templates_simalungun.mat
% load templates_toba.mat

%% The Global Variables
% global areaOpenImage;

% areaOpenImage =imread('D:\pcd\tester\TemplateMatching\Input dokumen batak\dokumen karo\dok_karo1_areaOpened.jpg'); % dok1k.jpg has been changed to this image
% global fStyle;
%% End Global Variables

% templatesKaro = templates_karo;
% templatesMandailing = templates_mandailing;
% templatesPakpak = templates_pakpak;
templatesSimalungun = templates_simalungun;
% templatesToba = templates_toba;


%imagen = imopen(areaOpenImage, strel('square',4)); % Opening Morpholohy (erode then dilate) 
imagen = areaOpenImage;
line_rest = imagen;

% num_letters=size(templatesKaro,2);
% num_letters=size(templatesMandailing,2);
% num_letters=size(templatesPakpak,2);
num_letters=size(templatesSimalungun,2);
% num_letters=size(templatesToba,2);

word=[ ];
kata=[ ];

numberOfLine = 1;

allMaxIdx = []; %%%% new modified
while 1
    %%Fcn 'projProf_Vertical' separate lines in text
    [line_out, line_rest]=projProf_VerticalTester(line_rest);
    numberOfLine = numberOfLine+1;
   
    %% Fcn projProfile_Horizontal separate characters in line
    %[char_out, num_char, L, Ne] = projProfile_Horizontal(imgn);
    horizontalInput=line_out;
    theCharacters = projProfile_HorizontalTester(horizontalInput); % output is as cell. And-
    %   the padarray is closed due to this is for template matching
    %   algorithm
    %% end
    
    lengthOfChar = length(theCharacters); % number of characters in a line
    
    for m = 1 : lengthOfChar           
     
       n1 = theCharacters{1,m};

%        letter=read_letter_karo(n1,num_letters);
%        letter=read_letter_mandailing(n1,num_letters); % 
%        [letter,maxIdx]=read_letter_pakpak(n1,num_letters); % 
%        allMaxIdx = [allMaxIdx, maxIdx]; %%% new modified
       letter=read_letter_simalungun(n1,num_letters); % 
%        letter=read_letter_toba(n1,num_letters); % 
       word=[word letter];
       kata=[kata letter];
%        indexLetters=[indexLetters idLetters];
       
    %% Saving all cell contents
      
%        folderToSave = 'D:\pcd\tester\Segmentation\data_test\profileSave';
%        fileToSave = sprintf('karo letter %d.bmp',fileSv);
%        pathToSave = fullfile(folderToSave,fileToSave);
%        imwrite(n1,pathToSave);
       
    %% End Saving
%        pause(0.005);
%       guidata(hObject,handles); % just added 
    end
%     axes(handles.axes1); % just added
%     imshow(verticalImage); % just added
    
    word=[ ];
    pause(0.5);
    if isempty(line_rest)  %See variable 're' in Fcn 'lines'
        %h=msgbox('Error citra');
       break
    end  
end

uiwait(msgbox('Click Oke to Convert into Word Document','Segmentation is done'));
%%
feature('DefaultCharacterSet', 'UTF-8')
word = actxserver('Word.Application');
word.Visible = 1;
document = word.Documents.Add;
selection = word.Selection;
selection.TypeText(kata); %('the contents');
selection.Style='Heading 1';
selection.TypeParagraph;
H1 = document.Styles.Item('Heading 1');
% H1.Font.Name = 'Karo';%%%
% H1.Font.Name = 'Mandailing';%%%
% H1.Font.Name = 'Pakpak';%%%
H1.Font.Name = 'Simalungun';%%%
% H1.Font.Name = 'Toba';%%%
H1.Font.Size = 22;
H1.Font.Bold = 1;
H1.Font.TextColor.RGB=0; 
selection.TypeParagraph
% document = invoke(word.documents,'add');
selection.TypeParagraph
%selection.TypeText('End')
% saveDocName = sprintf('dok_%s.docx',fStyle);
% fullPathSave = fullfile(pwd, saveDocName);
document.SaveAs2([pwd '/dok_KaroMandaPakSiTob.docx']);
% document.SaveAs2(fullPathSave);
kata=[ ];
word.Quit();    
% winopen('dok_toba.docx')
winopen('dok_KaroMandaPakSiTob.docx')
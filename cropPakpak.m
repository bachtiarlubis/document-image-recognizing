function varargout = cropPakpak(varargin)
% CROPPAKPAK MATLAB code for cropPakpak.fig
%      CROPPAKPAK, by itself, creates a new CROPPAKPAK or raises the existing
%      singleton*.
%
%      H = CROPPAKPAK returns the handle to a new CROPPAKPAK or the handle to
%      the existing singleton*.
%
%      CROPPAKPAK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CROPPAKPAK.M with the given input arguments.
%
%      CROPPAKPAK('Property','Value',...) creates a new CROPPAKPAK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before cropPakpak_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to cropPakpak_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help cropPakpak

% Last Modified by GUIDE v2.5 04-Mar-2019 10:31:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @cropPakpak_OpeningFcn, ...
                   'gui_OutputFcn',  @cropPakpak_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before cropPakpak is made visible.
function cropPakpak_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to cropPakpak (see VARARGIN)

% Choose default command line output for cropPakpak
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
movegui('center');

% UIWAIT makes cropPakpak wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = cropPakpak_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%% Running our main program

%%warning off;

load templates_pakpak.mat
%% The Global Variables
global areaOpenImage;

% areaOpenImage =imread('D:\pcd\tester\TemplateMatching\Input dokumen batak\dokumen karo\dok_karo1_areaOpened.jpg'); % dok1k.jpg has been changed to this image
% global fStyle;
%% End Global Variables

templatesPakpak = templates_pakpak;


imagen = imopen(areaOpenImage, strel('square',4)); % Opening Morpholohy (erode then dilate) 

line_rest = imagen;
num_letters=size(templatesPakpak,2);
global kata;
global hSubplots;
word=[ ];
kata=[ ];
% indexLetters=[];
% fid = fopen('text1.txt', 'wt');
% global indexSubplot;
% global lineNumber;
% indexSubplot = 0;
% lineNumber = 1;
numberOfLine = 1;
global axSeq;
axSeq = 2; % initializing the position of line's axes
while 1
    %%Fcn 'projProf_Vertical' separate lines in text
    [line_out, line_rest]=projProf_Vertical(line_rest, handles);
%     
%     subplot(5, 10, (1:5)+indexSubplot );
%     imshow(line_out); 
%     caption = sprintf('Line of #%d', lineNumber);
%     title(caption, 'FontSize', 10);
%     indexSubplot=indexSubplot+5;
%     lineNumber = lineNumber+1;
    numberOfLine = numberOfLine+1;
    axSeq = axSeq + 1;
    horizontalInput=line_out;
    
    %% Fcn projProfile_Horizontal separate characters in line
    %[char_out, num_char, L, Ne] = projProfile_Horizontal(imgn);
    delete(hSubplots); % deleting the showed characters
    theCharacters = projProfile_Horizontal(horizontalInput); % output is as cell. And-
    %   the padarray is closed due to this is for template matching
    %   algorithm
    %% end
    
    lengthOfChar = length(theCharacters); % number of characters in a line
    
    for m = 1 : lengthOfChar           
     
       n1 = theCharacters{1,m};

       letter=read_letter_pakpak(n1,num_letters); % read_letter_toba was changed to be read_letter_aksara
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
finalNumberOfLine = num2str(numberOfLine);
%set(handles.editNumberLine,'string',finalNumberOfLine); had been deleted
% fclose(fid);

% %delete('test1.docx')
% feature('DefaultCharacterSet', 'UTF-8')
% word = actxserver('Word.Application');
% word.Visible = 1;
% document = word.Documents.Add;
% selection = word.Selection;
% selection.TypeText(kata); %('the contents');
% selection.Style='Heading 1';
% selection.TypeParagraph;
% H1 = document.Styles.Item('Heading 1');
% H1.Font.Name = 'Karo';
% H1.Font.Size = 22;
% H1.Font.Bold = 1;
% H1.Font.TextColor.RGB=0; 
% selection.TypeParagraph
% % document = invoke(word.documents,'add');
% selection.TypeParagraph
% %selection.TypeText('End')
% % saveDocName = sprintf('dok_%s.docx',fStyle);
% % fullPathSave = fullfile(pwd, saveDocName);
% document.SaveAs2([pwd '/dok_karo.docx']);
% % document.SaveAs2(fullPathSave);
% kata=[ ];
% word.Quit();    
% % winopen('dok_toba.docx')
% winopen('dok_karo.docx')
% 
% 
% 
% % etnicAksara = sprintf('Dokumen Aksara Batak %s',fStyleReport); %fStyle was changed to be fStyleReport
% 
% uiwait(msgbox('Clicking ''OK'' Would Close All Figures','Done !'));
% close all;

%%
%{
[char,line] = projection_profile_cropKaro(handles)
%}
%%

%% Show Images
% panhandle = uipanel;
% pax11 = subplot(24,2,1,'Parent',panhandle);
%
% handles.panhandle = panhandle;
% handles.pax11 = pax11l;
%
% guidata(hObject, handles);
%%

% --- Executes on button press in btnNext2.
function btnNext2_Callback(hObject, eventdata, handles)
% hObject    handle to btnNext2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global kata;
%delete('test1.docx')
feature('DefaultCharacterSet', 'UTF-8')
word = actxserver('Word.Application');
word.Visible = 1;
document = word.Documents.Add;
selection = word.Selection;
selection.TypeText(kata); %('the contents');
selection.Style='Heading 1';
selection.TypeParagraph;
H1 = document.Styles.Item('Heading 1');
H1.Font.Name = 'Pakpak';
H1.Font.Size = 22;
H1.Font.Bold = 1;
H1.Font.TextColor.RGB=0; 
selection.TypeParagraph
% document = invoke(word.documents,'add');
selection.TypeParagraph
%selection.TypeText('End')
% saveDocName = sprintf('dok_%s.docx',fStyle);
% fullPathSave = fullfile(pwd, saveDocName);
document.SaveAs2([pwd '/dok_pakpak.docx']);
% document.SaveAs2(fullPathSave);
kata=[ ];
word.Quit();    
% winopen('dok_toba.docx')
winopen('dok_pakpak.docx')



% etnicAksara = sprintf('Dokumen Aksara Batak %s',fStyleReport); %fStyle was changed to be fStyleReport

uiwait(msgbox('Clicking ''OK'' Would Close All Figures','Done !'));
close all;


% --- Executes during object creation, after setting all properties.
function uipanel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in btnHome.
function btnHome_Callback(hObject, eventdata, handles)
% hObject    handle to btnHome (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
opts.Interpreter ='tex';
opts.Default ='Yes';
answer = questdlg('Do you want to head to Home ?',...
    'Back to Home',...
    'Yes','No',opts);
switch answer
    case 'Yes'
        clear global;
        clear clearvars;
        close all;
        Introduction;
    case 'No'
        return
end

% --- Executes on button press in btnClose.
function btnClose_Callback(hObject, eventdata, handles)
% hObject    handle to btnClose (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
opts.Interpreter='tex';
opts.Default='No';
answer = questdlg('Are you sure want to close this Program ?',...
    'Close The Program',...
    'Yes','No',opts);
switch answer
    case 'Yes'
        clear global;
        clear clearvars;
        close all;
    case 'No'
        return
end

function varargout = detectKaro(varargin)
% DETECTKARO MATLAB code for detectKaro.fig
%      DETECTKARO, by itself, creates a new DETECTKARO or raises the existing
%      singleton*.
%
%      H = DETECTKARO returns the handle to a new DETECTKARO or the handle to
%      the existing singleton*.
%
%      DETECTKARO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DETECTKARO.M with the given input arguments.
%
%      DETECTKARO('Property','Value',...) creates a new DETECTKARO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before detectKaro_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to detectKaro_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help detectKaro

% Last Modified by GUIDE v2.5 04-Feb-2019 22:57:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @detectKaro_OpeningFcn, ...
                   'gui_OutputFcn',  @detectKaro_OutputFcn, ...
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


% --- Executes just before detectKaro is made visible.
function detectKaro_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to detectKaro (see VARARGIN)

% Choose default command line output for detectKaro
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
movegui('center');

% Set the Next Process buttton to off
set(handles.btnNext1,'enable','off');

% UIWAIT makes detectKaro wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = detectKaro_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnInput.
function btnInput_Callback(hObject, eventdata, handles)
% hObject    handle to btnInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global originalImage;
global grayImage;
global binaryImage;
global areaOpenImage;
% global OriginalPathName;
% [FileName,PathName]=uigetfile({'*.bmp;*.jpg;*.png'},' Choose an Aksara Document Image');
[FileName,PathName]=uigetfile('D:\pcd\tester\TemplateMatching\Input dokumen batak\dokumen karo\*.jpg',' Choose an Aksara Document Image');
fullFileName = fullfile(PathName,FileName);
baseFileName = 'dok_karo1.jpg';
%
if ~exist(fullFileName, 'file')
	% File doesn't exist -- didn't find it there.  Check the search path for it.
	fullFileNameOnSearchPath = baseFileName; % No path this time.
	if ~exist(fullFileNameOnSearchPath, 'file')
		% Still didn't find it.  Alert user.
		errorMessage = sprintf('Error: %s does not exist in the search path folders !', fullFileName);
		uiwait(warndlg(errorMessage));
		return;
	end
end
if isequal(FileName,0)
    errorMessage = sprintf('You Hav''ent choose any file yet !');
    uiwait(errordlg(errorMessage));
    return;
else
    fullFileName = fullfile(PathName,FileName);
    originalImage = imread(fullFileName);
    % set the path name to editTextPath
    set(handles.editTextPath,'string',fullFileName);
    grayCheck = size(originalImage,3);
    if grayCheck > 1
        axes(handles.axes1);
        imshow(originalImage, []);
        %grayscaling
        grayImage = rgb2gray(originalImage);
        pause(0.05);
        axes(handles.axes2);
        imshow(grayImage, []);
        %binarizing
        binaryImage = ~im2bw(grayImage, graythresh(grayImage));
        pause(0.05);
        axes(handles.axes3);
        imshow(binaryImage, []);
        %area opening
        areaOpenImage = bwareaopen(binaryImage, 24);
        pause(0.05);
        axes(handles.axes4);
        imshow(areaOpenImage, []);
        set(handles.btnNext1,'enable','on');
    elseif length(unique(originalImage))>2 % is this grayscaled or not
        % show as original
        axes(handles.axes1);
        imshow(originalImage, []);
        %show as grayscaled
        axes(handles.axes2);
        imshow(grayImage, []);
        %binarizing
        binaryImage = ~im2bw(originalImage, graythresh(originalImage));
        pause(0.05);
        axes(handles.axes3);
        imshow(binaryImage, []);
        %area opening
        areaOpenImage = bwareaopen(binaryImage, 24);
        pause(0.05);
        axes(handles.axes4);
        imshow(areaOpenImage, []);
        set(handles.btnNext1,'enable','on');
    else
        %show as original image
        axes(handles.axes1);
        imshow(originalImage, []);
        %show as binary Image
        axes(handles.axes3);
        imshow(originalImage, []);
        binaryImage = originalImage;
        %area opening
        areaOpenImage = bwareaopen(binaryImage, 24);
        pause(0.05);
        axes(handles.axes4);
        imshow(areaOpenImage, []);
        set(handles.btnNext1,'enable','on');
    end
    
    
end

% --- Executes on button press in btnClear.
function btnClear_Callback(hObject, eventdata, handles)
% hObject    handle to btnClear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% arrayfun(@cla,findall(0,'type','axes')); % to clear all axeses
axes(handles.axes1);
cla('reset');
axes(handles.axes2);
cla('reset');
axes(handles.axes3);
cla('reset');
axes(handles.axes4);
cla('reset');

set(handles.editTextPath,'String',''); % to clear editTextPath
clear clearvars; % to clear all variables in workspace


function editTextPath_Callback(hObject, eventdata, handles)
% hObject    handle to editTextPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editTextPath as text
%        str2double(get(hObject,'String')) returns contents of editTextPath as a double


% --- Executes during object creation, after setting all properties.
function editTextPath_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editTextPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnNext1.
function btnNext1_Callback(hObject, eventdata, handles)
% hObject    handle to btnNext1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%
cropKaro
close(detectKaro)


% --- Executes on button press in btnChangeType2.
function btnChangeType2_Callback(hObject, eventdata, handles)
% hObject    handle to btnChangeType2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
opts.Interpreter = 'tex';
opts.Default = 'Yes';
answer = questdlg('Do you want to change the script type ?',...
    'Back to Choose Script Type',...
    'Yes','No',opts);
switch answer
    case 'Yes'
        choseScript;
         close(detectKaro);
    case 'No'
        return;
end


% --- Executes on button press in btnClose2.
function btnClose2_Callback(hObject, eventdata, handles)
% hObject    handle to btnClose2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
opts.Interpreter = 'tex';
opts.Default = 'No';
answer = questdlg('Are you sure want to close this window ?',...
    'Close Window',...
    'Yes','No',opts);
switch answer
    case 'Yes'
        close all;
    case 'No'
        return;
end
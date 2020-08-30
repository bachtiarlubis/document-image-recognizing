function varargout = choseScript(varargin)
% CHOSESCRIPT MATLAB code for choseScript.fig
%      CHOSESCRIPT, by itself, creates a new CHOSESCRIPT or raises the existing
%      singleton*.
%
%      H = CHOSESCRIPT returns the handle to a new CHOSESCRIPT or the handle to
%      the existing singleton*.
%
%      CHOSESCRIPT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHOSESCRIPT.M with the given input arguments.
%
%      CHOSESCRIPT('Property','Value',...) creates a new CHOSESCRIPT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before choseScript_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to choseScript_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help choseScript

% Last Modified by GUIDE v2.5 04-Feb-2019 22:18:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @choseScript_OpeningFcn, ...
                   'gui_OutputFcn',  @choseScript_OutputFcn, ...
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


% --- Executes just before choseScript is made visible.
function choseScript_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to choseScript (see VARARGIN)

% Choose default command line output for choseScript
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
movegui('center');

% UIWAIT makes choseScript wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = choseScript_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnKaro.
function btnKaro_Callback(hObject, eventdata, handles)
% hObject    handle to btnKaro (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
detectKaro
close(choseScript)
% --- Executes on button press in btnMandailing.
function btnMandailing_Callback(hObject, eventdata, handles)
% hObject    handle to btnMandailing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
detectMandailing;
close(choseScript)

% --- Executes on button press in btnPakpak.
function btnPakpak_Callback(hObject, eventdata, handles)
% hObject    handle to btnPakpak (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
detectPakpak
close(choseScript)

% --- Executes on button press in btnSimalungun.
function btnSimalungun_Callback(hObject, eventdata, handles)
% hObject    handle to btnSimalungun (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
detectSimalungun
close(choseScript)

% --- Executes on button press in btnToba.
function btnToba_Callback(hObject, eventdata, handles)
% hObject    handle to btnToba (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
detectToba
close(choseScript)


% --- Executes on button press in btnHome.
function btnHome_Callback(hObject, eventdata, handles)
% hObject    handle to btnHome (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Introduction
close(choseScript);

% --- Executes on button press in btnClose.
function btnClose_Callback(hObject, eventdata, handles)
% hObject    handle to btnClose (see GCBO)
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
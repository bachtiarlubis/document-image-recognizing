function varargout = infoMenu(varargin)
% INFOMENU MATLAB code for infoMenu.fig
%      INFOMENU, by itself, creates a new INFOMENU or raises the existing
%      singleton*.
%
%      H = INFOMENU returns the handle to a new INFOMENU or the handle to
%      the existing singleton*.
%
%      INFOMENU('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INFOMENU.M with the given input arguments.
%
%      INFOMENU('Property','Value',...) creates a new INFOMENU or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before infoMenu_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to infoMenu_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to info infoMenu

% Last Modified by GUIDE v2.5 04-Feb-2019 22:26:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @infoMenu_OpeningFcn, ...
                   'gui_OutputFcn',  @infoMenu_OutputFcn, ...
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


% --- Executes just before infoMenu is made visible.
function infoMenu_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to infoMenu (see VARARGIN)

% Choose default command line output for infoMenu
handles.output = hObject;
%% continuous value change listener for your slider
handles.sliderListener = addlistener(handles.slider1,'ContinuousValueChange', ...
                                      @(hFigure,eventdata) slider1ContValCallback(...
                                        hObject,eventdata));
%%
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes infoMenu wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = infoMenu_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
infoText = fileread('D:\pcd\tester\TemplateMatchingSemhas\Info\infoContent.txt');
%{
infoString0= sprintf('Langkah-langkah dalam mengoperasikan aplikasi:\n');
infoString1 = sprintf('1. Setelah aplikasi dijalankan, tekan Start.\n');
infoString2 = sprintf('2. Kemudian pilih jenis etnis aksara Batak yang akan diproses.\n\n');
infoString3 = sprintf('3. Input data yang ingin diproses dengan menekan tombol Input.\n\n');
infoString4 = sprintf('4. Setelah itu tekah tombol Cropping, tunggu beberapa saat sampai proses selesai.\n\n');
infoString5 = sprintf('5. Kemudian tekan Ekstraksi untuk memperoleh output berupa dokumen teks dalam bentuk ms word office.');
infoString = sprintf('%s%s%s%s%s%s', infoString0,infoString1,infoString2,infoString3,infoString4,infoString5);
% infoString = strcat(infoString1,infoString2);
%}
set(handles.text2,'String',infoText);


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


function slider1ContValCallback(hFigure,eventdata)
handles=guidata(hFigure);
sliderValue =get(handles.slider1,'Value');
set(handles.text2,'String',num2str(sliderValue));

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function varargout = helpMenu(varargin)
% HELPMENU MATLAB code for helpMenu.fig
%      HELPMENU, by itself, creates a new HELPMENU or raises the existing
%      singleton*.
%
%      H = HELPMENU returns the handle to a new HELPMENU or the handle to
%      the existing singleton*.
%
%      HELPMENU('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HELPMENU.M with the given input arguments.
%
%      HELPMENU('Property','Value',...) creates a new HELPMENU or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before helpMenu_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to helpMenu_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help helpMenu

% Last Modified by GUIDE v2.5 04-Feb-2019 22:40:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @helpMenu_OpeningFcn, ...
                   'gui_OutputFcn',  @helpMenu_OutputFcn, ...
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


% --- Executes just before helpMenu is made visible.
function helpMenu_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to helpMenu (see VARARGIN)

% Choose default command line output for helpMenu
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes helpMenu wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = helpMenu_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

helpString0= sprintf('Langkah-langkah dalam mengoperasikan aplikasi:\n');
helpString1 = sprintf('1. Setelah aplikasi dijalankan, tekan Start.\n');
helpString2 = sprintf('2. Kemudian pilih jenis etnis aksara Batak yang akan diproses.\n\n');
helpString3 = sprintf('3. Input data yang ingin diproses dengan menekan tombol Input.\n\n');
helpString4 = sprintf('4. Setelah itu tekah tombol Cropping, tunggu beberapa saat sampai proses selesai.\n\n');
helpString5 = sprintf('5. Kemudian tekan Ekstraksi untuk memperoleh output berupa dokumen teks dalam bentuk ms word office.');
helpString = sprintf('%s%s%s%s%s%s', helpString0,helpString1,helpString2,helpString3,helpString4,helpString5);
% helpString = strcat(helpString1,helpString2);
set(handles.text2,'String',helpString);

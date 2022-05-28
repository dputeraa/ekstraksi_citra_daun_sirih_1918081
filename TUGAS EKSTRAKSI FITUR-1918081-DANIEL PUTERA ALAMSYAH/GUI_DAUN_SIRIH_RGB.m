function varargout = GUI_DAUN_SIRIH_RGB(varargin)
%GUI_DAUN_SIRIH_RGB M-file for GUI_DAUN_SIRIH_RGB.fig
%      GUI_DAUN_SIRIH_RGB, by itself, creates a new GUI_DAUN_SIRIH_RGB or raises the existing
%      singleton*.
%
%      H = GUI_DAUN_SIRIH_RGB returns the handle to a new GUI_DAUN_SIRIH_RGB or the handle to
%      the existing singleton*.
%
%      GUI_DAUN_SIRIH_RGB('Property','Value',...) creates a new GUI_DAUN_SIRIH_RGB using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to GUI_DAUN_SIRIH_RGB_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      GUI_DAUN_SIRIH_RGB('CALLBACK') and GUI_DAUN_SIRIH_RGB('CALLBACK',hObject,...) call the
%      local function named CALLBACK in GUI_DAUN_SIRIH_RGB.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_DAUN_SIRIH_RGB

% Last Modified by GUIDE v2.5 28-May-2022 01:30:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_DAUN_SIRIH_RGB_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_DAUN_SIRIH_RGB_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before GUI_DAUN_SIRIH_RGB is made visible.
function GUI_DAUN_SIRIH_RGB_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for GUI_DAUN_SIRIH_RGB
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_DAUN_SIRIH_RGB wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_DAUN_SIRIH_RGB_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in open.
function open_Callback(hObject, eventdata, handles)
% hObject    handle to open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[nama_file1, nama_path1]=uigetfile(...
    {'*.bmp; *.png; *.jpg', 'File citra (*.bmp, *.jpg, *.png)';
    '*.bmp' , 'File Bitmap(*.bmp)';
    '*.png' , 'File Png(*.png)';
    '*.jpg' , 'File Jpeg (*.jpg)';
    '*.*', 'Semua File (*.*)'},...
    'Buka Citra asli');

if ~isequal (nama_file1, 0);
    %read citra rgb
    handles.data1=imread(fullfile(nama_path1, nama_file1));
    guidata(hObject, handles);
    handles.current_data1=handles.data1;
    axes(handles.axes2)
    imshow(handles.current_data1);
    %axes proses output citra
else
    return
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.current_data1=handles.data1;
    axes(handles.axes2)

red=mean(mean(handles.current_data1(:,:,1)));
green=mean(mean(handles.current_data1(:,:,2)));
blue=mean(mean(handles.current_data1(:,:,3)));

set(handles.edit1,'string',red);
set(handles.edit2,'string',green);
set(handles.edit3,'string',blue);


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

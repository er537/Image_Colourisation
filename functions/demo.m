function varargout = demo(varargin)
% DEMO MATLAB code for demo.fig
%      DEMO, by itself, creates a new DEMO or raises the existing
%      singleton*.
%
%      H = DEMO returns the handle to a new DEMO or the handle to
%      the existing singleton*.
%
%      DEMO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DEMO.M with the given input arguments.
%
%      DEMO('Property','Value',...) creates a new DEMO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before demo_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to demo_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help demo

% Last Modified by GUIDE v2.5 29-Jan-2021 14:29:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @demo_OpeningFcn, ...
                   'gui_OutputFcn',  @demo_OutputFcn, ...
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


% --- Executes just before demo is made visible.
function demo_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to demo (see VARARGIN)

% Choose default command line output for demo
handles.output = hObject;
handles.originFig = [];
handles.greyscaleFig = [];
handles.colorinfoFig = [];
handles.recoverFig = [];
handles.greyscaleChoice=[];
handles.proportion=0.01;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes demo wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = demo_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in upload_btn.
function upload_btn_Callback(hObject, eventdata, handles)
% hObject    handle to upload_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% upload pictures
[filename,pathname,flag] = uigetfile({'*.*';'*.jpg';'*.bmp';'*.gif';'*.png';'*.tif'},'Read Pic');
str = [pathname filename];
if (flag~=0)
    % store original picture in handles.originFig
    handles.originFig = imread(str);
    axes(handles.origin_axes);
    imshow(handles.originFig);
    % greyscaling and store greyscaled picture in handles.greyscaleFig
    handles.greyscaleFig=greyscale(handles.originFig);
    axes(handles.greyscale_axes);
    imshow(handles.greyscaleFig);
    guidata(hObject, handles);
end


% --- Executes on selection change in colorinfo_pum.
function colorinfo_pum_Callback(hObject, eventdata, handles)
% hObject    handle to colorinfo_pum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.greyscaleChoice = hObject.String{hObject.Value};
guidata(hObject, handles);



% --- Executes during object creation, after setting all properties.
function colorinfo_pum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to colorinfo_pum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global COM_GREYSCALE;
COM_GREYSCALE = {'--Please Select--','Uniform','Random','Customized'};
set(hObject,'String',COM_GREYSCALE);

% --- Executes on button press in colorinfo_btn.
function colorinfo_btn_Callback(hObject, eventdata, handles)
% hObject    handle to colorinfo_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.proportion
if strcmp(handles.greyscaleChoice,'Uniform')
    D = uniform_grid(handles.greyscaleFig,handles.proportion);
    handles.colorinfoFig = partial_recolour(handles.greyscaleFig,handles.originFig,D);
    axes(handles.colorinfo_axes);
    imshow(handles.colorinfoFig);
elseif strcmp(handles.greyscaleChoice,'Random')
    D = random_grid(handles.greyscaleFig,handles.proportion);
    handles.colorinfoFig = partial_recolour(handles.greyscaleFig,handles.originFig,D);
    axes(handles.colorinfo_axes);
    imshow(handles.colorinfoFig);
end
guidata(hObject, handles);
    
    



function proportion_Callback(hObject, eventdata, handles)
% hObject    handle to proportion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.proportion = str2double(get(hObject,'String'));
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function proportion_CreateFcn(hObject, eventdata, handles)
% hObject    handle to proportion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

handles.proportion = str2double(get(hObject,'String'));
guidata(hObject, handles);

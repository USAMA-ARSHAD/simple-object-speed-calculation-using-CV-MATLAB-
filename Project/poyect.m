function varargout = poyect(varargin)
% POYECT MATLAB code for poyect.fig
%      POYECT, by itself, creates a new POYECT or raises the existing
%      singleton*.
%
%      H = POYECT returns the handle to a new POYECT or the handle to
%      the existing singleton*.
%
%      POYECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in POYECT.M with the given input arguments.
%
%      POYECT('Property','Value',...) creates a new POYECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before poyect_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to poyect_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help poyect

% Last Modified by GUIDE v2.5 01-Dec-2019 16:10:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @poyect_OpeningFcn, ...
                   'gui_OutputFcn',  @poyect_OutputFcn, ...
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


% --- Executes just before poyect is made visible.
function poyect_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to poyect (see VARARGIN)

% Choose default command line output for poyect
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes poyect wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = poyect_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    [filename, pathname] = uigetfile({'*.avi';'*.mp4'},'Select a video');
    myVideo = strcat(pathname, filename);
    [unique_labels_new,no_of_vehicles,num_of_images,movie,labelled] = Driver(myVideo);
    setappdata(0,'movie',movie);
    setappdata(0,'labell',labelled);
    unique_labels_new=arrayfun(@num2str,unique_labels_new,'un',0); % converting double to string
    set(handles.text3,'String',unique_labels_new);
    no_of_vehicles=arrayfun(@num2str,no_of_vehicles,'un',0); % converting double to string
    set(handles.text4,'String',no_of_vehicles);
    setappdata(0,'num_of_images',num_of_images);
    v= VideoReader(myVideo);
    v=read(v);
    %implay(v);
    
    

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
movie=getappdata(0,'movie');
num_of_images=getappdata(0,'num_of_images');
distance=getappdata(0,'distance');
label=getappdata(0,'label');
labelled = getappdata(0,'labell');
speed_in_cm=SpeedCalculation(movie,labelled,distance,label,num_of_images,20);
speed_in_cm=arrayfun(@num2str,speed_in_cm,'un',0); % converting double to string
set(handles.text7,'String',speed_in_cm);
%speed_in_cm=SpeedCalculation(movie,120,1,num_of_images,20);
implay(movie);


% --- Executes during object creation, after setting all properties.
function text3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function text4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(0,'distance',str2double(get(hObject,'String')));
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
setappdata(0,'label',str2double(get(hObject,'String')));
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


% --- Executes during object creation, after setting all properties.
function text7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

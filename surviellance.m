function varargout = surviellance(varargin)
% SURVIELLANCE M-file for surviellance.fig
%      SURVIELLANCE, by itself, creates a new SURVIELLANCE or raises the existing
%      singleton*.
%
%      H = SURVIELLANCE returns the handle to a new SURVIELLANCE or the handle to
%      the existing singleton*.
%
%      SURVIELLANCE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SURVIELLANCE.M with the given input arguments.
%
%      SURVIELLANCE('Property','Value',...) creates a new SURVIELLANCE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before surviellance_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to surviellance_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help surviellance

% Last Modified by GUIDE v2.5 18-Apr-2011 01:57:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @surviellance_OpeningFcn, ...
                   'gui_OutputFcn',  @surviellance_OutputFcn, ...
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


% --- Executes just before surviellance is made visible.
function surviellance_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to surviellance (see VARARGIN)
set(handles.uipanel1,'Visible','on');
set(handles.uipanel2,'Visible','off');


vid1=videoinput('winvideo',1,'YUY2_640x480');
%triggerconfig(vid1,'manual');
vid2=videoinput('winvideo',2,'YUY2_640x480')
%triggerconfig(vid2,'manual');
handles.vidobj1=vid1;
handles.vidobj2=vid2;
subplot(1,2,1)

vidres=get(handles.vidobj2,'VideoResolution');
nbands=get(handles.vidobj2,'NumberOfBands');
hImage=image(zeros(2*vidres(2),vidres(1),nbands));
preview(handles.vidobj2,hImage);

subplot(1,2,2)

vidres=get(handles.vidobj1,'VideoResolution');
nbands=get(handles.vidobj1,'NumberOfBands');
hImage=image(zeros(2*vidres(2),vidres(1),nbands));
preview(handles.vidobj1,hImage);
parport=digitalio('parallel','LPT1');
addline(parport,0:7,'out');
putvalue(parport,0) ;
% Choose default command line output for surviellance
handles.portobject=parport;
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes surviellance wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = surviellance_OutputFcn(hObject, eventdata, handles) 
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
parport=handles.portobject;
bvdata=logical([0 1 1 0 0 0 0 0]);
putvalue(parport,bvdata);
pause(0.2);
bvdata=logical([0 0 0 0 0 0 0 0]);
putvalue(parport,bvdata);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
parport=handles.portobject;
bvdata=logical([0 1 0 1 0 0 0 0]);
putvalue(parport,bvdata);
pause(0.2);
bvdata=logical([0 0 0 0 0 0 0 0]);
putvalue(parport,bvdata);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
parport=handles.portobject;
bvdata=logical([1 0 0 1 0 0 0 0]);
putvalue(parport,bvdata);
pause(0.2);
bvdata=logical([0 0 0 0 0 0 0 0]);
putvalue(parport,bvdata);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
parport=handles.portobject;
bvdata=logical([1 0 1 0 0 0 0 0]);
putvalue(parport,bvdata);
pause(0.2);
bvdata=logical([0 0 0 0 0 0 0 0]);
putvalue(parport,bvdata);


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel1,'Visible','on');
set(handles.uipanel2,'Visible','off');
guidata(hObject,handles);
% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel1,'Visible','off');
set(handles.uipanel2,'Visible','on');
guidata(hObject,handles);
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


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load net11.mat
destination=get(handles.edit1,'String');
Autonomous(net11,destination,handles);


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
closepreview
vid=handles.vidobj2;
vidres=get(vid,'VideoResolution');
nbands=get(vid,'NumberOfBands');
hImage=image(zeros(vidres(2),vidres(1),nbands));
preview(vid,hImage);

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
closepreview
vid=handles.vidobj1;
vidres=get(vid,'VideoResolution');
nbands=get(vid,'NumberOfBands');
hImage=image(zeros(vidres(2),vidres(1),nbands));
preview(vid,hImage);


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in abort.
function abort_Callback(hObject, eventdata, handles)
par=handles.portobject;
putvalue(par,0) ;
pause(30) ;
% hObject    handle to abort (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

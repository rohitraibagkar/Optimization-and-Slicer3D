function varargout = project_assignment_3(varargin)
% PROJECT_ASSIGNMENT_3 MATLAB code for project_assignment_3.fig
%      PROJECT_ASSIGNMENT_3, by itself, creates a new PROJECT_ASSIGNMENT_3 or raises the existing
%      singleton*.
%
%      H = PROJECT_ASSIGNMENT_3 returns the handle to a new PROJECT_ASSIGNMENT_3 or the handle to
%      the existing singleton*.
%
%      PROJECT_ASSIGNMENT_3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECT_ASSIGNMENT_3.M with the given input arguments.
%
%      PROJECT_ASSIGNMENT_3('Property','Value',...) creates a new PROJECT_ASSIGNMENT_3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before project_assignment_3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to project_assignment_3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help project_assignment_3

% Last Modified by GUIDE v2.5 09-Apr-2017 19:53:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @project_assignment_3_OpeningFcn, ...
                   'gui_OutputFcn',  @project_assignment_3_OutputFcn, ...
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


% --- Executes just before project_assignment_3 is made visible.
function project_assignment_3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to project_assignment_3 (see VARARGIN)

% Choose default command line output for project_assignment_3
handles.output = hObject;
global x y z q q2 M Base1 Base2 array_point_1 array_point_2; % Initiating global constants...
Base1 = eye(4); % Defining value of global constants...
Base2 = transl(1.25, 0, 0);    Base2(1:3, 1:3) = rotz(pi);
x = 0.452100000000000;  
y = -0.150050000000000;
z = 0.431800000000000;
q = [0 0 0 0 0 0];
q2 = [0 0 0 0 0 0];
M = [1 1 1 1 1 1];
array_point_1 = zeros(4,4);
array_point_2 = zeros(4,4);
handles.j(:,1:6) = 0;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes project_assignment_3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = project_assignment_3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in create_puma_560_clone.
function create_puma_560_clone_Callback(hObject, eventdata, handles)
% hObject    handle to create_puma_560_clone (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Base2;
%clear L;
deg = pi/180;

% joint angle limits from 
% A combined optimization method for solving the inverse kinematics problem...

% Defining links of Puma 560...

L(1) = Revolute('d', 0, 'a', 0, 'alpha', pi/2, ...
    'I', [0, 0.35, 0, 0, 0, 0], ...
    'r', [0, 0, 0], ...
    'm', 0, ...
    'Jm', 200e-6, ...
    'G', -62.6111, ...
    'B', 1.48e-3, ...
    'Tc', [0.395 -0.435], ...
    'qlim', [-160 160]*deg );

L(2) = Revolute('d', 0, 'a', 0.4318, 'alpha', 0, ...
    'I', [0.13, 0.524, 0.539, 0, 0, 0], ...
    'r', [-0.3638, 0.006, 0.2275], ...
    'm', 17.4, ...
    'Jm', 200e-6, ...
    'G', 107.815, ...
    'B', .817e-3, ...
    'Tc', [0.126 -0.071], ...
    'qlim', [-45 225]*deg );

L(3) = Revolute('d', 0.15005, 'a', 0.0203, 'alpha', -pi/2,  ...
    'I', [0.066, 0.086, 0.0125, 0, 0, 0], ...
    'r', [-0.0203, -0.0141, 0.070], ...
    'm', 4.8, ...
    'Jm', 200e-6, ...
    'G', -53.7063, ...
    'B', 1.38e-3, ...
    'Tc', [0.132, -0.105], ...
    'qlim', [-225 45]*deg );

L(4) = Revolute('d', 0.4318, 'a', 0, 'alpha', pi/2,  ...
    'I', [1.8e-3, 1.3e-3, 1.8e-3, 0, 0, 0], ...
    'r', [0, 0.019, 0], ...
    'm', 0.82, ...
    'Jm', 33e-6, ...
    'G', 76.0364, ...
    'B', 71.2e-6, ...
    'Tc', [11.2e-3, -16.9e-3], ...
    'qlim', [-110 170]*deg);

L(5) = Revolute('d', 0, 'a', 0, 'alpha', -pi/2,  ...
    'I', [0.3e-3, 0.4e-3, 0.3e-3, 0, 0, 0], ...
    'r', [0, 0, 0], ...
    'm', 0.34, ...
    'Jm', 33e-6, ...
    'G', 71.923, ...
    'B', 82.6e-6, ...
    'Tc', [9.26e-3, -14.5e-3], ...
    'qlim', [-100 100]*deg );


L(6) = Revolute('d', 0, 'a', 0, 'alpha', 0,  ...
    'I', [0.15e-3, 0.15e-3, 0.04e-3, 0, 0, 0], ...
    'r', [0, 0, 0.032], ...
    'm', 0.09, ...
    'Jm', 33e-6, ...
    'G', 76.686, ...
    'B', 36.7e-6, ...
    'Tc', [3.96e-3, -10.5e-3], ...
    'qlim', [-266 266]*deg );

% Creating first robot...

handles.p560 = SerialLink(L, 'name', 'Puma 560', ...
    'manufacturer', 'Unimation', 'ikine', 'puma', 'comment', 'viscous friction; params of 8/95');

% Creating second robot...

handles.p560_2 = SerialLink(L, 'name', 'Puma 560 : 2', ...
    'manufacturer', 'Unimation', 'ikine', 'puma', 'comment', 'viscous friction; params of 8/95');

Base2 = transl(1.25, 0, 0);    Base2(1:3, 1:3) = rotz(pi);
handles.p560_2.base = Base2; % Shifting second robot by base...
hold on;
% handles.p560.fkine(handles.j)
handles.p560.plot(handles.j); % Plotting robots...
handles.p560_2.plot(handles.j);
grid on;
grid minor;
hold off;
guidata(hObject, handles);

function puma560_1_joint_1_disp_Callback(hObject, eventdata, handles)
% hObject    handle to puma560_1_joint_1_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of puma560_1_joint_1_disp as text
%        str2double(get(hObject,'String')) returns contents of puma560_1_joint_1_disp as a double


% --- Executes during object creation, after setting all properties.
function puma560_1_joint_1_disp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to puma560_1_joint_1_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function puma560_1_joint_2_disp_Callback(hObject, eventdata, handles)
% hObject    handle to puma560_1_joint_2_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of puma560_1_joint_2_disp as text
%        str2double(get(hObject,'String')) returns contents of puma560_1_joint_2_disp as a double


% --- Executes during object creation, after setting all properties.
function puma560_1_joint_2_disp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to puma560_1_joint_2_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function puma560_1_joint_3_disp_Callback(hObject, eventdata, handles)
% hObject    handle to puma560_1_joint_3_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of puma560_1_joint_3_disp as text
%        str2double(get(hObject,'String')) returns contents of puma560_1_joint_3_disp as a double


% --- Executes during object creation, after setting all properties.
function puma560_1_joint_3_disp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to puma560_1_joint_3_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function puma560_1_joint_4_disp_Callback(hObject, eventdata, handles)
% hObject    handle to puma560_1_joint_4_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of puma560_1_joint_4_disp as text
%        str2double(get(hObject,'String')) returns contents of puma560_1_joint_4_disp as a double


% --- Executes during object creation, after setting all properties.
function puma560_1_joint_4_disp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to puma560_1_joint_4_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function puma560_1_joint_5_disp_Callback(hObject, eventdata, handles)
% hObject    handle to puma560_1_joint_5_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of puma560_1_joint_5_disp as text
%        str2double(get(hObject,'String')) returns contents of puma560_1_joint_5_disp as a double


% --- Executes during object creation, after setting all properties.
function puma560_1_joint_5_disp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to puma560_1_joint_5_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function puma560_1_joint_6_disp_Callback(hObject, eventdata, handles)
% hObject    handle to puma560_1_joint_6_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of puma560_1_joint_6_disp as text
%        str2double(get(hObject,'String')) returns contents of puma560_1_joint_6_disp as a double


% --- Executes during object creation, after setting all properties.
function puma560_1_joint_6_disp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to puma560_1_joint_6_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function puma560_2_x_coordinate_Callback(hObject, eventdata, handles)
% hObject    handle to puma560_2_x_coordinate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of puma560_2_x_coordinate as text
%        str2double(get(hObject,'String')) returns contents of puma560_2_x_coordinate as a double


% --- Executes during object creation, after setting all properties.
function puma560_2_x_coordinate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to puma560_2_x_coordinate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function puma560_2_y_coordinate_Callback(hObject, eventdata, handles)
% hObject    handle to puma560_2_y_coordinate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of puma560_2_y_coordinate as text
%        str2double(get(hObject,'String')) returns contents of puma560_2_y_coordinate as a double


% --- Executes during object creation, after setting all properties.
function puma560_2_y_coordinate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to puma560_2_y_coordinate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function puma560_2_z_coordinate_Callback(hObject, eventdata, handles)
% hObject    handle to puma560_2_z_coordinate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of puma560_2_z_coordinate as text
%        str2double(get(hObject,'String')) returns contents of puma560_2_z_coordinate as a double


% --- Executes during object creation, after setting all properties.
function puma560_2_z_coordinate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to puma560_2_z_coordinate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function puma560_1_x_coordinate_Callback(hObject, eventdata, handles)
% hObject    handle to puma560_1_x_coordinate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of puma560_1_x_coordinate as text
%        str2double(get(hObject,'String')) returns contents of puma560_1_x_coordinate as a double


% --- Executes during object creation, after setting all properties.
function puma560_1_x_coordinate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to puma560_1_x_coordinate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function puma560_1_y_coordinate_Callback(hObject, eventdata, handles)
% hObject    handle to puma560_1_y_coordinate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of puma560_1_y_coordinate as text
%        str2double(get(hObject,'String')) returns contents of puma560_1_y_coordinate as a double


% --- Executes during object creation, after setting all properties.
function puma560_1_y_coordinate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to puma560_1_y_coordinate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function puma560_1_z_coordinate_Callback(hObject, eventdata, handles)
% hObject    handle to puma560_1_z_coordinate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of puma560_1_z_coordinate as text
%        str2double(get(hObject,'String')) returns contents of puma560_1_z_coordinate as a double


% --- Executes during object creation, after setting all properties.
function puma560_1_z_coordinate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to puma560_1_z_coordinate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function puma560_2_joint_1_Callback(hObject, eventdata, handles)
% hObject    handle to puma560_2_joint_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.j(1) = get(hObject, 'Value'); % getting slider value and storing in first element of joint angle set array...
set(handles.puma560_2_joint_1_disp, 'String', num2str(handles.j(1))); % converting slider 1 value to string and setting it in callback variable
% of display for joint 1 to display current angle...
handles.p560_2.plot(handles.j); % plotting robot using new joint angles stored in handles variable..
handles.T = handles.p560_2.fkine([handles.j]); % making forward kinematics of joint angles and storing that transformation matrix
% into T in handles...
set(handles.puma560_2_x_coordinate, 'String', num2str(handles.T(1,4))); % Converting x-coordinate of position vector to string and setting it in 
% callback variable of display for x-coordinate...
set(handles.puma560_2_y_coordinate, 'String', num2str(handles.T(2,4))); % Converting y-coordinate of position vector to string and setting it in 
% callback variable of display for y-coordinate...
set(handles.puma560_2_z_coordinate, 'String', num2str(handles.T(3,4))); % Converting z-coordinate of position vector to string and setting it in 
% callback variable of display for z-coordinate...
% update handles structure
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function puma560_2_joint_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to puma560_2_joint_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function puma560_2_joint_2_Callback(hObject, eventdata, handles)
% hObject    handle to puma560_2_joint_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.j(2) = get(hObject, 'Value'); % getting slider value and storing in first element of joint angle set array...
set(handles.puma560_2_joint_2_disp, 'String', num2str(handles.j(2))); % converting slider 1 value to string and setting it in callback variable
% of display for joint 1 to display current angle...
handles.p560_2.plot(handles.j); % plotting robot using new joint angles stored in handles variable..
handles.T = handles.p560_2.fkine([handles.j]); % making forward kinematics of joint angles and storing that transformation matrix
% into T in handles...
set(handles.puma560_2_x_coordinate, 'String', num2str(handles.T(1,4))); % Converting x-coordinate of position vector to string and setting it in 
% callback variable of display for x-coordinate...
set(handles.puma560_2_y_coordinate, 'String', num2str(handles.T(2,4))); % Converting y-coordinate of position vector to string and setting it in 
% callback variable of display for y-coordinate...
set(handles.puma560_2_z_coordinate, 'String', num2str(handles.T(3,4))); % Converting z-coordinate of position vector to string and setting it in 
% callback variable of display for z-coordinate...
% update handles structure
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function puma560_2_joint_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to puma560_2_joint_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function puma560_2_joint_3_Callback(hObject, eventdata, handles)
% hObject    handle to puma560_2_joint_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.j(3) = get(hObject, 'Value'); % getting slider value and storing in first element of joint angle set array...
set(handles.puma560_2_joint_3_disp, 'String', num2str(handles.j(3))); % converting slider 1 value to string and setting it in callback variable
% of display for joint 1 to display current angle...
handles.p560_2.plot(handles.j); % plotting robot using new joint angles stored in handles variable..
handles.T = handles.p560_2.fkine([handles.j]); % making forward kinematics of joint angles and storing that transformation matrix
% into T in handles...
set(handles.puma560_2_x_coordinate, 'String', num2str(handles.T(1,4))); % Converting x-coordinate of position vector to string and setting it in 
% callback variable of display for x-coordinate...
set(handles.puma560_2_y_coordinate, 'String', num2str(handles.T(2,4))); % Converting y-coordinate of position vector to string and setting it in 
% callback variable of display for y-coordinate...
set(handles.puma560_2_z_coordinate, 'String', num2str(handles.T(3,4))); % Converting z-coordinate of position vector to string and setting it in 
% callback variable of display for z-coordinate...
% update handles structure
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function puma560_2_joint_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to puma560_2_joint_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function puma560_2_joint_4_Callback(hObject, eventdata, handles)
% hObject    handle to puma560_2_joint_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.j(4) = get(hObject, 'Value'); % getting slider value and storing in first element of joint angle set array...
set(handles.puma560_2_joint_4_disp, 'String', num2str(handles.j(4))); % converting slider 1 value to string and setting it in callback variable
% of display for joint 1 to display current angle...
handles.p560_2.plot(handles.j); % plotting robot using new joint angles stored in handles variable..
handles.T = handles.p560_2.fkine([handles.j]); % making forward kinematics of joint angles and storing that transformation matrix
% into T in handles...
set(handles.puma560_2_x_coordinate, 'String', num2str(handles.T(1,4))); % Converting x-coordinate of position vector to string and setting it in 
% callback variable of display for x-coordinate...
set(handles.puma560_2_y_coordinate, 'String', num2str(handles.T(2,4))); % Converting y-coordinate of position vector to string and setting it in 
% callback variable of display for y-coordinate...
set(handles.puma560_2_z_coordinate, 'String', num2str(handles.T(3,4))); % Converting z-coordinate of position vector to string and setting it in 
% callback variable of display for z-coordinate...
% update handles structure
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function puma560_2_joint_4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to puma560_2_joint_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function puma560_2_joint_5_Callback(hObject, eventdata, handles)
% hObject    handle to puma560_2_joint_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.j(5) = get(hObject, 'Value'); % getting slider value and storing in first element of joint angle set array...
set(handles.puma560_2_joint_5_disp, 'String', num2str(handles.j(5))); % converting slider 1 value to string and setting it in callback variable
% of display for joint 1 to display current angle...
handles.p560_2.plot(handles.j); % plotting robot using new joint angles stored in handles variable..
handles.T = handles.p560_2.fkine([handles.j]); % making forward kinematics of joint angles and storing that transformation matrix
% into T in handles...
set(handles.puma560_2_x_coordinate, 'String', num2str(handles.T(1,4))); % Converting x-coordinate of position vector to string and setting it in 
% callback variable of display for x-coordinate...
set(handles.puma560_2_y_coordinate, 'String', num2str(handles.T(2,4))); % Converting y-coordinate of position vector to string and setting it in 
% callback variable of display for y-coordinate...
set(handles.puma560_2_z_coordinate, 'String', num2str(handles.T(3,4))); % Converting z-coordinate of position vector to string and setting it in 
% callback variable of display for z-coordinate...
% update handles structure
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function puma560_2_joint_5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to puma560_2_joint_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function puma560_2_joint_6_Callback(hObject, eventdata, handles)
% hObject    handle to puma560_2_joint_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.j(6) = get(hObject, 'Value'); % getting slider value and storing in first element of joint angle set array...
set(handles.puma560_2_joint_6_disp, 'String', num2str(handles.j(6))); % converting slider 1 value to string and setting it in callback variable
% of display for joint 1 to display current angle...
handles.p560_2.plot(handles.j); % plotting robot using new joint angles stored in handles variable..
handles.T = handles.p560_2.fkine([handles.j]); % making forward kinematics of joint angles and storing that transformation matrix
% into T in handles...
set(handles.puma560_2_x_coordinate, 'String', num2str(handles.T(1,4))); % Converting x-coordinate of position vector to string and setting it in 
% callback variable of display for x-coordinate...
set(handles.puma560_2_y_coordinate, 'String', num2str(handles.T(2,4))); % Converting y-coordinate of position vector to string and setting it in 
% callback variable of display for y-coordinate...
set(handles.puma560_2_z_coordinate, 'String', num2str(handles.T(3,4))); % Converting z-coordinate of position vector to string and setting it in 
% callback variable of display for z-coordinate...
% update handles structure
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function puma560_2_joint_6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to puma560_2_joint_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function puma560_2_joint_1_disp_Callback(hObject, eventdata, handles)
% hObject    handle to puma560_2_joint_1_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of puma560_2_joint_1_disp as text
%        str2double(get(hObject,'String')) returns contents of puma560_2_joint_1_disp as a double


% --- Executes during object creation, after setting all properties.
function puma560_2_joint_1_disp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to puma560_2_joint_1_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function puma560_2_joint_2_disp_Callback(hObject, eventdata, handles)
% hObject    handle to puma560_2_joint_2_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of puma560_2_joint_2_disp as text
%        str2double(get(hObject,'String')) returns contents of puma560_2_joint_2_disp as a double


% --- Executes during object creation, after setting all properties.
function puma560_2_joint_2_disp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to puma560_2_joint_2_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function puma560_2_joint_3_disp_Callback(hObject, eventdata, handles)
% hObject    handle to puma560_2_joint_3_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of puma560_2_joint_3_disp as text
%        str2double(get(hObject,'String')) returns contents of puma560_2_joint_3_disp as a double


% --- Executes during object creation, after setting all properties.
function puma560_2_joint_3_disp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to puma560_2_joint_3_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function puma560_2_joint_4_disp_Callback(hObject, eventdata, handles)
% hObject    handle to puma560_2_joint_4_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of puma560_2_joint_4_disp as text
%        str2double(get(hObject,'String')) returns contents of puma560_2_joint_4_disp as a double


% --- Executes during object creation, after setting all properties.
function puma560_2_joint_4_disp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to puma560_2_joint_4_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function puma560_2_joint_5_disp_Callback(hObject, eventdata, handles)
% hObject    handle to puma560_2_joint_5_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of puma560_2_joint_5_disp as text
%        str2double(get(hObject,'String')) returns contents of puma560_2_joint_5_disp as a double


% --- Executes during object creation, after setting all properties.
function puma560_2_joint_5_disp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to puma560_2_joint_5_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function puma560_2_joint_6_disp_Callback(hObject, eventdata, handles)
% hObject    handle to puma560_2_joint_6_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of puma560_2_joint_6_disp as text
%        str2double(get(hObject,'String')) returns contents of puma560_2_joint_6_disp as a double


% --- Executes during object creation, after setting all properties.
function puma560_2_joint_6_disp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to puma560_2_joint_6_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in puma560_del_z_negative.
function puma560_del_z_negative_Callback(hObject, eventdata, handles)
% hObject    handle to puma560_del_z_negative (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x y z q M; % initiating global constants...
z = z - .010; % incrementing value of x by 10 mm...
T = transl(x, y, z); % creaating transformation matrix with required position vector...
q = handles.p560.ikine(T, q, M,  'pinv', 'alpha', .5); % getting joint angles...
handles.p560.plot(q); % plotting robot MyBot with generated joint angles...
set(handles.puma560_1_joint_1_disp, 'String', num2str(q(1))); % converting angle 1 value to string and setting it in callback variable
% of display for joint 1 to display current angle...
set(handles.puma560_1_joint_2_disp, 'String', num2str(q(2))); % converting angle 2 value to string and setting it in callback variable
% of display for joint 2 to display current angle...
set(handles.puma560_1_joint_3_disp, 'String', num2str(q(3))); % converting angle 3 value to string and setting it in callback variable
% of display for joint 3 to display current angle...
set(handles.puma560_1_joint_4_disp, 'String', num2str(q(4))); % converting angle 4 value to string and setting it in callback variable
% of display for joint 4 to display current angle...
set(handles.puma560_1_joint_5_disp, 'String', num2str(q(5))); % converting angle 5 value to string and setting it in callback variable
% of display for joint 5 to display current angle...
set(handles.puma560_1_joint_6_disp, 'String', num2str(q(6))); % converting angle 6 value to string and setting it in callback variable
% of display for joint 6 to display current angle...
set(handles.puma560_1_x_coordinate, 'String', num2str(x)); % Displaying x-coordinate of position vector to string and setting it in 
% callback variable of display for x-coordinate...
set(handles.puma560_1_y_coordinate, 'String', num2str(y)); % Displaying y-coordinate of position vector to string and setting it in 
% callback variable of display for y-coordinate...
set(handles.puma560_1_z_coordinate, 'String', num2str(z)); % Displaying z-coordinate of position vector to string and setting it in 
% callback variable of display for z-coordinate...
clc
guidata(hObject, handles); % Update handles structure...


% --- Executes on button press in puma560_del_z_positive.
function puma560_del_z_positive_Callback(hObject, eventdata, handles)
% hObject    handle to puma560_del_z_positive (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x y z q M; % initiating global constants...
z = z + .010; % incrementing value of x by 10 mm...
T = transl(x, y, z); % creaating transformation matrix with required position vector...
q = handles.p560.ikine(T, q, M,  'pinv', 'alpha', .5); % getting joint angles...
handles.p560.plot(q); % plotting robot MyBot with generated joint angles...
set(handles.puma560_1_joint_1_disp, 'String', num2str(q(1))); % converting angle 1 value to string and setting it in callback variable
% of display for joint 1 to display current angle...
set(handles.puma560_1_joint_2_disp, 'String', num2str(q(2))); % converting angle 2 value to string and setting it in callback variable
% of display for joint 2 to display current angle...
set(handles.puma560_1_joint_3_disp, 'String', num2str(q(3))); % converting angle 3 value to string and setting it in callback variable
% of display for joint 3 to display current angle...
set(handles.puma560_1_joint_4_disp, 'String', num2str(q(4))); % converting angle 4 value to string and setting it in callback variable
% of display for joint 4 to display current angle...
set(handles.puma560_1_joint_5_disp, 'String', num2str(q(5))); % converting angle 5 value to string and setting it in callback variable
% of display for joint 5 to display current angle...
set(handles.puma560_1_joint_6_disp, 'String', num2str(q(6))); % converting angle 6 value to string and setting it in callback variable
% of display for joint 6 to display current angle...
set(handles.puma560_1_x_coordinate, 'String', num2str(x)); % Displaying x-coordinate of position vector to string and setting it in 
% callback variable of display for x-coordinate...
set(handles.puma560_1_y_coordinate, 'String', num2str(y)); % Displaying y-coordinate of position vector to string and setting it in 
% callback variable of display for y-coordinate...
set(handles.puma560_1_z_coordinate, 'String', num2str(z)); % Displaying z-coordinate of position vector to string and setting it in 
% callback variable of display for z-coordinate...
clc
guidata(hObject, handles); % Update handles structure...


% --- Executes on button press in puma560_del_y_negative.
function puma560_del_y_negative_Callback(hObject, eventdata, handles)
% hObject    handle to puma560_del_y_negative (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x y z q M; % initiating global constants...
y = y - .010; % incrementing value of x by 10 mm...
T = transl(x, y, z); % creaating transformation matrix with required position vector...
q = handles.p560.ikine(T, q, M,  'pinv', 'alpha', .5); % getting joint angles...
handles.p560.plot(q); % plotting robot MyBot with generated joint angles...
set(handles.puma560_1_joint_1_disp, 'String', num2str(q(1))); % converting angle 1 value to string and setting it in callback variable
% of display for joint 1 to display current angle...
set(handles.puma560_1_joint_2_disp, 'String', num2str(q(2))); % converting angle 2 value to string and setting it in callback variable
% of display for joint 2 to display current angle...
set(handles.puma560_1_joint_3_disp, 'String', num2str(q(3))); % converting angle 3 value to string and setting it in callback variable
% of display for joint 3 to display current angle...
set(handles.puma560_1_joint_4_disp, 'String', num2str(q(4))); % converting angle 4 value to string and setting it in callback variable
% of display for joint 4 to display current angle...
set(handles.puma560_1_joint_5_disp, 'String', num2str(q(5))); % converting angle 5 value to string and setting it in callback variable
% of display for joint 5 to display current angle...
set(handles.puma560_1_joint_6_disp, 'String', num2str(q(6))); % converting angle 6 value to string and setting it in callback variable
% of display for joint 6 to display current angle...
set(handles.puma560_1_x_coordinate, 'String', num2str(x)); % Displaying x-coordinate of position vector to string and setting it in 
% callback variable of display for x-coordinate...
set(handles.puma560_1_y_coordinate, 'String', num2str(y)); % Displaying y-coordinate of position vector to string and setting it in 
% callback variable of display for y-coordinate...
set(handles.puma560_1_z_coordinate, 'String', num2str(z)); % Displaying z-coordinate of position vector to string and setting it in 
% callback variable of display for z-coordinate...
clc
guidata(hObject, handles); % Update handles structure...


% --- Executes on button press in puma560_del_y_positive.
function puma560_del_y_positive_Callback(hObject, eventdata, handles)
% hObject    handle to puma560_del_y_positive (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x y z q M; % initiating global constants...
y = y + .010; % incrementing value of x by 10 mm...
T = transl(x, y, z); % creaating transformation matrix with required position vector...
q = handles.p560.ikine(T, q, M,  'pinv', 'alpha', .5); % getting joint angles...
handles.p560.plot(q); % plotting robot MyBot with generated joint angles...
set(handles.puma560_1_joint_1_disp, 'String', num2str(q(1))); % converting angle 1 value to string and setting it in callback variable
% of display for joint 1 to display current angle...
set(handles.puma560_1_joint_2_disp, 'String', num2str(q(2))); % converting angle 2 value to string and setting it in callback variable
% of display for joint 2 to display current angle...
set(handles.puma560_1_joint_3_disp, 'String', num2str(q(3))); % converting angle 3 value to string and setting it in callback variable
% of display for joint 3 to display current angle...
set(handles.puma560_1_joint_4_disp, 'String', num2str(q(4))); % converting angle 4 value to string and setting it in callback variable
% of display for joint 4 to display current angle...
set(handles.puma560_1_joint_5_disp, 'String', num2str(q(5))); % converting angle 5 value to string and setting it in callback variable
% of display for joint 5 to display current angle...
set(handles.puma560_1_joint_6_disp, 'String', num2str(q(6))); % converting angle 6 value to string and setting it in callback variable
% of display for joint 6 to display current angle...
set(handles.puma560_1_x_coordinate, 'String', num2str(x)); % Displaying x-coordinate of position vector to string and setting it in 
% callback variable of display for x-coordinate...
set(handles.puma560_1_y_coordinate, 'String', num2str(y)); % Displaying y-coordinate of position vector to string and setting it in 
% callback variable of display for y-coordinate...
set(handles.puma560_1_z_coordinate, 'String', num2str(z)); % Displaying z-coordinate of position vector to string and setting it in 
% callback variable of display for z-coordinate...
clc
guidata(hObject, handles); % Update handles structure...


% --- Executes on button press in puma560_del_x_negative.
function puma560_del_x_negative_Callback(hObject, eventdata, handles)
% hObject    handle to puma560_del_x_negative (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x y z q M; % initiating global constants...
x = x - .010; % incrementing value of x by 10 mm...
T = transl(x, y, z); % creaating transformation matrix with required position vector...
q = handles.p560.ikine(T, q, M,  'pinv', 'alpha', .5); % getting joint angles...
handles.p560.plot(q); % plotting robot MyBot with generated joint angles...
set(handles.puma560_1_joint_1_disp, 'String', num2str(q(1))); % converting angle 1 value to string and setting it in callback variable
% of display for joint 1 to display current angle...
set(handles.puma560_1_joint_2_disp, 'String', num2str(q(2))); % converting angle 2 value to string and setting it in callback variable
% of display for joint 2 to display current angle...
set(handles.puma560_1_joint_3_disp, 'String', num2str(q(3))); % converting angle 3 value to string and setting it in callback variable
% of display for joint 3 to display current angle...
set(handles.puma560_1_joint_4_disp, 'String', num2str(q(4))); % converting angle 4 value to string and setting it in callback variable
% of display for joint 4 to display current angle...
set(handles.puma560_1_joint_5_disp, 'String', num2str(q(5))); % converting angle 5 value to string and setting it in callback variable
% of display for joint 5 to display current angle...
set(handles.puma560_1_joint_6_disp, 'String', num2str(q(6))); % converting angle 6 value to string and setting it in callback variable
% of display for joint 6 to display current angle...
set(handles.puma560_1_x_coordinate, 'String', num2str(x)); % Displaying x-coordinate of position vector to string and setting it in 
% callback variable of display for x-coordinate...
set(handles.puma560_1_y_coordinate, 'String', num2str(y)); % Displaying y-coordinate of position vector to string and setting it in 
% callback variable of display for y-coordinate...
set(handles.puma560_1_z_coordinate, 'String', num2str(z)); % Displaying z-coordinate of position vector to string and setting it in 
% callback variable of display for z-coordinate...
clc
guidata(hObject, handles); % Update handles structure...


% --- Executes on button press in puma560_del_x_positive.
function puma560_del_x_positive_Callback(hObject, eventdata, handles)
% hObject    handle to puma560_del_x_positive (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x y z q M; % initiating global constants...
x = x + .010; % incrementing value of x by 10 mm...
T = transl(x, y, z); % creaating transformation matrix with required position vector...
q = handles.p560.ikine(T, q, M,  'pinv', 'alpha', .5); % getting joint angles...
handles.p560.plot(q); % plotting robot MyBot with generated joint angles...
set(handles.puma560_1_joint_1_disp, 'String', num2str(q(1))); % converting angle 1 value to string and setting it in callback variable
% of display for joint 1 to display current angle...
set(handles.puma560_1_joint_2_disp, 'String', num2str(q(2))); % converting angle 2 value to string and setting it in callback variable
% of display for joint 2 to display current angle...
set(handles.puma560_1_joint_3_disp, 'String', num2str(q(3))); % converting angle 3 value to string and setting it in callback variable
% of display for joint 3 to display current angle...
set(handles.puma560_1_joint_4_disp, 'String', num2str(q(4))); % converting angle 4 value to string and setting it in callback variable
% of display for joint 4 to display current angle...
set(handles.puma560_1_joint_5_disp, 'String', num2str(q(5))); % converting angle 5 value to string and setting it in callback variable
% of display for joint 5 to display current angle...
set(handles.puma560_1_joint_6_disp, 'String', num2str(q(6))); % converting angle 6 value to string and setting it in callback variable
% of display for joint 6 to display current angle...
set(handles.puma560_1_x_coordinate, 'String', num2str(x)); % Displaying x-coordinate of position vector to string and setting it in 
% callback variable of display for x-coordinate...
set(handles.puma560_1_y_coordinate, 'String', num2str(y)); % Displaying y-coordinate of position vector to string and setting it in 
% callback variable of display for y-coordinate...
set(handles.puma560_1_z_coordinate, 'String', num2str(z)); % Displaying z-coordinate of position vector to string and setting it in 
% callback variable of display for z-coordinate...
clc
guidata(hObject, handles); % Update handles structure...


% --- Executes on selection change in select_point.
function select_point_Callback(hObject, eventdata, handles)
% hObject    handle to select_point (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns select_point contents as cell array
%        contents{get(hObject,'Value')} returns selected item from select_point
global q q2 M Base1 Base2 array_point_1 array_point_2;
contents = cellstr(get(hObject,'String'));% returns select_point contents as cell array
contents{get(hObject,'Value')};% returns selected item from select_point

% This program will plot robots at points, where their EE will be touching
% and will record that point. These points will be stored in an array. This
% array will be used to compute the error between computed transformation
% matrix and actual transformation matrix between bases.

switch contents{get(hObject,'Value')};
    case 'Select Point';
        disp('Please select point...');
        
    case 'Point 1';
        T = transl(.625, -.25, .25);
        q = handles.p560.ikine(T, q, M,  'pinv', 'alpha', .5); % getting joint angles...
        q2 = handles.p560_2.ikine(T, q2, M,  'pinv', 'alpha', .5); % getting joint angles...
        ee_pos_1 = inv(Base1)*handles.p560.fkine(q); % Defining EE of robot 1 w.r.t its own base...
        list_1 = sprintf('%f \t %f \t %f', ee_pos_1(1,4), ee_pos_1(2,4), ee_pos_1(3,4)); % Showing point in UI...
        set(handles.point_1_1, 'String', list_1); % Showing point in UI...
        ee_pos_2 = inv(Base2)*handles.p560_2.fkine(q2); % % Defining EE of robot 2 w.r.t its own base...
        list_2 = sprintf('%f \t %f \t %f', ee_pos_2(1,4), ee_pos_2(2,4), ee_pos_2(3,4));
        set(handles.point_2_1, 'String', list_2);
        if array_point_1(:,:,1) == zeros(4,4) & array_point_2(:,:,1) == zeros(4,4);
            array_point_1 = cat(3, ee_pos_1); % Creating array...
            array_point_2 = cat(3, ee_pos_2); % Creating array...
        else
            array_point_1 = cat(3, array_point_1, ee_pos_1); % Creating array...
            array_point_2 = cat(3, array_point_2, ee_pos_2); % Creating array...
        end
        T1 = handles.p560.fkine(q);
        T2 = handles.p560_2.fkine(q2);
        handles.p560.plot(q);
        handles.p560_2.plot(q2);
        set(handles.puma560_1_x_coordinate, 'String', num2str(T1(1,4))); % Displaying x-coordinate of position vector to string and setting it in
        % callback variable of display for x-coordinate...
        set(handles.puma560_1_y_coordinate, 'String', num2str(T1(2,4))); % Displaying y-coordinate of position vector to string and setting it in
        % callback variable of display for y-coordinate...
        set(handles.puma560_1_z_coordinate, 'String', num2str(T1(3,4))); % Displaying z-coordinate of position vector to string and setting it in
        % callback variable of display for z-coordinate...
        set(handles.puma560_2_x_coordinate, 'String', num2str(T2(1,4))); % Converting x-coordinate of position vector to string and setting it in
        % callback variable of display for x-coordinate...
        set(handles.puma560_2_y_coordinate, 'String', num2str(T2(2,4))); % Converting y-coordinate of position vector to string and setting it in
        % callback variable of display for y-coordinate...
        set(handles.puma560_2_z_coordinate, 'String', num2str(T2(3,4))); % Converting z-coordinate of position vector to string and setting it in
        % callback variable of display for z-coordinate...
        clc;
        disp('Point 1 is selected...');
        
    case 'Point 2';
        T = transl(.625, -.25, 0);
        q = handles.p560.ikine(T, q, M,  'pinv', 'alpha', .5); % getting joint angles...
        q2 = handles.p560_2.ikine(T, q2, M,  'pinv', 'alpha', .5); % getting joint angles...
        ee_pos_1 = inv(Base1)*handles.p560.fkine(q); % Defining EE of robot 1 w.r.t its own base...
        list_1 = sprintf('%f \t %f \t %f', ee_pos_1(1,4), ee_pos_1(2,4), ee_pos_1(3,4)); % Showing point in UI...
        set(handles.point_1_2, 'String', list_1); % Showing point in UI...
        ee_pos_2 = inv(Base2)*handles.p560_2.fkine(q2); % Defining EE of robot 2 w.r.t its own base...
        list_2 = sprintf('%f \t %f \t %f', ee_pos_2(1,4), ee_pos_2(2,4), ee_pos_2(3,4)); % Showing point in UI...
        set(handles.point_2_2, 'String', list_2); % Showing point in UI...
        if array_point_1(:,:,1) == zeros(4,4) & array_point_2(:,:,1) == zeros(4,4);
            array_point_1 = cat(3, ee_pos_1); % Creating array...
            array_point_2 = cat(3, ee_pos_2); % Creating array...
        else
            array_point_1 = cat(3, array_point_1, ee_pos_1); % Creating array...
            array_point_2 = cat(3, array_point_2, ee_pos_2); % Creating array...
        end
        T1 = handles.p560.fkine(q);
        T2 = handles.p560_2.fkine(q2);
        handles.p560.plot(q);
        handles.p560_2.plot(q2);
        set(handles.puma560_1_x_coordinate, 'String', num2str(T1(1,4))); % Displaying x-coordinate of position vector to string and setting it in
        % callback variable of display for x-coordinate...
        set(handles.puma560_1_y_coordinate, 'String', num2str(T1(2,4))); % Displaying y-coordinate of position vector to string and setting it in
        % callback variable of display for y-coordinate...
        set(handles.puma560_1_z_coordinate, 'String', num2str(T1(3,4))); % Displaying z-coordinate of position vector to string and setting it in
        % callback variable of display for z-coordinate...
        set(handles.puma560_2_x_coordinate, 'String', num2str(T2(1,4))); % Converting x-coordinate of position vector to string and setting it in
        % callback variable of display for x-coordinate...
        set(handles.puma560_2_y_coordinate, 'String', num2str(T2(2,4))); % Converting y-coordinate of position vector to string and setting it in
        % callback variable of display for y-coordinate...
        set(handles.puma560_2_z_coordinate, 'String', num2str(T2(3,4))); % Converting z-coordinate of position vector to string and setting it in
        % callback variable of display for z-coordinate...
        clc;
        disp('Point 2 is selected...');
        
    case 'Point 3';
        T = transl(.625, -.25, -.25);
        q = handles.p560.ikine(T, q, M,  'pinv', 'alpha', .5); % getting joint angles...
        q2 = handles.p560_2.ikine(T, q2, M,  'pinv', 'alpha', .5); % getting joint angles...
        ee_pos_1 = inv(Base1)*handles.p560.fkine(q); % Defining EE of robot 1 w.r.t its own base...
        list_1 = sprintf('%f \t %f \t %f', ee_pos_1(1,4), ee_pos_1(2,4), ee_pos_1(3,4)); % Showing point in UI...
        set(handles.point_1_3, 'String', list_1); % Showing point in UI...
        ee_pos_2 = inv(Base2)*handles.p560_2.fkine(q2); % Defining EE of robot 2 w.r.t its own base...
        list_2 = sprintf('%f \t %f \t %f', ee_pos_2(1,4), ee_pos_2(2,4), ee_pos_2(3,4)); % Showing point in UI...
        set(handles.point_2_3, 'String', list_2); % Showing point in UI...
        if array_point_1(:,:,1) == zeros(4,4) & array_point_2(:,:,1) == zeros(4,4);
            array_point_1 = cat(3, ee_pos_1); % Creating array...
            array_point_2 = cat(3, ee_pos_2); % Creating array...
        else
            array_point_1 = cat(3, array_point_1, ee_pos_1); % Creating array...
            array_point_2 = cat(3, array_point_2, ee_pos_2); % Creating array...
        end
        T1 = handles.p560.fkine(q);
        T2 = handles.p560_2.fkine(q2);
        handles.p560.plot(q);
        handles.p560_2.plot(q2);
        set(handles.puma560_1_x_coordinate, 'String', num2str(T1(1,4))); % Displaying x-coordinate of position vector to string and setting it in
        % callback variable of display for x-coordinate...
        set(handles.puma560_1_y_coordinate, 'String', num2str(T1(2,4))); % Displaying y-coordinate of position vector to string and setting it in
        % callback variable of display for y-coordinate...
        set(handles.puma560_1_z_coordinate, 'String', num2str(T1(3,4))); % Displaying z-coordinate of position vector to string and setting it in
        % callback variable of display for z-coordinate...
        set(handles.puma560_2_x_coordinate, 'String', num2str(T2(1,4))); % Converting x-coordinate of position vector to string and setting it in
        % callback variable of display for x-coordinate...
        set(handles.puma560_2_y_coordinate, 'String', num2str(T2(2,4))); % Converting y-coordinate of position vector to string and setting it in
        % callback variable of display for y-coordinate...
        set(handles.puma560_2_z_coordinate, 'String', num2str(T2(3,4))); % Converting z-coordinate of position vector to string and setting it in
        % callback variable of display for z-coordinate...
        clc;
        disp('Point 3 is selected...');
        
    case 'Point 4';
        T = transl(.625, 0, .25);
        q = handles.p560.ikine(T, q, M,  'pinv', 'alpha', .5); % getting joint angles...
        q2 = handles.p560_2.ikine(T, q2, M,  'pinv', 'alpha', .5); % getting joint angles...
        ee_pos_1 = inv(Base1)*handles.p560.fkine(q); % Defining EE of robot 1 w.r.t its own base...
        list_1 = sprintf('%f \t %f \t %f', ee_pos_1(1,4), ee_pos_1(2,4), ee_pos_1(3,4)); % Showing point in UI...
        set(handles.point_1_4, 'String', list_1); % Showing point in UI...
        ee_pos_2 = inv(Base2)*handles.p560_2.fkine(q2); % Defining EE of robot 2 w.r.t its own base...
        list_2 = sprintf('%f \t %f \t %f', ee_pos_2(1,4), ee_pos_2(2,4), ee_pos_2(3,4)); % Showing point in UI...
        set(handles.point_2_4, 'String', list_2); % Showing point in UI...
        if array_point_1(:,:,1) == zeros(4,4) & array_point_2(:,:,1) == zeros(4,4);
            array_point_1 = cat(3, ee_pos_1); % Creating array...
            array_point_2 = cat(3, ee_pos_2); % Creating array...
        else
            array_point_1 = cat(3, array_point_1, ee_pos_1); % Creating array...
            array_point_2 = cat(3, array_point_2, ee_pos_2); % Creating array...
        end
        T1 = handles.p560.fkine(q);
        T2 = handles.p560_2.fkine(q2);
        handles.p560.plot(q);
        handles.p560_2.plot(q2);
        set(handles.puma560_1_x_coordinate, 'String', num2str(T1(1,4))); % Displaying x-coordinate of position vector to string and setting it in
        % callback variable of display for x-coordinate...
        set(handles.puma560_1_y_coordinate, 'String', num2str(T1(2,4))); % Displaying y-coordinate of position vector to string and setting it in
        % callback variable of display for y-coordinate...
        set(handles.puma560_1_z_coordinate, 'String', num2str(T1(3,4))); % Displaying z-coordinate of position vector to string and setting it in
        % callback variable of display for z-coordinate...
        set(handles.puma560_2_x_coordinate, 'String', num2str(T2(1,4))); % Converting x-coordinate of position vector to string and setting it in
        % callback variable of display for x-coordinate...
        set(handles.puma560_2_y_coordinate, 'String', num2str(T2(2,4))); % Converting y-coordinate of position vector to string and setting it in
        % callback variable of display for y-coordinate...
        set(handles.puma560_2_z_coordinate, 'String', num2str(T2(3,4))); % Converting z-coordinate of position vector to string and setting it in
        % callback variable of display for z-coordinate...
        clc;
        disp('Point 4 is selected...');
        
    case 'Point 5';
        T = transl(.625, 0, 0);
        q = handles.p560.ikine(T, q, M,  'pinv', 'alpha', .5); % getting joint angles...
        q2 = handles.p560_2.ikine(T, q2, M,  'pinv', 'alpha', .5); % getting joint angles...
        T1 = handles.p560.fkine(q);
        T2 = handles.p560_2.fkine(q2);
        ee_pos_1 = inv(Base1)*handles.p560.fkine(q); % Defining EE of robot 1 w.r.t its own base...
        list_1 = sprintf('%f \t %f \t %f', ee_pos_1(1,4), ee_pos_1(2,4), ee_pos_1(3,4)); % Showing point in UI...
        set(handles.point_1_5, 'String', list_1); % Showing point in UI...
        ee_pos_2 = inv(Base2)*handles.p560_2.fkine(q2); % Defining EE of robot 2 w.r.t its own base...
        list_2 = sprintf('%f \t %f \t %f', ee_pos_2(1,4), ee_pos_2(2,4), ee_pos_2(3,4)); % Showing point in UI...
        set(handles.point_2_5, 'String', list_2); % Showing point in UI...
        if array_point_1(:,:,1) == zeros(4,4) & array_point_2(:,:,1) == zeros(4,4);
            array_point_1 = cat(3, ee_pos_1); % Creating array...
            array_point_2 = cat(3, ee_pos_2); % Creating array...
        else
            array_point_1 = cat(3, array_point_1, ee_pos_1); % Creating array...
            array_point_2 = cat(3, array_point_2, ee_pos_2); % Creating array...
        end
        T1 = handles.p560.fkine(q);
        T2 = handles.p560_2.fkine(q2);
        handles.p560.plot(q);
        handles.p560_2.plot(q2);
        set(handles.puma560_1_x_coordinate, 'String', num2str(T1(1,4))); % Displaying x-coordinate of position vector to string and setting it in
        % callback variable of display for x-coordinate...
        set(handles.puma560_1_y_coordinate, 'String', num2str(T1(2,4))); % Displaying y-coordinate of position vector to string and setting it in
        % callback variable of display for y-coordinate...
        set(handles.puma560_1_z_coordinate, 'String', num2str(T1(3,4))); % Displaying z-coordinate of position vector to string and setting it in
        % callback variable of display for z-coordinate...
        set(handles.puma560_2_x_coordinate, 'String', num2str(T2(1,4))); % Converting x-coordinate of position vector to string and setting it in
        % callback variable of display for x-coordinate...
        set(handles.puma560_2_y_coordinate, 'String', num2str(T2(2,4))); % Converting y-coordinate of position vector to string and setting it in
        % callback variable of display for y-coordinate...
        set(handles.puma560_2_z_coordinate, 'String', num2str(T2(3,4))); % Converting z-coordinate of position vector to string and setting it in
        % callback variable of display for z-coordinate...
        clc;
        disp('Point 5 is selected...');
        
    case 'Point 6';
        T = transl(.625, 0, -.25);
        q = handles.p560.ikine(T, q, M,  'pinv', 'alpha', .5); % getting joint angles...
        q2 = handles.p560_2.ikine(T, q2, M,  'pinv', 'alpha', .5); % getting joint angles...
        T1 = handles.p560.fkine(q);
        T2 = handles.p560_2.fkine(q2);
        ee_pos_1 = inv(Base1)*handles.p560.fkine(q); % Defining EE of robot 1 w.r.t its own base...
        list_1 = sprintf('%f \t %f \t %f', ee_pos_1(1,4), ee_pos_1(2,4), ee_pos_1(3,4)); % Showing point in UI...
        set(handles.point_1_6, 'String', list_1); % Showing point in UI...
        ee_pos_2 = inv(Base2)*handles.p560_2.fkine(q2); % Defining EE of robot 2 w.r.t its own base...
        list_2 = sprintf('%f \t %f \t %f', ee_pos_2(1,4), ee_pos_2(2,4), ee_pos_2(3,4)); % Showing point in UI...
        set(handles.point_2_6, 'String', list_2); % Showing point in UI...
        if array_point_1(:,:,1) == zeros(4,4) & array_point_2(:,:,1) == zeros(4,4);
            array_point_1 = cat(3, ee_pos_1); % Creating array...
            array_point_2 = cat(3, ee_pos_2); % Creating array...
        else
            array_point_1 = cat(3, array_point_1, ee_pos_1); % Creating array...
            array_point_2 = cat(3, array_point_2, ee_pos_2); % Creating array...
        end
        T1 = handles.p560.fkine(q);
        T2 = handles.p560_2.fkine(q2);
        handles.p560.plot(q);
        handles.p560_2.plot(q2);
        set(handles.puma560_1_x_coordinate, 'String', num2str(T1(1,4))); % Displaying x-coordinate of position vector to string and setting it in
        % callback variable of display for x-coordinate...
        set(handles.puma560_1_y_coordinate, 'String', num2str(T1(2,4))); % Displaying y-coordinate of position vector to string and setting it in
        % callback variable of display for y-coordinate...
        set(handles.puma560_1_z_coordinate, 'String', num2str(T1(3,4))); % Displaying z-coordinate of position vector to string and setting it in
        % callback variable of display for z-coordinate...
        set(handles.puma560_2_x_coordinate, 'String', num2str(T2(1,4))); % Converting x-coordinate of position vector to string and setting it in
        % callback variable of display for x-coordinate...
        set(handles.puma560_2_y_coordinate, 'String', num2str(T2(2,4))); % Converting y-coordinate of position vector to string and setting it in
        % callback variable of display for y-coordinate...
        set(handles.puma560_2_z_coordinate, 'String', num2str(T2(3,4))); % Converting z-coordinate of position vector to string and setting it in
        % callback variable of display for z-coordinate...
        clc;
        disp('Point 6 is selected...');
        
    case 'Point 7';
        T = transl(.625, .25, .25);
        q = handles.p560.ikine(T, q, M,  'pinv', 'alpha', .5); % getting joint angles...
        q2 = handles.p560_2.ikine(T, q2, M,  'pinv', 'alpha', .5); % getting joint angles...
        T1 = handles.p560.fkine(q);
        T2 = handles.p560_2.fkine(q2);
        ee_pos_1 = inv(Base1)*handles.p560.fkine(q); % Defining EE of robot 1 w.r.t its own base...
        list_1 = sprintf('%f \t %f \t %f', ee_pos_1(1,4), ee_pos_1(2,4), ee_pos_1(3,4)); % Showing point in UI...
        set(handles.point_1_7, 'String', list_1); % Showing point in UI...
        ee_pos_2 = inv(Base2)*handles.p560_2.fkine(q2); % Defining EE of robot 2 w.r.t its own base...
        list_2 = sprintf('%f \t %f \t %f', ee_pos_2(1,4), ee_pos_2(2,4), ee_pos_2(3,4)); % Showing point in UI...
        set(handles.point_2_7, 'String', list_2); % Showing point in UI...
        if array_point_1(:,:,1) == zeros(4,4) & array_point_2(:,:,1) == zeros(4,4);
            array_point_1 = cat(3, ee_pos_1); % Creating array...
            array_point_2 = cat(3, ee_pos_2); % Creating array...
        else
            array_point_1 = cat(3, array_point_1, ee_pos_1); % Creating array...
            array_point_2 = cat(3, array_point_2, ee_pos_2); % Creating array...
        end
        T1 = handles.p560.fkine(q);
        T2 = handles.p560_2.fkine(q2);
        handles.p560.plot(q);
        handles.p560_2.plot(q2);
        set(handles.puma560_1_x_coordinate, 'String', num2str(T1(1,4))); % Displaying x-coordinate of position vector to string and setting it in
        % callback variable of display for x-coordinate...
        set(handles.puma560_1_y_coordinate, 'String', num2str(T1(2,4))); % Displaying y-coordinate of position vector to string and setting it in
        % callback variable of display for y-coordinate...
        set(handles.puma560_1_z_coordinate, 'String', num2str(T1(3,4))); % Displaying z-coordinate of position vector to string and setting it in
        % callback variable of display for z-coordinate...
        set(handles.puma560_2_x_coordinate, 'String', num2str(T2(1,4))); % Converting x-coordinate of position vector to string and setting it in
        % callback variable of display for x-coordinate...
        set(handles.puma560_2_y_coordinate, 'String', num2str(T2(2,4))); % Converting y-coordinate of position vector to string and setting it in
        % callback variable of display for y-coordinate...
        set(handles.puma560_2_z_coordinate, 'String', num2str(T2(3,4))); % Converting z-coordinate of position vector to string and setting it in
        % callback variable of display for z-coordinate...
        clc;
        disp('Point 7 is selected...');
        
    case 'Point 8';
        T = transl(.625, .25, 0);
        q = handles.p560.ikine(T, q, M,  'pinv', 'alpha', .5); % getting joint angles...
        q2 = handles.p560_2.ikine(T, q2, M,  'pinv', 'alpha', .5); % getting joint angles...
        T1 = handles.p560.fkine(q);
        T2 = handles.p560_2.fkine(q2);
        ee_pos_1 = inv(Base1)*handles.p560.fkine(q); % Defining EE of robot 1 w.r.t its own base...
        list_1 = sprintf('%f \t %f \t %f', ee_pos_1(1,4), ee_pos_1(2,4), ee_pos_1(3,4)); % Showing point in UI...
        set(handles.point_1_8, 'String', list_1); % Showing point in UI...
        ee_pos_2 = inv(Base2)*handles.p560_2.fkine(q2); % Defining EE of robot 2 w.r.t its own base...
        list_2 = sprintf('%f \t %f \t %f', ee_pos_2(1,4), ee_pos_2(2,4), ee_pos_2(3,4)); % Showing point in UI...
        set(handles.point_2_8, 'String', list_2); % Showing point in UI...
        if array_point_1(:,:,1) == zeros(4,4) & array_point_2(:,:,1) == zeros(4,4);
            array_point_1 = cat(3, ee_pos_1); % Creating array...
            array_point_2 = cat(3, ee_pos_2); % Creating array...
        else
            array_point_1 = cat(3, array_point_1, ee_pos_1); % Creating array...
            array_point_2 = cat(3, array_point_2, ee_pos_2); % Creating array...
        end
        T1 = handles.p560.fkine(q);
        T2 = handles.p560_2.fkine(q2);
        handles.p560.plot(q);
        handles.p560_2.plot(q2);
        set(handles.puma560_1_x_coordinate, 'String', num2str(T1(1,4))); % Displaying x-coordinate of position vector to string and setting it in
        % callback variable of display for x-coordinate...
        set(handles.puma560_1_y_coordinate, 'String', num2str(T1(2,4))); % Displaying y-coordinate of position vector to string and setting it in
        % callback variable of display for y-coordinate...
        set(handles.puma560_1_z_coordinate, 'String', num2str(T1(3,4))); % Displaying z-coordinate of position vector to string and setting it in
        % callback variable of display for z-coordinate...
        set(handles.puma560_2_x_coordinate, 'String', num2str(T2(1,4))); % Converting x-coordinate of position vector to string and setting it in
        % callback variable of display for x-coordinate...
        set(handles.puma560_2_y_coordinate, 'String', num2str(T2(2,4))); % Converting y-coordinate of position vector to string and setting it in
        % callback variable of display for y-coordinate...
        set(handles.puma560_2_z_coordinate, 'String', num2str(T2(3,4))); % Converting z-coordinate of position vector to string and setting it in
        % callback variable of display for z-coordinate...
        clc;
        disp('Point 8 is selected...');
        
    case 'Point 9';
        T = transl(.625, .25, -.25);
        q = handles.p560.ikine(T, q, M,  'pinv', 'alpha', .5); % getting joint angles...
        q2 = handles.p560_2.ikine(T, q2, M,  'pinv', 'alpha', .5); % getting joint angles...
        T1 = handles.p560.fkine(q);
        T2 = handles.p560_2.fkine(q2);
        ee_pos_1 = inv(Base1)*handles.p560.fkine(q); % Defining EE of robot 1 w.r.t its own base...
        list_1 = sprintf('%f \t %f \t %f', ee_pos_1(1,4), ee_pos_1(2,4), ee_pos_1(3,4)); % Showing point in UI...
        set(handles.point_1_9, 'String', list_1); % Showing point in UI...
        ee_pos_2 = inv(Base2)*handles.p560_2.fkine(q2); % Defining EE of robot 2 w.r.t its own base...
        list_2 = sprintf('%f \t %f \t %f', ee_pos_2(1,4), ee_pos_2(2,4), ee_pos_2(3,4)); % Showing point in UI...
        set(handles.point_2_9, 'String', list_2); % Showing point in UI...
        if array_point_1(:,:,1) == zeros(4,4) & array_point_2(:,:,1) == zeros(4,4);
            array_point_1 = cat(3, ee_pos_1); % Creating array...
            array_point_2 = cat(3, ee_pos_2); % Creating array...
        else
            array_point_1 = cat(3, array_point_1, ee_pos_1); % Creating array...
            array_point_2 = cat(3, array_point_2, ee_pos_2); % Creating array...
        end
        T1 = handles.p560.fkine(q);
        T2 = handles.p560_2.fkine(q2);
        handles.p560.plot(q);
        handles.p560_2.plot(q2);
        set(handles.puma560_1_x_coordinate, 'String', num2str(T1(1,4))); % Displaying x-coordinate of position vector to string and setting it in
        % callback variable of display for x-coordinate...
        set(handles.puma560_1_y_coordinate, 'String', num2str(T1(2,4))); % Displaying y-coordinate of position vector to string and setting it in
        % callback variable of display for y-coordinate...
        set(handles.puma560_1_z_coordinate, 'String', num2str(T1(3,4))); % Displaying z-coordinate of position vector to string and setting it in
        % callback variable of display for z-coordinate...
        set(handles.puma560_2_x_coordinate, 'String', num2str(T2(1,4))); % Converting x-coordinate of position vector to string and setting it in
        % callback variable of display for x-coordinate...
        set(handles.puma560_2_y_coordinate, 'String', num2str(T2(2,4))); % Converting y-coordinate of position vector to string and setting it in
        % callback variable of display for y-coordinate...
        set(handles.puma560_2_z_coordinate, 'String', num2str(T2(3,4))); % Converting z-coordinate of position vector to string and setting it in
        % callback variable of display for z-coordinate...
        clc;
        disp('Point 9 is selected...');
end
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function select_point_CreateFcn(hObject, eventdata, handles)
% hObject    handle to select_point (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function point_1_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to point_1_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function point_1_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to point_1_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function point_1_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to point_1_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function point_1_4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to point_1_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function point_1_5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to point_1_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function point_1_6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to point_1_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function point_1_7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to point_1_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function point_1_8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to point_1_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function point_1_9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to point_1_9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function point_2_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to point_2_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function point_2_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to point_2_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function point_2_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to point_2_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function point_2_4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to point_2_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function point_2_5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to point_2_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function point_2_6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to point_2_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function point_2_7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to point_2_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function point_2_8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to point_2_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function point_2_9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to point_2_9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in optim_find_error.
function optim_find_error_Callback(hObject, eventdata, handles)
% hObject    handle to optim_find_error (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Base2 array_point_1 array_point_2; % Initiatin global variables...
data_array = [0 0 0 0]; % Initiating data array...
T_ref = Base2; % Setting reference matrix...
x2 = T_ref(1,4); % Extracting x coordinate...
y2 = T_ref(2,4); % Extracting y coordinate...
z2 = T_ref(3,4); % Extracting z coordinate...
counter = size(array_point_1); % Setting counter...
for n = 1:1:counter(:,3);
    ee_pos_1 = array_point_1(:,:,n); % Getting point of robot 1...
    ee_pos_2 = array_point_2(:,:,n); % Getting point of robot 1...
    T_calc = ee_pos_2*inv(ee_pos_1); % Calculating the transformation matrix between two bases...
    xyz(:,1) = T_calc(1,4); % Extracting calculated poins...
    xyz(:,2) = T_calc(2,4); % Extracting calculated poins...
    xyz(:,3) = T_calc(3,4); % Extracting calculated poins...
    % error = @(x)sqrt((x2-x)^2 + (y2-y)^2 + (z2-z)^2);
    error = @(xyz)sqrt((x2-xyz(1))^2 + (y2-xyz(2))^2 + (z2-xyz(3))^2); % Defining objective function for error...
    [xyz,fval] = fminsearch(error, [0 0 0]); % Calculatin x,y,z and error with initial guess of 0 0 0...
    data = cat(2, xyz, fval); % getting data...
    if n == 1;
%         format short;
        set(handles.result_1, 'String', mat2str(data)); % Display in UI...
    elseif n == 2;
        set(handles.result_2, 'String', mat2str(data)); % Display in UI...
    elseif n == 3;
        set(handles.result_3, 'String', mat2str(data)); % Display in UI...
    elseif n == 4;
        set(handles.result_4, 'String', mat2str(data)); % Display in UI...
    elseif n == 5;
        set(handles.result_5, 'String', mat2str(data)); % Display in UI...
    elseif n == 6;
        set(handles.result_6, 'String', mat2str(data)); % Display in UI...
    elseif n == 7;
        set(handles.result_7, 'String', mat2str(data)); % Display in UI...
    elseif n == 8;
        set(handles.result_8, 'String', mat2str(data)); % Display in UI...
    elseif n == 9;
        set(handles.result_9, 'String', mat2str(data)); % Display in UI...
    end
    % data_array = cat(1,data,data)
    if data_array == 0
        data_array = data;
    else
        data_array = cat(1,data_array,data);
    end
end

xlswrite('optim_assgnmnt.xls', data_array); % Writing results to the excel file...
% xlswrite('optim_assgnmnt.xls', array_point_1, 2);
% xlswrite('optim_assgnmnt.xls', array_point_2, 2);


% --- Executes during object creation, after setting all properties.
function result_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function result_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function result_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function result_4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function result_5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function result_6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function result_7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function result_8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function result_9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result_9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

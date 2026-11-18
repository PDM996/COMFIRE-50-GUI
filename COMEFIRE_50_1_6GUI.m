function varargout = COMEFIRE_50_1_6GUI(varargin)
% COMEFIRE_50_1_1GUI MATLAB code for COMEFIRE_50_1_1GUI.fig
%      COMEFIRE_50_1_1GUI, by itself, creates a new COMEFIRE_50_1_1GUI or raises the existing
%      singleton*.
%
%      H = COMEFIRE_50_1_1GUI returns the handle to a new COMEFIRE_50_1_1GUI or the handle to
%      the existing singleton*.
%
%      COMEFIRE_50_1_1GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COMEFIRE_50_1_1GUI.M with the given input arguments.
%
%      COMEFIRE_50_1_1GUI('Property','Value',...) creates a new COMEFIRE_50_1_1GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before COMEFIRE_50_1_1GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to COMEFIRE_50_1_1GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help COMEFIRE_50_1_1GUI

% Last Modified by GUIDE v2.5 16-Jul-2016 21:27:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @COMEFIRE_50_1_1GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @COMEFIRE_50_1_1GUI_OutputFcn, ...
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


% --- Executes just before COMEFIRE_50_1_1GUI is made visible.
function COMEFIRE_50_1_1GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to COMEFIRE_50_1_1GUI (see VARARGIN)

handles.Jobname='Trial';
handles.Thickness=10;
handles.filename=strcat(pwd,'\', handles.Jobname,'_Results for sample_thickness_of_',num2str(handles.Thickness),'_mm.mat');
handles.LoadFile=handles.filename;
handles.exportname=handles.filename;
handles.hCF=10;
handles.nFibre=1;
handles.nResin=1;
handles.kCp=0;
handles.VolFr=0.5;
handles.Duration=1;
handles.FoCond=0.5;
handles.Tamb=20;
handles.HF=2;
handles.Flames=0;
handles.QFLUX=100;
handles.K_GM=23e8;
handles.emisHtSo=0.9;
handles.absorpLam=0.9;
handles.emisLam=0.9;
handles.kSur=0;
handles.kCF=0;
handles.Rcont=0;
handles.kDegra=0;
handles.kMasFl=0;
handles.FIGURE=1;
handles.nd1=1;
handles.nd2=4;
handles.nd3=6;
handles.nd4=7;
handles.nd5=8;
handles.nd6=9;
handles.nd7=11;
handles.Nodes1=11;
handles.ND=[handles.nd1,handles.nd2,handles.nd3,handles.nd4,handles.nd5,handles.nd6,handles.nd7];% Vector of output node numbers
handles.kStruct=0;
handles.ApplStress=68;
handles.kSigma=0;
handles.FL=681;
handles.buser=100;
handles.C=1;
handles.Lcuser=100;
handles.CompCompFail=681;
handles.CharCompFail=0;
handles.CompCompMod=123200;
handles.CharCompMod=0;
handles.Embeded=1;
handles.Export=1;
handles.TimeInterval=1;
save Inputs
% load(strcat(handles.Jobname,'_Results for sample_thickness_of_',num2str(handles.Thickness*1000),'_mm.mat'));
% plot(Time,FurnTemp,Time,TC(:,ND(1)),Time,TC(:,ND(2)),Time,TC(:,ND(3)),Time,TC(:,ND(4)),Time,TC(:,ND(5)),Time,TC(:,ND(6)),Time,TC(:,ND(7)));legend('Heat source temperature','Hot Face','Node 2','Node 3','Node 4','Node 5','Node 6','Cold Face');
% xlabel 'Time [sec]';ylabel 'Temperature [°C]';title('Calculated temperature');

% COMFIRE_50_Release_2013_03_04(handles.hCF,handles.nFibre,handles.nResin,handles.kCp,handles.volFr,handles.Thickness,handles.Duration,handles.FoCond,handles.Tamb,...
%     handles.HF,handles.Flames,handles.QFLUX,handles.emisHtSo,handles.bsorpLam,handles.emisLam,handles.kSur,handles.kCF,handles.kDegra,handles.kMasFl,handles.FIGURE,handles.ND)%% COM_FIRE_MATLAB

% Choose default command line output for COMEFIRE_50_1_1GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes COMEFIRE_50_1_1GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = COMEFIRE_50_1_1GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in CoordinatePopup.
function CoordinatePopup_Callback(hObject, eventdata, handles)
% hObject    handle to CoordinatePopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns CoordinatePopup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from CoordinatePopup

val=get(hObject,'Value');
str=get(hObject,'String');
switch str{val}
    case 'Cartesian' % User selects Cartesian
        handles.coord=1;
    case 'Axysimmetric' % User selects Axysimmetric
        handles.coord=2;
end
guidata(hObject,handles);
    
% --- Executes during object creation, after setting all properties.
function CoordinatePopup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CoordinatePopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in RunPushbutton.
function RunPushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to RunPushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% It changes the label of the button from RUN to RUNNING
str = get(hObject,'String'); % get the current pushbutton string 
state = find(strcmp(str,handles.Strings)); % Determine which string the label matches 
set(hObject,'String',handles.Strings{3-state});% Toggle the button label to other string 

% It stops the simulation running
% if find(strcmp(get(hObject,'String'),handles.Strings)) == 1
%     return
% end
% if state==1
%It runs COMFIRE program according to all the inputs typed in
% handles.ND=[handles.nd1,handles.nd2,handles.nd3,handles.nd4,handles.nd5,handles.nd6,handles.nd7];% Vector of output node numbers

% this instruction updates the handles.ND structure 
handles.ND=[handles.nd1,handles.nd2,handles.nd3,handles.nd4,handles.nd5,handles.nd6,handles.nd7];% Vector of output node numbers
if sum(handles.ND>handles.Nodes1)>=1
    msgbox('Nodes number to be plotted exceeding total number of nodes ','Nodes warning','warn');
else
    msgbox('Calculation started','Calculation Status');
    COMFIRE_50_Release_2015_11_05(handles.filename,handles.hCF,handles.nFibre,handles.nResin,handles.kCp,handles.VolFr,handles.Thickness,handles.Duration,handles.FoCond,handles.Tamb,...
    handles.HF,handles.Flames,handles.QFLUX,handles.emisHtSo,handles.absorpLam,handles.emisLam,handles.kSur,handles.kCF,handles.Rcont,handles.kDegra,handles.kMasFl,handles.FIGURE,handles.Nodes1,handles.ND,handles.kStruct,handles.ApplStress,handles.kSigma)%% COM_FIRE_MATLAB
    guidata(hObject,handles);
    % end
    msgbox(['Calculation completed. File saved as: ',handles.filename],'Calculation Status');
    if handles.kStruct==1
        if handles.kSigma==0;
            handles.StructMod= ('2 layer model (post-fire)'); % User selected single point value for thermal properties
        elseif handles.kSigma==1;
         handles.StructMod= ('Average Strength model-1 Transition');
      elseif handles.kSigma==2;
           handles.StructMod= ('Average Strength model-2 Transitions');
     else %handles.kSigma==3;
           handles.StructMod= ('Average Strength model-3 transitions');
        end
     msgbox(['Structural analysis performed using ',handles.StructMod],'Structural calculation info');
    else
     msgbox(['Structural analysis not performed.'],'Structural calculation info');
    end
end
% It changes the label of the button from RUNNING to RUN
str = get(hObject,'String'); % get the current pushbutton string 
state = find(strcmp(str,handles.Strings)); % Determine which string the label matches 
set(hObject,'String',handles.Strings{3-state});% Toggle the button label to other string 

function Job_name_edit_Callback(hObject, eventdata, handles)
% hObject    handle to Job_name_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Job_name_edit as text
%        str2double(get(hObject,'String')) returns contents of Job_name_edit as a double

handles.Jobname=get(hObject,'String');
handles.filename=strcat(pwd,'\', handles.Jobname,'_Results for sample_thickness_of_',num2str(handles.Thickness),'_mm.mat');
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function Job_name_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Job_name_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Flame_checkbox.
function Flame_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to Flame_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Flame_checkbox

if (get(hObject,'Value') == get(hObject,'Max'))
 % Checkbox is checked-take approriate action
 handles.Flames=1;
else
 % Checkbox is not checked-take approriate action
 handles.Flames=0;
end
guidata(hObject,handles);

% --- Executes on button press in KCp_popupmenu.
function KCp_popupmenu_Callback(hObject, eventdata, handles)
% hObject    handle to KCp_popupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of KCp_popupmenu

val=get(hObject,'Value');
str=get(hObject,'String');
switch str{val}
    case 'k and Cp as single point value' % User selected single point value for thermal properties
        handles.kCp=0;
    case 'k and Cp VS Temp from a table of values' % User selected table of thermal properties VS temperature
        handles.kCp=1;
    case 'k and Cp VS Temp from a polinomy' % User selected polinomy of thermal properties VS temperature
        handles.kCp=2;
    case 'k and Cp VS Temp using the rule of mixture' % User selected rule of mixture of thermal properties VS temperature
        handles.kCp=3;
end
guidata(hObject,handles);

% --- Executes on button press in HTC_checkbox.
function HTC_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to HTC_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of HTC_checkbox

if (get(hObject,'Value') == get(hObject,'Max'))
 % Checkbox is checked-take approriate action
 handles.kHTC=1;
else
 % Checkbox is not checked-take approriate action
 handles.kHTC=0;
end
guidata(hObject,handles);

% --- Executes on selection change in SteelBC_popupmenu.
function SteelBC_popupmenu_Callback(hObject, eventdata, handles)
% hObject    handle to SteelBC_popupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns SteelBC_popupmenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from SteelBC_popupmenu

val=get(hObject,'Value');
str=get(hObject,'String');
switch str{val}
    case 'Steel cold face insulated' % User selects Cartesian
        handles.kCF=1;
    case 'Natural convection + Free radiation' % User selects Axysimmetric
        handles.kCF=2;
end
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function SteelBC_popupmenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SteelBC_popupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in CFBC_popupmenu.
function CFBC_popupmenu_Callback(hObject, eventdata, handles)
% hObject    handle to CFBC_popupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns CFBC_popupmenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from CFBC_popupmenu

val=get(hObject,'Value');
str=get(hObject,'String');
switch str{val}
    case 'Cold face insulated' % User selects Cartesian
        handles.kCF=0;
    case 'Natural convection+Free radiation' % User selects Axysimmetric
        handles.kCF=1;
    case 'Steel plate' % User selects Axysimmetric
        handles.kCF=2;
    case 'Copper heat sink' % User selects Axysimmetric
        handles.kCF=3;
    case 'Natural convection only' % User selects Axysimmetric
        handles.kCF=4;
    case 'Free radiation only' % User selects Axysimmetric
        handles.kCF=5;
    case 'Liquid heat sink' % User selects Axysimmetric
        handles.kCF=6;
end
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function CFBC_popupmenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CFBC_popupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Fibres_popupmenu.
function Fibres_popupmenu_Callback(hObject, eventdata, handles)
% hObject    handle to Fibres_popupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Fibres_popupmenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Fibres_popupmenu

val=get(hObject,'Value');
str=get(hObject,'String');
switch str{val}
    case 'Glass fibres' % User selects Cartesian
        handles.nFibre=1;
    case 'Carbon fibres' % User selects Axysimmetric
        handles.nFibre=2;
    case 'Aramid fibres' % User selects Axysimmetric
        handles.nFibre=3;
    case 'Aluminium layers' % User selects Axysimmetric
        handles.nFibre=4;
    case 'Other fibres' % User selects Axysimmetric
        handles.nFibre=5;
end
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function Fibres_popupmenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Fibres_popupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Resin_popupmenu.
function Resin_popupmenu_Callback(hObject, eventdata, handles)
% hObject    handle to Resin_popupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Resin_popupmenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Resin_popupmenu

val=get(hObject,'Value');
str=get(hObject,'String');
switch str{val}
    case 'Polyester resin' % User selects Cartesian
        handles.nResin=1;
    case 'Vinylester resin' % User selects Axysimmetric
        handles.nResin=2;
    case 'Epoxy resin' % User selects Axysimmetric
        handles.nResin=3;
    case 'Phenolic resin' % User selects Axysimmetric
        handles.nResin=4;
    case 'HDPE resin' % User selects Axysimmetric
        handles.nResin=5;
    case 'HIPS resin' % User selects Axysimmetric
        handles.nResin=6;
    case 'PMMA resin' % User selects Axysimmetric
        handles.nResin=7;
    case 'Polycarbonate resin' % User selects Axysimmetric
        handles.nResin=8;
    case 'PVC resin' % User selects Axysimmetric
        handles.nResin=9;
    case 'Other resin' % User selects Axysimmetric
        handles.nResin=11;
end
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function Resin_popupmenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Resin_popupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function VolFr_edit_Callback(hObject, eventdata, handles)
% hObject    handle to VolFr_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of VolFr_edit as text
%        str2double(get(hObject,'String')) returns contents of VolFr_edit as a double
handles.VolFr=str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function VolFr_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to VolFr_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Thickness_edit_Callback(hObject, eventdata, handles)
% hObject    handle to Thickness_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Thickness_edit as text
%        str2double(get(hObject,'String')) returns contents of Thickness_edit as a double

handles.Thickness=str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function Thickness_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Thickness_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Radius_edit_Callback(hObject, eventdata, handles)
% hObject    handle to Radius_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Radius_edit as text
%        str2double(get(hObject,'String')) returns contents of Radius_edit as a double

handles.radius=str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function Radius_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Radius_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in HFConv_checkbox.
function HFConv_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to HFConv_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of HFConv_checkbox

if (get(hObject,'Value') == get(hObject,'Max'))
 % Checkbox is checked-take approriate action
 handles.kSur=1;
else
 % Checkbox is not checked-take approriate action
 handles.kSur=0;
end
guidata(hObject,handles);

% --- Executes on button press in WVE_checkbox.
function WVE_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to WVE_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of WVE_checkbox

if (get(hObject,'Value') == get(hObject,'Max'))
 % Checkbox is checked-take approriate action
 handles.kWat=1;
else
 % Checkbox is not checked-take approriate action
 handles.kWat=0;
end
guidata(hObject,handles);


function Steel_edit_Callback(hObject, eventdata, handles)
% hObject    handle to Steel_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Steel_edit as text
%        str2double(get(hObject,'String')) returns contents of Steel_edit as a double

handles.ThicknessSt=str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function Steel_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Steel_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Degradation_checkbox.
function Degradation_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to Degradation_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Degradation_checkbox
if (get(hObject,'Value') == get(hObject,'Max'))
 % Checkbox is checked-take approriate action
 handles.kDegra=1;
else
 % Checkbox is not checked-take approriate action
 handles.kDegra=0;
end
guidata(hObject,handles);

% --- Executes on button press in MassFl_checkbox.
function MassFl_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to MassFl_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of MassFl_checkbox

if (get(hObject,'Value') == get(hObject,'Max'))
 % Checkbox is checked-take approriate action
 handles.kMasFl=1;
else
 % Checkbox is not checked-take approriate action
 handles.kMasFl=0;
end
guidata(hObject,handles);

function HRMD_edit_Callback(hObject, eventdata, handles)
% hObject    handle to HRMD_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of HRMD_edit as text
%        str2double(get(hObject,'String')) returns contents of HRMD_edit as a double

handles.HRMD=str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function HRMD_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HRMD_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function WaterCont_edit_Callback(hObject, eventdata, handles)
% hObject    handle to WaterCont_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of WaterCont_edit as text
%        str2double(get(hObject,'String')) returns contents of WaterCont_edit as a double

handles.WatCont=str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function WaterCont_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WaterCont_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu7.
function popupmenu7_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu7 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu7

val=get(hObject,'Value');
str=get(hObject,'String');
switch str{val}
    case 'Hidrocarbon curve' % User selects Cartesian
        handles.HF=0;
    case 'Room temprature data file' % User selects Axysimmetric
        handles.HF=1;
    case 'Constant heat flux [kW/m^2]' % User selects Axysimmetric
        handles.HF=2;
    case 'SOLAS curve' % User selects Axysimmetric
        handles.HF=3;
    case 'Measured hot face temperature data file' % User selects Axysimmetric
        handles.HF=4;
end
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function popupmenu7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function HF_edit_Callback(hObject, eventdata, handles)
% hObject    handle to HF_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of HF_edit as text
%        str2double(get(hObject,'String')) returns contents of HF_edit as a double

handles.QFLUX=str2double(get(hObject,'String'));
if handles.QFLUX>130
    msgbox('Warning: This model does not consider reactions happening between polymer and fibres so results may not be very accurate for heat fluxes higher than 130 kW/m^2','Heat flux intensity',warn');
elseif handles.QFLUX<15
    msgbox('Warning: This model does consider time dependent failure mechanisms such as creep so structural results may not be very accurate for heat fluxes lower than 15 kW/m^2','Heat flux intensity',warn');    
end
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function HF_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HF_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EmissHF_edit_Callback(hObject, eventdata, handles)
% hObject    handle to EmissHF_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EmissHF_edit as text
%        str2double(get(hObject,'String')) returns contents of EmissHF_edit as a double

handles.emisLam=str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function EmissHF_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EmissHF_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Absorp_edit_Callback(hObject, eventdata, handles)
% hObject    handle to Absorp_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Absorp_edit as text
%        str2double(get(hObject,'String')) returns contents of Absorp_edit as a double

handles.absorpLam=str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function Absorp_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Absorp_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EmissSource_edit_Callback(hObject, eventdata, handles)
% hObject    handle to EmissSource_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EmissSource_edit as text
%        str2double(get(hObject,'String')) returns contents of EmissSource_edit as a double

handles.emisHtSo=str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function EmissSource_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EmissSource_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ContResist_edit_Callback(hObject, eventdata, handles)
% hObject    handle to ContResist_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ContResist_edit as text
%        str2double(get(hObject,'String')) returns contents of ContResist_edit as a double

handles.Rcont=str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function ContResist_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ContResist_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double

handles.hCF=str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Tamb_edit_Callback(hObject, eventdata, handles)
% hObject    handle to Tamb_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Tamb_edit as text
%        str2double(get(hObject,'String')) returns contents of Tamb_edit as a double

handles.Tamb=str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function Tamb_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Tamb_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function FoNum_edit_Callback(hObject, eventdata, handles)
% hObject    handle to FoNum_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FoNum_edit as text
%        str2double(get(hObject,'String')) returns contents of FoNum_edit as a double

handles.FoCond=str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function FoNum_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FoNum_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Duration_edit_Callback(hObject, eventdata, handles)
% hObject    handle to Duration_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Duration_edit as text
%        str2double(get(hObject,'String')) returns contents of Duration_edit as a double

handles.Duration=str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function Duration_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Duration_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function node1_edit_Callback(hObject, eventdata, handles)
% hObject    handle to node1_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of node1_edit as text
%        str2double(get(hObject,'String')) returns contents of node1_edit as a double
handles.thick1=str2double(get(hObject,'String'));
handles.nd1=round(handles.thick1/(handles.Thickness/(handles.Nodes1-1)))+1;
% handles.nd1=str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function node1_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to node1_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function node2_edit_Callback(hObject, eventdata, handles)
% hObject    handle to node2_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of node2_edit as text
%        str2double(get(hObject,'String')) returns contents of node2_edit as a double
handles.thick2=str2double(get(hObject,'String'));
handles.nd2=round(handles.thick2/(handles.Thickness/(handles.Nodes1-1)))+1;
% handles.nd2=str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function node2_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to node2_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function node3_edit_Callback(hObject, eventdata, handles)
% hObject    handle to node3_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of node3_edit as text
%        str2double(get(hObject,'String')) returns contents of node3_edit as a double
handles.thick3=str2double(get(hObject,'String'));
handles.nd3=round(handles.thick3/(handles.Thickness/(handles.Nodes1-1)))+1;
% handles.nd3=str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function node3_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to node3_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function node4_edit_Callback(hObject, eventdata, handles)
% hObject    handle to node4_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of node4_edit as text
%        str2double(get(hObject,'String')) returns contents of node4_edit as a double

handles.thick4=str2double(get(hObject,'String'));
handles.nd4=round(handles.thick4/(handles.Thickness/(handles.Nodes1-1)))+1;
% handles.nd4=str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function node4_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to node4_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function node5_edit_Callback(hObject, eventdata, handles)
% hObject    handle to node5_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of node5_edit as text
%        str2double(get(hObject,'String')) returns contents of node5_edit as a double

handles.thick5=str2double(get(hObject,'String'));
handles.nd5=round(handles.thick5/(handles.Thickness/(handles.Nodes1-1)))+1;
% handles.nd5=str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function node5_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to node5_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function node6_edit_Callback(hObject, eventdata, handles)
% hObject    handle to node6_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of node6_edit as text
%        str2double(get(hObject,'String')) returns contents of node6_edit as a double

handles.thick6=str2double(get(hObject,'String'));
handles.nd6=round(handles.thick6/(handles.Thickness/(handles.Nodes1-1)))+1;
% handles.nd6=str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function node6_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to node6_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function node7_edit_Callback(hObject, eventdata, handles)
% hObject    handle to node7_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of node7_edit as text
%        str2double(get(hObject,'String')) returns contents of node7_edit as a double

handles.thick7=str2double(get(hObject,'String'));
handles.nd7=round(handles.thick7/(handles.Thickness/(handles.Nodes1-1)))+1;
% handles.nd7=str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function node7_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to node7_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function FigureStart_edit_Callback(hObject, eventdata, handles)
% hObject    handle to FigureStart_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FigureStart_edit as text
%        str2double(get(hObject,'String')) returns contents of FigureStart_edit as a double

handles.FIGURE=str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function FigureStart_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FigureStart_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function Nodes_uipanel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Nodes_uipanel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in Temp2D_pushbutton.
function Temp2D_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to Temp2D_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

load(handles.LoadFile);
if handles.Embeded==1;
    plot(Time,FurnTemp,Time,TCNODES);legend(THICKNESS1,'Location','Best');
    xlim([Time(1),Time(length(Time))+2]);xlabel 'Time [sec]';ylabel 'Temperature [°C]';title('Calculated temperature');
elseif handles.Embeded==2;
    figure(handles.FIGURE);plot(Time,FurnTemp,Time,TCNODES);legend(THICKNESS1,'Location','Best');
%     plot(Time,FurnTemp,Time,TC(:,ND(1)),Time,TC(:,ND(2)),Time,TC(:,ND(3)),Time,TC(:,ND(4)),Time,TC(:,ND(5)),Time,TC(:,ND(6)),Time,TC(:,ND(7)));legend('Source','Hot Face','Node 2','Node 3','Node 4','Node 5','Node 6','Cold Face','Location','Best');
    xlim([Time(1),Time(length(Time))+2]);xlabel 'Time [sec]';ylabel 'Temperature [°C]';title('Calculated temperature');
else
    plot(Time,FurnTemp,Time,TCNODES);legend(THICKNESS1,'Location','Best');
%     plot(Time,FurnTemp,Time,TC(:,ND(1)),Time,TC(:,ND(2)),Time,TC(:,ND(3)),Time,TC(:,ND(4)),Time,TC(:,ND(5)),Time,TC(:,ND(6)),Time,TC(:,ND(7)));legend('Source','Hot Face','Node 2','Node 3','Node 4','Node 5','Node 6','Cold Face','Location','Best');
    xlim([Time(1),Time(length(Time))+2]);xlabel 'Time [sec]';ylabel 'Temperature [°C]';title('Calculated temperature');
    figure(handles.FIGURE);plot(Time,FurnTemp,Time,TCNODES);legend(THICKNESS1,'Location','Best');
%     plot(Time,FurnTemp,Time,TC(:,ND(1)),Time,TC(:,ND(2)),Time,TC(:,ND(3)),Time,TC(:,ND(4)),Time,TC(:,ND(5)),Time,TC(:,ND(6)),Time,TC(:,ND(7)));legend('Source','Hot Face','Node 2','Node 3','Node 4','Node 5','Node 6','Cold Face','Location','Best');
    xlim([Time(1),Time(length(Time))+2]);xlabel 'Time [sec]';ylabel 'Temperature [°C]';title('Calculated temperature');
end



% --- Executes on button press in MassLoss_pushbutton.
function MassLoss_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to MassLoss_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if handles.kDegra==1&&handles.kMasFl==1
    load(handles.LoadFile);
    if handles.Embeded==1;
        plot(Time,GasFlowT(:,2));xlabel('Time [sec]');ylabel('Mass loss [kg/m^2s]');title('Mass loss');
    elseif handles.Embeded==2;
        figure(handles.FIGURE+1);plot(Time,GasFlowT(:,2));xlabel('Time [sec]');ylabel('Mass loss [kg/m^2s]');title('Mass loss');
    else
        plot(Time,GasFlowT(:,2));xlabel('Time [sec]');ylabel('Mass loss [kg/m^2s]');title('Mass loss');
        figure(handles.FIGURE+1);plot(Time,GasFlowT(:,2));xlabel('Time [sec]');ylabel('Mass loss [kg/m^2s]');title('Mass loss');
    end
else
    msgbox('Mass flow not activated. No plot will be created','Mass loss','warn');
end


% --- Executes on button press in HRR_pushbutton.
function HRR_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to HRR_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if handles.kDegra==1&&handles.kMasFl==1
    load(handles.LoadFile);
    if handles.Embeded==1;
        plot(Time,K_GM*GasFlowT(:,2)/1000);xlabel('Time [sec]');ylabel('HRR [kW/m^2]');title('HRR');
    elseif handles.Embeded==2;
        figure(handles.FIGURE+2);plot(Time,K_GM*GasFlowT(:,2)/1000);xlabel('Time [sec]');ylabel('HRR [kW/m^2]');title('HRR');
    else
        plot(Time,K_GM*GasFlowT(:,2)/1000);xlabel('Time [sec]');ylabel('HRR [kW/m^2]');title('HRR');
        figure(handles.FIGURE+2);plot(Time,K_GM*GasFlowT(:,2)/1000);xlabel('Time [sec]');ylabel('HRR [kW/m^2]');title('HRR');
    end
else
    msgbox('Mass flow not activated. No plot will be created','Mass loss plot info','warn');
end


% --- Executes on button press in Temp3D_pushbutton.
function Temp3D_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to Temp3D_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

load(handles.LoadFile);
[TIME3D,NODE]=meshgrid(Time,(1000*Deltax*(0:(Nodes-1))));
if handles.Embeded==1;
    mesh(TIME3D,NODE,(TC(:,1:Nodes1))');xlabel('Time [sec]');ylabel('Thickness [mm]');zlabel('Temperatures [°C]');title('Calculated temperature');%axis ij;
elseif handles.Embeded==2;
    figure(handles.FIGURE+3);mesh(TIME3D,NODE,(TC(:,1:Nodes1))');xlabel('Time [sec]');ylabel('Thickness [mm]');zlabel('Temperatures [°C]');title('Calculated temperature');%axis ij;
else
    mesh(TIME3D,NODE,(TC(:,1:Nodes1))');xlabel('Time [sec]');ylabel('Thickness [mm]');zlabel('Temperatures [°C]');title('Calculated temperature');%axis ij;
    figure(handles.FIGURE+3);mesh(TIME3D,NODE,(TC(:,1:51))');xlabel('Time [sec]');ylabel('Thickness [mm]');zlabel('Temperatures [°C]');title('Calculated temperature');%axis ij;
end



% --- Executes on mouse press over axes background.
function axes1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in FigureType_popupmenu.
function FigureType_popupmenu_Callback(hObject, eventdata, handles)
% hObject    handle to FigureType_popupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns FigureType_popupmenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from FigureType_popupmenu

val=get(hObject,'Value');
str=get(hObject,'String');
switch str{val}
    case 'Embedded figure' % User selects Cartesian
        handles.Embeded=1;
    case 'Separate figure' % User selects Axysimmetric
        handles.Embeded=2;
    case 'Both' % User selects Axysimmetric
        handles.Embeded=3;
end
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function FigureType_popupmenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FigureType_popupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Export_pushbutton.
function Export_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to Export_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% It opens a window to chose the name and the path to save the result file 
[handles.exportname, handles.pathname, filterindex] = uiputfile( ...
{'*.mat','MATLAB Files (*.mat)';
'*.xls', 'Excel Files (*.xls)';...
'*.txt', 'Text Files (*.txt)';...
'*.csv', 'CSV Files(*.csv)'},...
'Save as',...
handles.exportname);

load(handles.LoadFile)

if filterindex==1 % Writes a matlab file
     % The results are already saved in a matlab file
     save(strcat(handles.pathname, handles.exportname));
     msgbox(strcat('File already saved in matlab format in: ',handles.filename,'. File saved as: ', handles.pathname, handles.exportname),'Export status');

elseif filterindex==2% Writes an Excel file
% It creates the headings of the Excel file
    a={'Time [s]','Heat source temperature [°C]','Nodes Temperature [°C]'};%,'','','','','','',''; 't','Heat Source','node 1','node 2','node 3','node 4','node 5','node 6','node 7'
    c=size(TC);
    status=xlswrite(strcat(handles.pathname , handles.exportname) ,a, 'Temperature', 'A1');
    status=xlswrite(strcat(handles.pathname , handles.exportname) ,[THICKNESS1], 'Temperature', 'C2');

% It creates the matrix of the Time versus temperatures
%     T=zeros(length(Time),(length(ND)));
    T=zeros(length(Time),(c(2)+2));
    T(:,1)=Time;T(:,2)=FurnTemp;T(:,3:end)=TC;
%     T(:,2)=TC(:,ND(1));
%     T(:,3)=TC(:,ND(2));
%     T(:,4)=TC(:,ND(3));
%     T(:,5)=TC(:,ND(4));
%     T(:,6)=TC(:,ND(5));
%     T(:,7)=TC(:,ND(6));
%     T(:,8)=TC(:,ND(7));
    
    T1=Results_Filter(T,handles.TimeInterval);
    status=xlswrite(strcat(handles.pathname , handles.exportname) ,T1, 'Temperature', 'A3');
    if (handles.kDegra==1)&&(handles.kMasFl==1)
        b={'Time [s]','Mass Loss [kgm^-2s^-1',};
        status=xlswrite(strcat(handles.pathname , handles.exportname) ,b, 'Mass Loss', 'A1');
        G=zeros(length(Time),2);
        G(:,1)=Time;
        G(:,2)=GasFlowT(:,2);
        status=xlswrite(strcat(handles.pathname , handles.exportname),G, 'Mass Loss', 'A2');
        c={'Time [s]','HRR [kWm^-2s^-1',};
        status=xlswrite(strcat(handles.pathname , handles.exportname) ,c, 'HRR', 'A1');
        HRR1=zeros(length(Time),2);
        HRR1(:,1)=Time;
        HRR1(:,2)=HRR;
        status=xlswrite(strcat(handles.pathname , handles.exportname) ,HRR1, 'HRR', 'A2');

    else
    end
% It returns a window with the saving status of the exported resultt file
    if status==1
        h = msgbox('Excel file successfully created','Export status');
    else
        h = msgbox('Excel file not created','Export status');
    end
    
elseif filterindex==3 % Write a TXT file
% It saves the results in a TXT file
    fid = fopen(strcat(handles.pathname ,'TEMP_VS_TIME', handles.exportname),'w+');
    fprintf(fid, 'Time [s] \t Hot Face Temp [°C]\t Nodes Temp [°C]\n Time [s] \t node 1   \t node 2   \t node 3   \t node 4   \t node 5   \t node 6   \t node 7   \n');
    status=fclose(fid);
    
%     status=fprintf(strcat(handles.pathname ,'\', mehandles.exportname) ,a, 'Temperature', 'A1');
    

% It creates the matrix of the Time versus temperatures
%     T=zeros(length(Time),(length(ND)));
    c=size(TC);
    T=zeros(length(Time),(c(2)+2));
    T(:,1)=Time;T(:,2)=FurnTemp;T(:,3:end)=TC;
%     T(:,2)=TC(:,ND(1));
%     T(:,3)=TC(:,ND(2));
%     T(:,4)=TC(:,ND(3));
%     T(:,5)=TC(:,ND(4));
%     T(:,6)=TC(:,ND(5));
%     T(:,7)=TC(:,ND(6));
%     T(:,8)=TC(:,ND(7));

    fid=fopen(strcat(handles.pathname , 'TEMP_VS_TIME', handles.exportname),'a+');
    fprintf(fid ,'%9.2f\t %9.2f\t %9.2f\t %9.2f\t %9.2f\t %9.2f\t %9.2f\t %9.2f\t %9.2f\t %9.2f\t %9.2f\t %9.2f\t %9.2f\t %9.2f\t %9.2f\t %9.2f\t %9.2f\t %9.2f\t %9.2f\t %9.2f\t %9.2f\t %9.2f\t %9.2f\t %9.2f\t %9.2f\t %9.2f\t %9.2f\t %9.2f\t %9.2f\t %9.2f\t %9.2f\t %9.2f\t %9.2f\t %9.2f\t %9.2f\t %9.2f\t %9.2f\t %9.2f\t %9.2f\t %9.2f\t %9.2f\t %9.2f\t %9.2f\t %9.2f\t %9.2f\t %9.2f\t %9.2f\t %9.2f\t %9.2f\t %9.2f\t %9.2f\t %9.2f\t %9.2f\n' , T' );
    status=fclose(fid);
    
    if (handles.kDegra==1)&&(handles.kMasFl==1)
% Building the TXT file of the mass loss
        fid=fopen(strcat(handles.pathname , 'Mass_Loss', handles.exportname),'w+');
        fprintf(fid,'Time [s]  \t Mass Loss [kgm^-2s^-1]\n');
        fclose(fid);
        G=zeros(length(Time),2);
        G(:,1)=Time;
        G(:,2)=GasFlowT(:,2);
        fid=fopen(strcat(handles.pathname , 'Mass_Loss', handles.exportname),'a+');
        fprintf(fid,'%9.2f\t %9.2f\n', G');
        status=fclose(fid);
        
% Building the TXT file of the mass loss
        fid=fopen(strcat(handles.pathname , 'HRR', handles.exportname),'w+');
        fprintf(fid,'Time [s]  \t HRR [kWm^-2s^-1]\n',c);
        fclose(fid);
        HRR1=zeros(length(Time),2);
        HRR1(:,1)=Time;
        HRR1(:,2)=HRR;
        fid=fopen(strcat(handles.pathname , 'HRR', handles.exportname),'a+');
        fprintf(fid,'%9.2f\t %9.2f\n',HRR1');
        status=fclose(fid);
    else
    end
    
    if status>=0
        h = msgbox('TXT file successfully created','Export status');
    else
        h = msgbox('TXT file not created','Export status');
    end

elseif filterindex==4 %Writes a CSV file
% It saves the results in a CSV file
    fid = fopen(strcat(handles.pathname ,'TEMP_VS_TIME', handles.exportname),'w+');
    fprintf(fid, 'Time [s] \t, Temp [°C]\n Time [s] \t, node 1   \t, node 2   \t, node 3   \t, node 4   \t, node 5   \t, node 6   \t, node 7   \n');
    status=fclose(fid);
    
%     status=fprintf(strcat(handles.pathname ,'\', mehandles.exportname) ,a, 'Temperature', 'A1');
    

% It creates the matrix of the Time versus temperatures
    T=zeros(length(Time),(length(ND)));
    T(:,1)=Time;
%     c=size(TC);
%     T=zeros(length(Time),(c(2)+1));
    T(:,2)=TC(:,ND(1));
    T(:,3)=TC(:,ND(2));
    T(:,4)=TC(:,ND(3));
    T(:,5)=TC(:,ND(4));
    T(:,6)=TC(:,ND(5));
    T(:,7)=TC(:,ND(6));
    T(:,8)=TC(:,ND(7)); 
    T1=Results_Filter(T);

    fid=fopen(strcat(handles.pathname , 'TEMP_VS_TIME', handles.exportname),'a+');
    fprintf(fid ,'%9.2f\t, %9.2f\t, %9.2f\t, %9.2f\t, %9.2f\t, %9.2f\t, %9.2f\t, %9.2f\n' , T1' );
    status=fclose(fid);
    
    if (handles.kDegra==1)&&(handles.kMasFl==1)
% Building the TXT file of the mass loss
        fid=fopen(strcat(handles.pathname , 'Mass_Loss', handles.exportname),'w+');
        fprintf(fid,'Time [s]  \t, Mass Loss [kgm^-2s^-1]\n');
        fclose(fid);
        G=zeros(length(Time),2);
        G(:,1)=Time;
        G(:,2)=GasFlowT(:,2);
        fid=fopen(strcat(handles.pathname , 'Mass_Loss', handles.exportname),'a+');
        fprintf(fid,'%9.2f\t, %9.2f\n', G');
        statusfclose(fid);
        
% Building the TXT file of the mass loss
        fid=fopen(strcat(handles.pathname , 'HRR', handles.exportname),'w+');
        fprintf(fid,'Time [s]  \t, HRR [kWm^-2s^-1]\n',c);
        fclose(fid);
        HRR1=zeros(length(Time),2);
        HRR1(:,1)=Time;
        HRR1(:,2)=HRR;
        fid=fopen(strcat(handles.pathname , 'HRR', handles.exportname),'a+');
        fprintf(fid,'%9.2f\t, %9.2f\n',HRR1');
        status=fclose(fid);
    else
    end
    
    if status>=0
        h = msgbox('CSV file successfully created','Export status');
    else
        h = msgbox('CSV file not created','Export status');
    end
    
else
end

% --- Executes on selection change in Export_popupmenu.
function Export_popupmenu_Callback(hObject, eventdata, handles)
% hObject    handle to Export_popupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Export_popupmenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Export_popupmenu

val=get(hObject,'Value');
str=get(hObject,'String');
switch str{val}
    case 'Matlab file' % User selects Cartesian
        handles.Export=1;
    case 'Excell file' % User selects Axysimmetric
        handles.Export=2;
    case 'TXT file' % User selects Axysimmetric
        handles.Export=3;
    case 'CSV file' % User selects Axysimmetric
        handles.Export=3;
end
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function Export_popupmenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Export_popupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function RunPushbutton_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RunPushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

handles.Strings = {'RUN';'RUNNING'};
guidata(hObject, handles); 


% --------------------------------------------------------------------
function Plot_axl_Callback(hObject, eventdata, handles)
% hObject    handle to Plot_axl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Displays contents of axes1 at larger size in a new figure

% Create a figure to receive this axes' data
axes1fig = figure;

% Copy the axes and size it to the figure
axes1copy = copyobj(handles.axes1,axes1fig);
% set(axes1copy,'Units','Normalized',...
%               'Position',[.05,.20,.90,.60])
% Assemble a title for this new figure
% str = [get(handles.uipanel7,'Title') ' for ' ...
%        get(handles.poplabel,'String')];
% title(str,'Fontweight','bold')
% Save handles to new fig and axes in case
% we want to do anything else to them
handles.axes1fig = axes1fig;
handles.axes1copy = axes1copy;
guidata(hObject,handles);


% --------------------------------------------------------------------
function Plot_Callback(hObject, eventdata, handles)
% hObject    handle to Plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function ExportName_edit_Callback(hObject, eventdata, handles)
% hObject    handle to ExportName_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ExportName_edit as text
%        str2double(get(hObject,'String')) returns contents of ExportName_edit as a double
handles.exportname=get(hObject,'String');
handles.exportname=strcat(pwd, handles.exportname);
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function ExportName_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ExportName_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over RunPushbutton.
function RunPushbutton_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to RunPushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object deletion, before destroying properties.
function RunPushbutton_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to RunPushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in LoadPrev_pushbutton.
function LoadPrev_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to LoadPrev_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[handles.LoadFile, handles.Loadpathname, filterindex] = uigetfile( ...
{'*.mat','MATLAB Files (*.mat)'},...
'Load previous saved results file',...
handles.filename);

handles.LoadFile=strcat(handles.Loadpathname,handles.LoadFile);
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function Degradation_checkbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Degradation_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


function Nodes1_Callback(hObject, eventdata, handles)
% hObject    handle to Nodes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Nodes1 as text
%        str2double(get(hObject,'String')) returns contents of Nodes1 as a double
handles.Nodes1=str2double(get(hObject,'String'));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function Nodes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Nodes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit30_Callback(hObject, eventdata, handles)
% hObject    handle to edit30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit30 as text
%        str2double(get(hObject,'String')) returns contents of edit30 as a double
handles.TimeInterval=str2double(get(hObject,'String'));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit30_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in StructCalcKey.
function StructCalcKey_Callback(hObject, eventdata, handles)
% hObject    handle to StructCalcKey (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of StructCalcKey
if (get(hObject,'Value') == get(hObject,'Max'))
 % Checkbox is checked-take approriate action
 handles.kStruct=1;
else
 % Checkbox is not checked-take approriate action
 handles.kStruct=0;
end

guidata(hObject,handles);


% --- Executes on selection change in Structural_model.
function Structural_model_Callback(hObject, eventdata, handles)
% hObject    handle to Structural_model (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Structural_model contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Structural_model
val=get(hObject,'Value');
str=get(hObject,'String');
switch str{val}
    case '2 layer model (post-fire)' % User selected single point value for thermal properties
        kSigma=0;handles.kSigma=kSigma;
    case 'Average Strength model-1 Transition' % User selected table of thermal properties VS temperature
        kSigma=1;handles.kSigma=kSigma;
    case 'Average Strength model-2 Transitions' % User selected polinomy of thermal properties VS temperature
        kSigma=2;handles.kSigma=kSigma;
    case 'Average Strength model-3 transitions' % User selected rule of mixture of thermal properties VS temperature
        kSigma=3;handles.kSigma=kSigma;
end
save('Structural_Properties.mat','kSigma','-append');
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function Structural_model_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Structural_model (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Stresses_Callback(hObject, eventdata, handles)
% hObject    handle to Stresses (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Stresses as text
%        str2double(get(hObject,'String')) returns contents of Stresses as a double
ApplStress=str2double(get(hObject,'String'));
handles.ApplStress=ApplStress;
save('Structural_Properties.mat','ApplStress','-append');
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function Stresses_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Stresses (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function width_Callback(hObject, eventdata, handles)
% hObject    handle to width (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of width as text
%        str2double(get(hObject,'String')) returns contents of width as a double
buser=str2double(get(hObject,'String'));
handles.buser=buser;
save('Structural_Properties.mat','buser','-append')
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function width_CreateFcn(hObject, eventdata, handles)
% hObject    handle to width (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit36_Callback(hObject, eventdata, handles)
% hObject    handle to edit36 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit36 as text
%        str2double(get(hObject,'String')) returns contents of edit36 as a double


% --- Executes during object creation, after setting all properties.
function edit36_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit36 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu11.
function popupmenu11_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu11 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu11
val=get(hObject,'Value');
str=get(hObject,'String');
switch str{val}
    case 'one end fixed, one end free' % User selected single point value for thermal properties
        C=0.25;
        handles.C=C;
    case 'both end pivoted' % User selected table of thermal properties VS temperature
        C=1;
        handles.C=C;
    case 'one end fixed and one pivoted' % User selected polinomy of thermal properties VS temperature
        C=2;
        handles.C=C;
    case 'both ends fixed' % User selected rule of mixture of thermal properties VS temperature
        C=4;
        handles.C=C;
end
save('Structural_Properties.mat','C','-append')
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function popupmenu11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function CompCompFail_Callback(hObject, eventdata, handles)
% hObject    handle to CompCompFail (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CompCompFail as text
%        str2double(get(hObject,'String')) returns contents of CompCompFail as a double
FL=str2double(get(hObject,'String'));CompCompFail=FL;sigmaU=FL;
handles.FL=FL;
handles.CompCompFail=handles.FL;
handles.sigmaU=handles.FL;
save('Structural_Properties.mat','FL','CompCompFail','sigmaU','-append');
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function CompCompFail_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CompCompFail (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function CharCompMod_Callback(hObject, eventdata, handles)
% hObject    handle to CharCompMod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CharCompMod as text
%        str2double(get(hObject,'String')) returns contents of CharCompMod as a double
CharCompMod=str2double(get(hObject,'String'));
handles.CharCompMod=CharCompMod;
save('Structural_Properties.mat','CharCompMod','-append')
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function CharCompMod_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CharCompMod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function CharCompFail_Callback(hObject, eventdata, handles)
% hObject    handle to CharCompFail (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CharCompFail as text
%        str2double(get(hObject,'String')) returns contents of CharCompFail as a double
CharCompFail=str2double(get(hObject,'String'));
handles.CharCompFail=CharCompFail;
save('Structural_Properties.mat','CharCompFail','-append');
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function CharCompFail_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CharCompFail (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Free_Length_Callback(hObject, eventdata, handles)
% hObject    handle to Free_Length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Free_Length as text
%        str2double(get(hObject,'String')) returns contents of Free_Length as a double
Lcuser=str2double(get(hObject,'String'));
handles.Lcuser=Lcuser;
save('Structural_Properties.mat','Lcuser','-append');
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function Free_Length_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Free_Length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function CompCompMod_Callback(hObject, eventdata, handles)
% hObject    handle to CompCompMod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CompCompMod as text
%        str2double(get(hObject,'String')) returns contents of CompCompMod as a double
CompCompMod=str2double(get(hObject,'String'));EcU=CompCompMod;
handles.CompCompMod=CompCompMod;
handles.EcU=str2double(get(hObject,'String'));
save('Structural_Properties.mat','CompCompMod','EcU','-append');
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function CompCompMod_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CompCompMod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit45_Callback(hObject, eventdata, handles)
% hObject    handle to edit45 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit45 as text
%        str2double(get(hObject,'String')) returns contents of edit45 as a double
handles.sigma=str2double(get(hObject,'String'));
a=textscan(handles.sigma,'%f','delimiter',',');
b=length(a{1});
if b==1
    handles.sigma1R=a{1}(1);
elseif b==2
    handles.sigma1R=a{1}(1);
    handles.sigma2R=a{1}(2);
elseif b==3
    handles.sigma1R=a{1}(1);
    handles.sigma2R=a{1}(2);
    handles.sigma3R=a{1}(3);
end
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit45_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit45 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit46_Callback(hObject, eventdata, handles)
% hObject    handle to edit46 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit46 as text
%        str2double(get(hObject,'String')) returns contents of edit46 as a double
handles.Ec=str2double(get(hObject,'String'));
a=textscan(handles.Ec,'%f','delimiter',',');
b=length(a{1});
if b==1
    handles.Ec1R=a{1}(1);
    handles.EcR=a{1}(1);
elseif b==2
    handles.Ec1R=a{1}(1);
    handles.Ec2R=a{1}(2);
elseif b==3
    handles.Ec1R=a{1}(1);
    handles.Ec2R=a{1}(2);
    handles.Ec3R=a{1}(3);
end
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit46_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit46 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit47_Callback(hObject, eventdata, handles)
% hObject    handle to edit47 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit47 as text
%        str2double(get(hObject,'String')) returns contents of edit47 as a double
handles.Tg=str2double(get(hObject,'String'));
a=textscan(handles.Tg,'%f','delimiter',',');
b=length(a{1});
if b==1
    handles.T1gR=a{1}(1);
    handles.Tgc=a{1}(1);
elseif b==2
    handles.T1g=a{1}(1);
    handles.T2g=a{1}(2);
elseif b==3
    handles.T1g=a{1}(1);
    handles.T2g=a{1}(2);
    handles.T3g=a{1}(3);
end
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit47_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit47 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit48_Callback(hObject, eventdata, handles)
% hObject    handle to edit48 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit48 as text
%        str2double(get(hObject,'String')) returns contents of edit48 as a double
handles.n=str2double(get(hObject,'String'));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit48_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit48 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit49_Callback(hObject, eventdata, handles)
% hObject    handle to edit49 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit49 as text
%        str2double(get(hObject,'String')) returns contents of edit49 as a double
handles.nc=str2double(get(hObject,'String'));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit49_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit49 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when figure1 is resized.
function figure1_ResizeFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in TimeToFailure.
function TimeToFailure_Callback(hObject, eventdata, handles)
% hObject    handle to TimeToFailure (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load(handles.LoadFile);
load('Structural_Properties.mat');
if  handles.kDegra==1&&handles.kStruct==1
    if isnan(TTF)||isnan(TTB)
        if isnan(TTF)
            a=('No compressive failure during simulation duration');
        else
            a=['Compressive failure happening at ',num2str(TTF),' [s]'];
        end
        if isnan(TTB)
            b=('No buclking failure during simulation duration');
        else
            b=['Buckling failure happening at ',num2str(TTB),' [s]'];
        end
        msgbox('No failure during simulation duration. No plot will be created','Failure report','Warn')
    elseif handles.Embeded==1;    
        plot(TTF,ApplStress/FL,'b*',TTB,ApplStress/FL,'bX');%,...
        legend('Compressive failure','Buckling Failure','Location','Best');
        title('Time to Failure');
        xlabel('Time [s]');
        ylabel('Normalised applied stresses');
        xlim([0 max(TTF,TTB)+10]);
        ylim([0 ApplStress/FL+0.1]);
    
     elseif handles.Embeded==2;
    figure(handles.FIGURE);plot(TTF,ApplStress/FL,'b*',TTB,ApplStress/FL,'bX');%,...
        legend('Compressive failure','Buckling Failure','Location','Best');
        title('Time to Failure');
        xlabel('Time [s]');
        ylabel('Normalised applied stresses');
        xlim([0 max(TTF,TTB)+10]);
        ylim([0 ApplStress/FL+0.1]);

     else
        plot(TTF,ApplStress/FL,'b*',TTB,ApplStress/FL,'bX');%,...
        legend('Compressive failure','Buckling Failure','Location','Best');
        title('Time to Failure');
        xlabel('Time [s]');
        ylabel('Normalised applied stresses');
        xlim([0 max(TTF,TTB)+10]);
        ylim([0 ApplStress/FL+0.1]);
    figure(handles.FIGURE);plot(TTF,ApplStress/FL,'b*',TTB,ApplStress/FL,'bX');%,...
        legend('Compressive failure','Buckling Failure','Location','Best');
        title('Time to Failure');
        xlabel('Time [s]');
        ylabel('Normalised applied stresses');
        xlim([0 max(TTF,TTB)+10]);
        ylim([0 ApplStress/FL+0.1]);
    end
    msgbox([a,' ',b],'Failure report','help')

else
    msgbox(['Degradation or structural not activated. No plot will be created'],'Time to failure','warn');
end


% --- Executes on button press in ResiduaStrength.
function ResiduaStrength_Callback(hObject, eventdata, handles)
% hObject    handle to ResiduaStrength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load(handles.LoadFile);
load('Structural_Properties.mat');
if  handles.kDegra==1&&handles.kStruct==1
    if isnan(TTF)&&isnan(TTB)
        msgbox('No failure during simulation duration. No plot will be created','Failure report','warn')
    elseif handles.Embeded==1;    
        plot(Time,sigmaAv/FL,'k-',Time,sigmaEul/FL,'k--');%,...
        legend('Compressive failure','Buckling Failure','Location','Best');
        title('Residual strength vs time');
        xlabel('Time [s]');
        ylabel('Normalised residual strength');
    
     elseif handles.Embeded==2;
    figure(handles.FIGURE); plot(Time,sigmaAv/FL,'k-',Time,sigmaEul/FL,'k--');%,...
        legend('Compressive failure','Buckling Failure','Location','Best');
        title('Residual strength vs time');
        xlabel('Time [s]');
        ylabel('Normalised residual strength');

     else
        plot(Time,sigmaAv/FL,'k-',Time,sigmaEul/FL,'k--');%,...
        legend('Compressive failure','Buckling Failure','Location','Best');
        title('Residual strength vs time');
        xlabel('Time [s]');
        ylabel('Normalised residual strength');

    figure(handles.FIGURE);plot(Time,sigmaAv/FL,'k-',Time,sigmaEul/FL,'k--');%,...
        legend('Compressive failure','Buckling Failure','Location','Best');
        title('Residual strength vs time');
        xlabel('Time [s]');
        ylabel('Normalised residual strength');

    end
else
    msgbox(['Degradation or structural not activated. No plot will be created'],'Structural plot','warn')
end


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function uipushtool3_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function updateNodes=updateNodes(handles)
handles.ND=[handles.nd1,handles.nd2,handles.nd3,handles.nd4,handles.nd5,handles.nd6,handles.nd7];% Vector of output node numbers


% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function kstresses_Callback(hObject, eventdata, handles)
% hObject    handle to kstresses (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of kstresses as text
%        str2double(get(hObject,'String')) returns contents of kstresses as a double
handles.kstruct=str2double(get(hObject,'String'));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function kstresses_CreateFcn(hObject, eventdata, handles)
% hObject    handle to kstresses (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit51_Callback(hObject, eventdata, handles)
% hObject    handle to edit51 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit51 as text
%        str2double(get(hObject,'String')) returns contents of edit51 as a double
handles.kstructc=str2double(get(hObject,'String'));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit51_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit51 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

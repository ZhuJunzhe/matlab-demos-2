%% Cosine Rolloff Time vs. Frequency Domain
% 
% Copyright 2007 Telecommunications Lab
% $Revision: 1.0 $ $Date: 2007/06/21 12:45:07 $

function rolloff_demo(action)
if nargin<1,
    action='initialize';
end;

Fs = 5000;                              % Sampling frequency 5000 Hz
T = 1/100;                              % Symbol time interval [s].
t = -50*T:1/Fs:50*T;                    % Time vector (sampling intervals)
t = t+0.00000001;                       

if strcmp(action,'initialize'),
    figNumber=figure( ...
        'Name','cos-roll-off', ...
        'NumberTitle','off', ...
        'Visible','off', ...
        'Color',0.8*[1 1 1], ...
        'BackingStore','off','resize','off');
    colordef(figNumber,'white')
%     axes( ...
%         'Units','normalized', ...
%         'Position',[0.05 0.05 0.70 0.90], ...
%         'Visible','off');
%   %===================================
    % Information for all buttons
    labelColor=[0.8 0.8 0.8];
    top=0.95;
    bottom=0.05;
    btnWid=0.15;
    btnHt=0.10;
    right=0.95;
    left=right-btnWid;
    % Spacing between the button and the next command's label
    spacing=0.02;
    
    %====================================
    % The CONSOLE frame
    frmBorder=0.02;
    yPos=bottom-frmBorder;
    frmPos=[left-frmBorder yPos btnWid+2*frmBorder 0.9+2*frmBorder];
    h=uicontrol( ...
        'Style','frame', ...
        'Units','normalized', ...
        'Position',frmPos, ...
        'BackgroundColor',[0.50 0.50 0.50]);

    %====================================
    btnNumber=1;
    yPos=top-(btnNumber-1)*(btnHt+spacing);
    callbackStr='rolloff_demo(''build'');';

    % Generic button information
    sldPos=[left yPos-3*btnHt btnWid btnHt];
    labelPos1=[left yPos-1.5*btnHt btnWid btnHt];
    sld1Hndl=uicontrol( ...
        'Style','slider', ...
        'Tag','rolloff', ...
        'Units','normalized', ...
        'Position',sldPos, ...
        'Callback',callbackStr);

    uicontrol( ...
        'Style','text', ...
        'Tag','rolloff_value', ...
        'String','r=0', ...
        'Units','normalized', ...
        'Position',labelPos1);
    %====================================
    % The CLOSE button
    labelStr='Close';
    callbackStr='close(gcf)';
    uicontrol( ...
        'Style','push', ...
        'Units','normalized', ...
        'Position',[left bottom btnWid btnHt], ...
        'String',labelStr, ...
        'Callback',callbackStr);

    % Uncover the figure
    set(figNumber, ...
         'Visible','on');
    set(figNumber, ...
         'Visible','on');
    
    set([sld1Hndl],'Units','pixel')
    sld1Pos=get(sld1Hndl,'Position');
   set(sld1Hndl,'Position',[sld1Pos(1) sld1Pos(2)+sld1Pos(4)-16 sld1Pos(3) 16])
        

    r=get(sld1Hndl,'Value');
    y=(sin(pi*t/T)./(pi*t/T)).*(cos(r*pi*t/T)./(1-(2*r*t/T).^2));
    surfHndl=subplot('Position',[0.05 0.55 0.70 0.30]);plot(t,y);grid on;axis([-.05 .05 -.5 1.1]);
    set(surfHndl,'Tag','surface_t');
    %%%
    Y=abs(fft([y zeros(1,1024-length(y))]));
    surfHndl2=subplot('Position',[0.05 0.1 0.70 0.30]);plot(Y/max(Y));axis([0 100 -.1 1.1]);
    set(gca,'XTick',[0:51:100]);
    set(gca,'XTickLabel',['     0';'1 / 2T';'1 / T ';'      ';'      ';'      ';'      ']);
    set(surfHndl2,'Tag','surface_f');
     %%%
    axis on;grid on;
    shading interp;
    drawnow

elseif strcmp(action,'build'),
    %====================================
%     axHndl=gca;
%     figNumber=gcf;
    sld1Hndl=findobj(gcf,'Tag','rolloff');
      
    r=get(sld1Hndl,'Value');
    rolloff_value=findobj(gcf,'Tag','rolloff_value');
    set(rolloff_value,'String', strvcat('r=',num2str(r)));

    y=(sin(pi*t/T)./(pi*t/T)).*(cos(r*pi*t/T)./(1-(2*r*t/T).^2));
    surfHndl=findobj(gcf,'Tag','surface_t');
    set(get(surfHndl,'Children'),'XData',t,'YData',y);
    
    Y=abs(fft([y zeros(1,1024-length(y))]));
    surfHndl2=findobj(gcf,'Tag','surface_f');axis([0 100 -.1 1.1]);
    set(gca,'XTick',[0:51:100]);
    set(gca,'XTickLabel',['     0';'1 / 2T';'1 / T ';'      ';'      ';'      ';'      ']);
    set(get(surfHndl2,'Children'),'YData',Y/max(Y));
    drawnow

end;    % if strcmp(action, ...

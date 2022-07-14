%% script for running the fMRI experiment in the scanner

function BBTT_fmri(sub)
% PsychDebugWindowConfiguration
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Timing of the experiment:
% -? ms: Video presentation
% -5000 ms: Delay 1
% -until a button is pressed: Decision
% -5000 ms: Delay 2
% -2000 ms: CR instructions
% -until a button is pressed: CR execution
% -3500 ms: mean ITI
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

rng('shuffle')

n_runs = 1; % 1 for testing purposes, update to fMRI run number later

% Set screen for display       
AssertOpenGL
screens=Screen('Screens');
screenNumber=max(screens);    
HideCursor;
white = [255 255 255];

% Select screen mode
fullscreen=1; % 1 = exp mode; 0 = test mode
screens=Screen('Screens');
screenNumber=max(screens); 

% Set to prevent display errors % CHANGE. Check how to get rid of the graphic error
Screen('Preference', 'SkipSyncTests', 1); 

if fullscreen<1
    [nScreen, rect] = Screen('OpenWindow', screenNumber, 0, [0 0 800 600]); % for test purposes
else
    [nScreen, rect] = Screen('OpenWindow', screenNumber, 0);
end

centerXY=[rect(3)/2 rect(4)/2];

for run = 1:n_runs          
    % Runs fMRI             
    run_fmri(sub,run,nScreen,centerXY, rect)
end

Screen('CloseAll'); % Close display window
% Priority(0); %Shutdown realtime mode.
ShowCursor;
end 

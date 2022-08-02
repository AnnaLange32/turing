                                                                                                                  %% Script to run a single trial

function run_fmri(sub,run,nScreen,centerXY, rect)
%PsychDebugWindowConfiguration


% Set which run you want to run
iRun= run; 
myscreen = nScreen;
center_screen = centerXY;
curdir = pwd;
black = [0 0 0];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Timing of the experiment:
% -1000 ms Partner Cue
% -5000 ms Delay 1
% -1000 ms Instruction
% -5000 ms Delay 2
% -2000 ms Speaking
% -2500 ms Partner execution (feedback screen)
% -3500 ms mean ITI
% 
% total: 20s exp, 14s catch
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Check OS
if ismac
    trigger_code = 34;  % code for OS X
    return_code = 40; % code for OS X ('Return')
    o_code = 18; % code for 'o' in OS X  
elseif ispc
    trigger_code = 53;  % code for Windows
    return_code = 13;  % code for Windows ('Return')
    o_code = 79;  % code for 'o' in Windows 
    left_arrow = 37;  % code for arrow left
    up_arrow = 38;  % code for arrow up
    right_arrow = 39;  % code for arrow right
    down_arrow = 40;  % code for arrow down
end

rng('shuffle')

% Set timings
cue_time = 3;
ins_time = 3;
delay_time = 3;
cr_ins_time = 3;

% colours

green = [31 177 38]
white = [255 255 255 255]
black = [0 0 0 0]
% Set logfile      
%logfile_name=fullfile(curdir,'logs',sprintf('sub-%02d.mat',sub)); 
%if exist(logfile_name,'file')~=2
%    error('No logfile for this participant. Please copy the file from the training laptop.')
%     create_randomization(logfile_name,sub); % create sbj design file - should be there already
%end
% Load sbj design file 
%load(logfile_name); 


% Waiting for trigger 
 
Screen('TextSize', myscreen, 30);
DrawFormattedText(myscreen, 'The experiment will start soon!','center','center', white);        

Screen('Flip',myscreen);
HideCursor;
slack= 0.0078; % 1/60/2; % CHANGE: check this  0.0078 - maybe take out (should be +, I think)
my_drawfixation(myscreen,center_screen,15,15,white);  % prepare fixation

disp('OPERATOR, start SCANNING now! Waiting for scanner pulse to begin');

%% MRI sync trigger
while 1
    [acc_time, keyCode, ~] = KbPressWait; % log time trigger received
        if find(keyCode) == trigger_code
            disp('keyboard / MRI trigger received');
            break;
        end
end

%my_experiment.run(iRun).start_scan.t=acc_time; % time when scanning starts
%my_experiment.run(iRun).start_scan.key=keyCode; % key recorded for scanning pulse

Screen('Flip', myscreen); % show fixation

WaitSecs(2)
%start_scan=acc_time;
% Wait for dummy scans [extended waiting time for microphone calibration]
%start_exp=start_scan + (my_experiment.dummy_volumes*my_experiment.TR); % time when script starts
%lasttrial_duration=0; % cue onset [0s]
%duration_cum=0;

%% loop with trials
n_trials = 1; % length(my_experiment.run(iRun).trial); 

for iTrial = 1:n_trials
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % video presentation
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    filename = fullfile(curdir,'Videos','test_video.m4v'); % example video for testing the code

    PlayVideos(filename,nScreen,rect)
    
    Screen('Flip', myscreen); % show video
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % delay 1
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    my_drawfixation(myscreen,center_screen,15,15,white);  % prepare fixation

    Screen('Flip', myscreen); % show fixation

    WaitSecs(2)
     
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % decision
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     
     my_drawdecision(myscreen,center_screen,15,15,white, rect, white);
     Screen('Flip', myscreen); % show decision
     
    %% MRI sync trigger
    while 1
        [acc_time, keyCode, ~] = KbPressWait; % log time trigger received
            if find(keyCode) == left_arrow
                disp('keyboard / MRI trigger received');
                break;
            end
            if find(keyCode) == right_arrow
                disp('keyboard / MRI trigger received');
                break;
            end
            %note: need to record the key presses with associated choice 
            response = KbName(keyCode); % unified key name to record response
    end
    
%    my_drawdecision(myscreen,center_screen,15,15,black, rect, white);
%    Screen('Flip', myscreen);
%    WaitSecs(0.5);
   my_drawdecision(myscreen,center_screen,15,15,green, rect, white);
   Screen('Flip', myscreen);  
   WaitSecs(0.3);
   my_drawdecision(myscreen,center_screen,15,15,white, rect, white);
   Screen('Flip', myscreen);
   WaitSecs(2)
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % delay 2
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    my_drawfixation(myscreen,center_screen,15,15,[255 255 255]); % fixation is drawn
    Screen('Flip', myscreen); % show fixation
    WaitSecs(3)
     
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % CR 
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    my_drawcr2(myscreen, rect, right_arrow, left_arrow, up_arrow, down_arrow) % move with right_arrow, confirm choice with down_arrow
     %my_drawcr_cogtoolbox(myscreen)  % uncomment for cogtoolbox Likert
     %version
     %[c] = exptSetup % uncomment for Stanford Likert version
     %my_drawcr_stanfordtoolbox(c) % uncomment for Stanford Likert
     %version,move with right and left arrows confirm choice with g
    %Screen('Flip', myscreen); % show decision
     
 
end
end


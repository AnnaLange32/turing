function check()

% Select screen mode
fullscreen=0; % 1 = exp mode; 0 = test mode


curdir=pwd;
screens=Screen('Screens');
screenNumber=max(screens); 


% Set to prevent display errors
Screen('Preference', 'SkipSyncTests', 1);    
if fullscreen<1
%     [nScreen, rect] = PsychImaging('OpenWindow', screenNumber, 0, [0 0 800 600]); % for test purposes
    [nScreen, rect] = Screen('OpenWindow', screenNumber, 0, [0 0 800 600]); % for test purposes
else
%     [nScreen, rect] = PsychImaging('OpenWindow', screenNumber, 0);
    [nScreen, rect] = Screen('OpenWindow', screenNumber, 0);
end

filename = fullfile(curdir,'Videos','test_video.m4v');

PlayVideos(filename,nScreen,rect)

WaitSecs(2)

Screen('CloseAll'); % Close display window


end
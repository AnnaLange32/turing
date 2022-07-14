%% Adapted from PlayMoviesDemo(moviename [, hdr=0][, backgroundMaskOut][, tolerance][, pixelFormat=4][, maxThreads=-1])
% author: Doris Pischedda
%  start: 2020/11/25
%
% Plays video moviename 
% Pressing arrow down pauses the video: arrow up will restart it


function PlayVideos(filename,nScreen,rect)

moviename = filename;
myscreen = nScreen;
dstRect = rect;

% Initialize with unified keynames and normalized colorspace:
PsychDefaultSetup(2);

% Setup key mapping:
up=KbName('UpArrow');
down=KbName('DownArrow');
shift=KbName('RightShift');

% No special movieOptions by default:
movieOptions = [];

% Screen('Blendfunction', myscreen, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
pixelFormat = 5;
maxThreads = [];

% Use blocking wait for new frames by default:
blocking = 1;

% Default preload setting:
preloadsecs = [];

% Playbackrate defaults to 1:
rate=1;

% Open movie file and retrieve basic info about movie:
[movie, movieduration, fps, imgw, imgh, ~, ~, hdrStaticMetaData] = Screen('OpenMovie', myscreen, moviename, [], preloadsecs, [], pixelFormat, maxThreads, movieOptions);

% Start playback of movie. This will start
% the realtime playback clock and playback of audio tracks, if any.
% Play 'movie', at a playbackrate = 1, with endless loop=1 and
% 1.0 == 100% audio volume.
Screen('PlayMovie', movie, rate, 0, 1.0);
t1 = GetSecs;

% Infinite playback loop: Fetch video frames and display them...
while 1
    [keyIsDown, ~, keyCode] = KbCheck(-1);

    % Only perform video image fetch/drawing if playback is active
    % and the movie actually has a video track (imgw and imgh > 0):
    if ((abs(rate)>0) && (imgw>0) && (imgh>0))
        % Return next frame in movie, in sync with current playback
        % time and sound.
        % tex is either the positive texture handle or zero if no
        % new frame is ready yet in non-blocking mode (blocking == 0).
        % It is -1 if something went wrong and playback needs to be stopped:
        tex = Screen('GetMovieImage', myscreen, movie, blocking);

        % Valid texture returned?
        if tex <= 0
            % No, and there won't be any in the future, due to some
            % error. Abort playback loop:
            break;
        end

        if tex == 0
            % No new frame in polling wait (blocking == 0). Just sleep
            % a bit and then retry.
            WaitSecs('YieldSecs', 0.005);
            continue;
        end

        % Draw the new texture immediately to screen:
        Screen('DrawTexture', myscreen, tex, [], dstRect) %, [], [], [], [], [], [], []); %, shader);

        % Update display:
        Screen('Flip', myscreen);

        % Release texture:
        Screen('Close', tex);
    end

    if (keyIsDown==1 && keyCode(up))
        % Increase playback rate by 1 unit.
        if (keyCode(shift))
            rate=rate+0.1;
        else
            KbReleaseWait;
            rate=round(rate+1);
        end
        Screen('PlayMovie', movie, rate, 0, 1.0);
    end

    if (keyIsDown==1 && keyCode(down))
        % Decrease playback rate by 1 unit.
        if (keyCode(shift))
            rate=rate-0.1;
        else
            KbReleaseWait;
            rate=round(rate-1);
        end
        Screen('PlayMovie', movie, rate, 0, 1.0);
    end
end


telapsed = GetSecs - t1;
fprintf('Elapsed time %f seconds, for %i frames. Average framerate %f fps.\n', telapsed, i, i / telapsed);

Screen('Flip', myscreen);
KbReleaseWait;

% Done. Stop playback:
Screen('PlayMovie', movie, 0);

% Close movie object:
Screen('CloseMovie', movie);

end



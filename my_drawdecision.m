function my_drawdecision (w, rect, white)
PsychDebugWindowConfiguration

%% real code
% randomizing position of choices
xpos = [rect(3)/1.6 rect(3)/6];
r = randperm(2);
pos1 = xpos(r(1));
pos2 = xpos(r(2));


DrawFormattedText(w, 'Press the right button', rect(3)/1.6, rect(4)/3, white);
DrawFormattedText(w, 'Press the left button', rect(3)/6, rect(4)/3, white);
DrawFormattedText(w, 'Human', pos1+85, 'center', white);
DrawFormattedText(w, 'Robot', pos2+85, 'center', white);
Screen('Flip', w);

%% response
key_set = {'RightArrow', 'LeftArrow'};

keyIsDown = false;
while keyIsDown == false | ismember(KbName(keyCode), key_set) == 0;
[keyIsDown, secs, keyCode, deltaSecs] = KbCheck;
end
response = KbName(keyCode); % unified key name

end

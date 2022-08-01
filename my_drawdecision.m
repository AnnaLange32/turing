function my_drawdecision (w, center_screen,sx,sy, color, rect, white)

% randomizing position of choices
xpos = [rect(3)*0.25 (rect(3)-rect(3)*0.25)];
r = randperm(2)
pos1 = xpos(r(1));
pos2 = xpos(r(2));
xy=[-1*round(sx/2) 0;round(sx/2) 0;...
    0 -1*round(sy/2);0 round(sy/2)]';
% Screen('DrawLines', w, xy, 3, [255 255 255], center_screen,0)

DrawFormattedText(w, 'Human', pos1, 'center', white);
DrawFormattedText(w, 'Artificial', pos2, 'center', white);

Screen('DrawLines', w, xy, 3, color, center_screen,0)
end

% function my_drawfixation(w,center_screen,sx,sy);
function my_drawfixation(w,center_screen,sx,sy,color);
xy=[-1*round(sx/2) 0;round(sx/2) 0;...
    0 -1*round(sy/2);0 round(sy/2)]';
% Screen('DrawLines', w, xy, 3, [255 255 255], center_screen,0)
Screen('DrawLines', w, xy, 3, color, center_screen,0)
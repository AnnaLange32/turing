function my_drawdecision (w)

% randomizing position of choices
xpos = [300, 980]
r = randperm(2)
pos1 = xpos(r(1));
pos2 = xpos(r(2));


DrawFormattedText(w, 'Human', pos1, 'center', [255 255 255]);
DrawFormattedText(w, 'Artificial', pos2, 'center', [255 255 255]);

end

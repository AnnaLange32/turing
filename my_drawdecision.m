function my_drawdecision (w, rect, white)

% randomizing position of choices
xpos = [rect(3)*0.25 (rect(3)-rect(3)*0.25)];
r = randperm(2)
pos1 = xpos(r(1));
pos2 = xpos(r(2));


DrawFormattedText(w, 'Human', pos1, 'center', white);
DrawFormattedText(w, 'Artificial', pos2, 'center', white);

end

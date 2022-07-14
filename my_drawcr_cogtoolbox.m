function my_drawcr_cogtoolbox (w, rect, left_arrow, right_arrow, up_arrow)

displayText = 'Rate confidence about your previous decision. How confident are you about your choice?';
decText1 = 'Not at all confident';
decText2 = 'Slightly confident';
decText3 = 'Somewhat confident';
decText4 = 'Fairly confident';
decText5 = 'Extremely confident';

white = [125 125 125];
black =  [0 0 0];
red = [255 0 0]; % color 1 red

%rect = Screen('Rect',0);
answer = Likert(w, white, displayText, decText1, decText5, red, 4);

%rect = Screen('TextBounds', w, textString); %to get text size for text positioning

end

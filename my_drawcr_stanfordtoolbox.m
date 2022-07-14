function my_drawcr_stanfordtoolbox (w)

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
my_scaletext = {decText1, decText3, decText5}
answer = circleLikert(w,  [displayText], my_scaletext);

%rect = Screen('TextBounds', w, textString); %to get text size for text positioning

end

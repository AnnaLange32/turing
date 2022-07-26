function my_drawcr2 (w, rect, right_arrow, left_arrow, up_arrow, down_arrow)

% set sizes and positions for text and boxes

dim_cube = 80;
cube_no = 4;
free_space = rect(3) - dim_cube*cube_no;
gap_number = cube_no +1;
gap_size = free_space/gap_number;


sq1_pos = [(gap_size) (rect(4)/1.5) (gap_size+dim_cube) (rect(4)/1.5-dim_cube)];
sq2_pos = [(2*gap_size+dim_cube) (rect(4)/1.5) (2*gap_size+2*dim_cube) (rect(4)/1.5-dim_cube)];
decision_position=[(gap_size) (rect(4)/1.5) (gap_size+dim_cube) (rect(4)/1.5-dim_cube); (2*gap_size+dim_cube) (rect(4)/1.5) (2*gap_size+2*dim_cube) (rect(4)/1.5-dim_cube); (3*gap_size+2*dim_cube) (rect(4)/1.5) (3*gap_size+3*dim_cube) (rect(4)/1.5-dim_cube); (4*gap_size+3*dim_cube) (rect(4)/1.5) (4*gap_size+4*dim_cube) (rect(4)/1.5-dim_cube)]; %position for choice boxes 

% set colors

white = [125 125 125];
black =  [0 0 0];
green = [31 177 38]; % color 2 green

% set display text 

displayText = 'Rate confidence about your previous decision. How confident are you about your choice?';
decText1 = 'Extremely certain';
decText2 = 'Somewhat certain';
%decText3 = ' Neither certain nor uncertain';
decText4 = 'Sonewhat uncertain';
decText5 = 'Extremely uncertain';

% set fill color order

rectfill = [black; black; black; black];
rectfill1 = [green; black; black; black];
rectfill2 = [black; green; black; black];
rectfill3 = [black; black; green; black];
rectfill4 = [black; black; black; green];


%DrawFormattedText(w, displayText, 'center', rect(4)/3, [255 255 255]); %rec(4) chooses y2 element the division moves the text along this axis, 2 would be central, >2 is upper half
%Screen('FillRect', w,rectfill', decision_position');
%Screen('FrameRect', w, white, decision_position',5);
%DrawFormattedText(w, decText1, [decision_position(1,1)]',[decision_position(1,4)+ 1.5 * dim_cube]', white);
%DrawFormattedText(w, decText2, [decision_position(2,1)]', [decision_position(2,4)+ 1.5 * dim_cube]', white);
%DrawFormattedText(w, decText3,[decision_position(3,1)]', [decision_position(3,4)+ 1.5 * dim_cube]', white);
%DrawFormattedText(w, decText4, [decision_position(4,1)]', [decision_position(4,4)+ 1.5 * dim_cube]', white);
%DrawFormattedText(w, decText5, [decision_position(5,1)]', [decision_position(5,4)+ 1.5 * dim_cube]', white);
%Screen('Flip', w); % show instruction

% start decision loop

while 1
    
    DrawFormattedText(w, displayText, 'center', rect(4)/3, [255 255 255]); %rec(4) chooses y2 element the division moves the text along this axis, 2 would be central, >2 is upper half
    Screen('FillRect', w,rectfill', decision_position');
    Screen('FrameRect', w, white, decision_position',5);
    DrawFormattedText(w, decText1, [decision_position(1,1)]',[decision_position(1,4)+ 1.5 * dim_cube]', white);
    DrawFormattedText(w, decText2, [decision_position(2,1)]', [decision_position(2,4)+ 1.5 * dim_cube]', white);
    DrawFormattedText(w, decText4,[decision_position(3,1)]', [decision_position(3,4)+ 1.5 * dim_cube]', white);
    DrawFormattedText(w, decText5, [decision_position(4,1)]', [decision_position(4,4)+ 1.5 * dim_cube]', white);
    %DrawFormattedText(w, decText5, [decision_position(5,1)]', [decision_position(5,4)+ 1.5 * dim_cube]', white);
    Screen('Flip', w); % show next choice
    
    % check if choice confirmed
    [acc_time, keyCode, ~] = KbPressWait; % log time trigger received
    if find(keyCode) == down_arrow
        disp('keyboard / MRI trigger received');
        
        DrawFormattedText(w, displayText, 'center', rect(4)/3, [255 255 255]); %rec(4) chooses y2 element the division moves the text along this axis, 2 would be central, >2 is upper half
        Screen('FillRect', w,rectfill1', decision_position');
        Screen('FrameRect', w, white, decision_position',5);
        DrawFormattedText(w, decText1, [decision_position(1,1)]',[decision_position(1,4)+ 1.5 * dim_cube]', white);
        DrawFormattedText(w, decText2, [decision_position(2,1)]', [decision_position(2,4)+ 1.5 * dim_cube]', white);
        DrawFormattedText(w, decText4,[decision_position(3,1)]', [decision_position(3,4)+ 1.5 * dim_cube]', white);
        DrawFormattedText(w, decText5, [decision_position(4,1)]', [decision_position(4,4)+ 1.5 * dim_cube]', white);
        %DrawFormattedText(w, decText5, [decision_position(5,1)]', [decision_position(5,4)+ 1.5 * dim_cube]', white);
        Screen('Flip', w); % show empty instruction
        WaitSecs(1)
        break
        
    elseif find(keyCode) == right_arrow
        %find(keyCode) == left_arrow || find(keyCode) == right_arrow
        disp('keyboard / MRI trigger received');
          DrawFormattedText(w, displayText, 'center', rect(4)/3, [255 255 255]); %rec(4) chooses y2 element the division moves the text along this axis, 2 would be central, >2 is upper half
        Screen('FillRect', w,rectfill2', decision_position');
        Screen('FrameRect', w, white, decision_position',5);
        DrawFormattedText(w, decText1, [decision_position(1,1)]',[decision_position(1,4)+ 1.5 * dim_cube]', white);
        DrawFormattedText(w, decText2, [decision_position(2,1)]', [decision_position(2,4)+ 1.5 * dim_cube]', white);
        DrawFormattedText(w, decText4,[decision_position(3,1)]', [decision_position(3,4)+ 1.5 * dim_cube]', white);
        DrawFormattedText(w, decText5, [decision_position(4,1)]', [decision_position(4,4)+ 1.5 * dim_cube]', white);
        %DrawFormattedText(w, decText5, [decision_position(5,1)]', [decision_position(5,4)+ 1.5 * dim_cube]', white);
        Screen('Flip', w); % show next choice
        WaitSecs(1)
        break
    elseif find(keyCode) == up_arrow
        %find(keyCode) == left_arrow || find(keyCode) == right_arrow
        disp('keyboard / MRI trigger received');
          DrawFormattedText(w, displayText, 'center', rect(4)/3, [255 255 255]); %rec(4) chooses y2 element the division moves the text along this axis, 2 would be central, >2 is upper half
        Screen('FillRect', w,rectfill3', decision_position');
        Screen('FrameRect', w, white, decision_position',5);
        DrawFormattedText(w, decText1, [decision_position(1,1)]',[decision_position(1,4)+ 1.5 * dim_cube]', white);
        DrawFormattedText(w, decText2, [decision_position(2,1)]', [decision_position(2,4)+ 1.5 * dim_cube]', white);
        DrawFormattedText(w, decText4,[decision_position(3,1)]', [decision_position(3,4)+ 1.5 * dim_cube]', white);
        DrawFormattedText(w, decText5, [decision_position(4,1)]', [decision_position(4,4)+ 1.5 * dim_cube]', white);
        %DrawFormattedText(w, decText5, [decision_position(5,1)]', [decision_position(5,4)+ 1.5 * dim_cube]', white);
        Screen('Flip', w); % show next choice
        WaitSecs(1)
        break
   elseif find(keyCode) == left_arrow
        %find(keyCode) == left_arrow || find(keyCode) == right_arrow
        disp('keyboard / MRI trigger received');
          DrawFormattedText(w, displayText, 'center', rect(4)/3, [255 255 255]); %rec(4) chooses y2 element the division moves the text along this axis, 2 would be central, >2 is upper half
        Screen('FillRect', w,rectfill4', decision_position');
        Screen('FrameRect', w, white, decision_position',5);
        DrawFormattedText(w, decText1, [decision_position(1,1)]',[decision_position(1,4)+ 1.5 * dim_cube]', white);
        DrawFormattedText(w, decText2, [decision_position(2,1)]', [decision_position(2,4)+ 1.5 * dim_cube]', white);
        DrawFormattedText(w, decText4,[decision_position(3,1)]', [decision_position(3,4)+ 1.5 * dim_cube]', white);
        DrawFormattedText(w, decText5, [decision_position(4,1)]', [decision_position(4,4)+ 1.5 * dim_cube]', white);
        %DrawFormattedText(w, decText5, [decision_position(5,1)]', [decision_position(5,4)+ 1.5 * dim_cube]', white);
        Screen('Flip', w); % show next choice
        WaitSecs(1)
        break
        
    end

end    
    
  



    
end

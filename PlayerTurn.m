%This is the function that allows the player to make a move in the
%tictactoe script. The function takes two inputs, the variable o_turn,
%which if equal to one means it is the players turn and the function will
%execute, and the current matrix gameboard labeled matgame. The output of
%this function returns the new updated gameboard matrix, matgame, with the
%users new move back to the tic tac toe script. 
%This function allows the user to click on the plot, makes sure the spot is
%not already taken, and is a valid spot on the gameboard to be placed. If
%either of these is not true, it gives an error message and makes the user
%select another spot. 

function [matgame] = PlayerTurn(o_turn,matgame)
 xmat=0;ymat=0;
while o_turn==1
    hold on
    xlabel('It''s Your Turn. Click Where You Want To Place Your Circle')
    %Their First Move
    [xinput,yinput] = ginput(1);
    x=ceil(xinput);y=ceil(yinput);
    
    %Illegal Placement Error
    if xinput<=0|yinput<=0|xinput>3|yinput>3
        uiwait(errordlg('You Must Click A Square On The Board'))
        continue
    end
    
    %Converting Board to Matrix
    if [x,y]==[1,3]
        xmat=1, ymat=1;
    elseif [x,y]==[2,3]
        xmat=1,ymat=2;
    elseif [x,y]==[3,3]
        xmat=1,ymat=3;
    elseif [x,y]==[1,2]
        xmat=2,ymat=1;
    elseif [x,y]==[2,2]
        xmat=2,ymat=2;
    elseif [x,y]==[3,2]
        xmat=2,ymat=3;
    elseif [x,y]==[1,1]
        xmat=3,ymat=1;
    elseif [x,y]==[2,1]
        xmat=3,ymat=2;
    elseif [x,y]==[3,1]
        xmat=3,ymat=3;
    end
    %Not Playing on Another Piece
    if matgame(xmat,ymat)~=-1
        uiwait(errordlg('You Must Click An Empty Square'))
        continue
    else %If legal move, plot where they clicked with an 'O'. 
        matgame(xmat,ymat) = 0;
        plot(x-.5,y-.5,'ro','MarkerSize',100);
        o_turn=0;
        pause(.3)
    end
end
end



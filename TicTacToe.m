%TIC TAC TOE
%Brian Diefenbach, October 15th
%This code allows you to play tic tac toe against the computer, with the 
%option of going first or second. Good luck!
%The code is divded into two sections, one if the computer goes first, and
%one if the player chooses to go first. The abbreviation C1 stands for
%computer first move, while P3 would stand for players 3rd move. 
%The game matrix, matgame, updates with 0's for the players turn, and 1's
%for the computer. While the gameboard updates with X's for the computer
%and O's for the player. 

%Welcome message and asking if they want to play
cont = questdlg('Howdy there. Welcome to Tic Tac Toe! Care to play?','Tic Tac Toe','Yes','No','Yes');
switch cont;
    case 'Yes';
        cont = 1;
    case 'No';
        cont = 0;
end

%The game
wincount=0;
while cont == 1;
    playing=1;
    while playing==1
        % Setup the gameboard
        close all
        figure('Name','Tic Tac Toe GameBoard');
        axis([0 3 0 3])
        xticks([0,1,2,3])
        yticks([0,1,2,3])
        grid on
        set(gca, 'XTickLabel', [])
        set(gca, 'YTickLabel', [])
        
        
        %Matrix of Gameboard -1=Not Used, 0=circle, 1=x
        matgame = [-1,-1,-1; -1,-1,-1;-1,-1,-1];
        
        %Asking Who Wants to Go First
        first = questdlg('Who do you want to go first?','Who Starts?','Computer','Me','Computer');
        switch first;
            case 'Computer';
                first = 1;
            case 'Me';
                first = 0;
        end
        
        %Beginning of Computer First
        if first==1;
            %Computers First Move In Position 1
            hold on
            plot(0.5,2.5,'bx','MarkerSize',100)
            matgame(1,1) = 1
            
            %Players 1st Turn
            [matgame]= PlayerTurn(1,matgame);
            
            %If P1 at 2.
            if matgame(1,2)==0;
                hold on
                plot(1.5,1.5,'bx','MarkerSize',100)
                matgame(2,2) = 1;
                %P2
                [matgame]= PlayerTurn(1,matgame);
                %Computer Response to P2 Turn if 2
                if matgame(3,3)==-1;
                    hold on
                    plot(2.5,0.5,'bx','MarkerSize',100)
                    matgame(3,3) = 1;
                    wincount=wincount+1;
                    xlabel([])
                    break
                elseif matgame(3,3)~=-1;
                    hold on
                    plot(0.5,0.5,'bx','MarkerSize',100)
                    matgame(3,1) = 1;
                    %Player 3rd Turn
                    [matgame]= PlayerTurn(1,matgame);
                    %Computer Respone to P3 if 2
                    if matgame(1,3)==-1;
                        hold on
                        plot(2.5,2.5,'bx','MarkerSize',100)
                        matgame(1,3) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    elseif matgame(2,1)==-1;
                        hold on
                        plot(0.5,1.5,'bx','MarkerSize',100)
                        matgame(2,1) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    end
                end
            end %End for P1 at 2
            
            %If P1 at 3
            if matgame(1,3)==0
                hold on
                plot(2.5,0.5,'bx','MarkerSize',100)
                matgame(3,3) = 1
                %P2
                [matgame]= PlayerTurn(1,matgame);
                %Computer response to P2 at 5
                if matgame(2,2)==0
                    hold on
                    plot(0.5,0.5,'bx','MarkerSize',100)
                    matgame(3,1) = 1;
                    [matgame]= PlayerTurn(1,matgame);
                    if matgame(2,1)==-1
                        hold on
                        plot(0.5,1.5,'bx','MarkerSize',100)
                        matgame(2,1) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else matgame(3,2)==-1
                        hold on
                        plot(1.5,0.5,'bx','MarkerSize',100)
                        matgame(3,2) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    end
                else %Computer response to P2 not at 5
                    plot(1.5,1.5,'bx','MarkerSize',100)
                    matgame(2,2) = 1;
                    wincount=wincount+1;
                    xlabel([])
                    break
                end
            end%End for P1 at 3
            
            %If P1 at 4
            if matgame(2,1)==0
                hold on
                plot(1.5,1.5,'bx','MarkerSize',100)
                matgame(2,2) = 1;
                %P2
                [matgame]= PlayerTurn(1,matgame);
                if matgame(3,3)==-1
                    hold on
                    plot(2.5,0.5,'bx','MarkerSize',100)
                    matgame(3,3) = 1;
                    wincount=wincount+1;
                    xlabel([])
                    break
                elseif matgame(3,3)~=-1
                    hold on
                    plot(2.5,2.5,'bx','MarkerSize',100)
                    matgame(1,3) = 1;
                    %P3
                    [matgame]= PlayerTurn(1,matgame);
                    if matgame(1,2)==-1
                        hold on
                        plot(1.5,2.5,'bx','MarkerSize',100)
                        matgame(1,2) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    elseif matgame(3,1)==-1
                        hold on
                        plot(0.5,0.5,'bx','MarkerSize',100)
                        matgame(3,1) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    end
                end
            end %End P1 at 4
            
            %If P1 at 5
            if matgame(2,2)==0
                hold on
                plot(2.5,2.5,'bx','MarkerSize',100)
                matgame(1,3) = 1;
                %P2
                [matgame]= PlayerTurn(1,matgame);
                if matgame(1,2)==-1
                    hold on
                    plot(1.5,2.5,'bx','MarkerSize',100)
                    matgame(1,2) = 1;
                    wincount=wincount+1;
                    xlabel([])
                    break
                elseif matgame(1,2)==0 %P2 at 2
                    hold on
                    plot(1.5,0.5,'bx','MarkerSize',100)
                    matgame(3,2) = 1;
                    %P3
                    [matgame]= PlayerTurn(1,matgame);
                    if matgame(2,1)==0
                        hold on
                        plot(2.5,1.5,'bx','MarkerSize',100)
                        matgame(2,3) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(3,3)==-1
                            hold on
                            plot(2.5,0.5,'bx','MarkerSize',100)
                            matgame(3,3) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else
                            hold on
                            plot(0.5,0.5,'bx','MarkerSize',100)
                            matgame(3,1) = 1;
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    elseif matgame(2,3)==0
                        hold on
                        plot(0.5,1.5,'bx','MarkerSize',100)
                        matgame(2,1) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(3,1)==-1
                            hold on
                            plot(0.5,0.5,'bx','MarkerSize',100)
                            matgame(3,1) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else
                            hold on
                            plot(2.5,0.5,'bx','MarkerSize',100)
                            matgame(3,3) = 1;
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    elseif matgame(3,3)==0
                        hold on
                        plot(0.5,0.5,'bx','MarkerSize',100)
                        matgame(3,1) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(2,1)==-1
                            hold on
                            plot(0.5,1.5,'bx','MarkerSize',100)
                            matgame(2,1) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else
                            hold on
                            plot(2.5,1.5,'bx','MarkerSize',100)
                            matgame(2,3) = 1;
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    elseif matgame(3,1)==0
                        hold on
                        plot(2.5,0.5,'bx','MarkerSize',100)
                        matgame(3,1) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(2,3)==-1
                            hold on
                            plot(2.5,1.5,'bx','MarkerSize',100)
                            matgame(2,3) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else
                            hold on
                            plot(0.5,1.5,'bx','MarkerSize',100)
                            matgame(2,1) = 1;
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                end
            end %End P1 at 5
            
            %P1 at 6
            if matgame(2,3)==0
                hold on
                plot(0.5,0.5,'bx','MarkerSize',100)
                matgame(3,1) = 1;
                %P2
                [matgame]= PlayerTurn(1,matgame);
                if matgame(2,1)==0
                    hold on
                    plot(1.5,1.5,'bx','MarkerSize',100)
                    matgame(2,2) = 1;
                    %P2
                    [matgame]= PlayerTurn(1,matgame);
                    if matgame(1,3)==-1
                        hold on
                        plot(2.5,2.5,'bx','MarkerSize',100)
                        matgame(1,3) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else
                        hold on
                        plot(2.5,0.5,'bx','MarkerSize',100)
                        matgame(3,3) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    end
                else
                    hold on
                    plot(0.5,1.5,'bx','MarkerSize',100)
                    matgame(2,1) = 1;
                    wincount=wincount+1;
                    xlabel([])
                    break
                end
            end %End P1 at 6
            
            %P1 in 7
            if matgame(3,1)==0
                hold on
                plot(2.5,0.5,'bx','MarkerSize',100)
                matgame(3,3) = 1;
                %P2
                [matgame]= PlayerTurn(1,matgame);
                if matgame(2,2)==-1
                    hold on
                    plot(1.5,1.5,'bx','MarkerSize',100)
                    matgame(2,2) = 1;
                    wincount=wincount+1;
                    xlabel([])
                    break
                else
                    hold on
                    plot(2.5,2.5,'bx','MarkerSize',100)
                    matgame(1,3) = 1;
                    %P3
                    [matgame]= PlayerTurn(1,matgame);
                    if matgame(1,2)==-1
                        hold on
                        plot(1.5,2.5,'bx','MarkerSize',100)
                        matgame(1,2) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else
                        hold on
                        plot(2.5,1.5,'bx','MarkerSize',100)
                        matgame(2,3) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    end
                end
            end %End P1 at 7
            
            %P1 at 8
            if matgame(3,2)==0
                hold on
                plot(2.5,2.5,'bx','MarkerSize',100)
                matgame(1,3) = 1;
                %P2
                [matgame]= PlayerTurn(1,matgame);
                if matgame(1,2)==-1
                    hold on
                    plot(1.5,2.5,'bx','MarkerSize',100)
                    matgame(1,2) = 1;
                    wincount=wincount+1;
                    xlabel([])
                    break
                else
                    hold on
                    plot(1.5,1.5,'bx','MarkerSize',100)
                    matgame(2,2) = 1;
                    %P3
                    [matgame]= PlayerTurn(1,matgame);
                    if matgame(3,1)==-1
                        hold on
                        plot(0.5,0.5,'bx','MarkerSize',100)
                        matgame(3,1) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else
                        hold on
                        plot(2.5,0.5,'bx','MarkerSize',100)
                        matgame(3,3) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    end
                end
            end %End P1 at 8
            
            %P1 at 9
            if matgame(3,3)==0
                hold on
                plot(0.5,0.5,'bx','MarkerSize',100)
                matgame(3,1) = 1;
                %P2
                [matgame]= PlayerTurn(1,matgame);
                if matgame(2,1)==-1
                    hold on
                    plot(0.5,1.5,'bx','MarkerSize',100)
                    matgame(2,1) = 1;
                    wincount=wincount+1;
                    xlabel([])
                    break
                else
                    hold on
                    plot(2.5,2.5,'bx','MarkerSize',100)
                    matgame(1,3) = 1;
                    %P3
                    [matgame]= PlayerTurn(1,matgame);
                    if matgame(1,2)==-1
                        hold on
                        plot(1.5,2.5,'bx','MarkerSize',100)
                        matgame(1,2) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else
                        hold on
                        plot(1.5,1.5,'bx','MarkerSize',100)
                        matgame(2,2) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    end
                end
            end %End P1 at 9. End of Computer Going First
            
            
            %Player gets to go first
        elseif first==0
            %P1
            [matgame]= PlayerTurn(1,matgame);
            if matgame(1,1)==0  %C1 if P1 is at 1
                hold on
                plot(1.5,1.5,'bx','MarkerSize',100)
                matgame(2,2) = 1;
                [matgame]= PlayerTurn(1,matgame);
                if matgame(1,2)==0 %P2 at 2
                    hold on
                    plot(2.5,2.5,'bx','MarkerSize',100)
                    matgame(1,3) = 1;
                    [matgame]= PlayerTurn(1,matgame);
                    if matgame(3,1)==-1
                        hold on
                        plot(0.5,0.5,'bx','MarkerSize',100)
                        matgame(3,1) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 7
                        hold on
                        plot(0.5,1.5,'bx','MarkerSize',100)
                        matgame(2,1) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(2,3)==-1
                            hold on
                            plot(2.5,1.5,'bx','MarkerSize',100)
                            matgame(2,3) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else
                            hold on
                            plot(1.5,0.5,'bx','MarkerSize',100)
                            matgame(3,2) = 1;
                            [matgame]= PlayerTurn(1,matgame);%P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                elseif matgame(1,3)==0 %P2 at 3
                    hold on
                    plot(1.5,2.5,'bx','MarkerSize',100)
                    matgame(1,2) = 1;
                    [matgame]= PlayerTurn(1,matgame);
                    if matgame(3,2)==-1
                        hold on
                        plot(1.5,0.5,'bx','MarkerSize',100)
                        matgame(3,2) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 8
                        hold on
                        plot(0.5,1.5,'bx','MarkerSize',100)
                        matgame(2,1) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(2,3)==-1
                            hold on
                            plot(2.5,1.5,'bx','MarkerSize',100)
                            matgame(2,3) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 6
                            hold on
                            plot(2.5,0.5,'bx','MarkerSize',100)
                            matgame(3,3) = 1;
                            [matgame]= PlayerTurn(1,matgame); %P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                elseif matgame(2,1)==0 %P2 at 4
                    hold on
                    plot(0.5,0.5,'bx','MarkerSize',100)
                    matgame(3,1) = 1;
                    [matgame]= PlayerTurn(1,matgame);
                    if matgame(1,3)==-1
                        hold on
                        plot(2.5,2.5,'bx','MarkerSize',100)
                        matgame(1,3) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 3
                        hold on
                        plot(1.5,2.5,'bx','MarkerSize',100)
                        matgame(1,2) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(3,2)==-1
                            hold on
                            plot(1.5,0.5,'bx','MarkerSize',100)
                            matgame(3,2) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 8
                            hold on
                            plot(2.5,0.5,'bx','MarkerSize',100)
                            matgame(3,3) = 1;
                            [matgame]= PlayerTurn(1,matgame);
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                elseif matgame(2,3)==0 %P2 at 6
                    hold on
                    plot(1.5,2.5,'bx','MarkerSize',100)
                    matgame(1,2) = 1;
                    [matgame]= PlayerTurn(1,matgame);
                    if matgame(3,2)==-1
                        hold on
                        plot(1.5,0.5,'bx','MarkerSize',100)
                        matgame(3,2) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 8
                        hold on
                        plot(2.5,2.5,'bx','MarkerSize',100)
                        matgame(1,3) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(3,1)==-1
                            hold on
                            plot(0.5,0.5,'bx','MarkerSize',100)
                            matgame(3,1) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 7
                            hold on
                            plot(0.5,1.5,'bx','MarkerSize',100)
                            matgame(2,1) = 1;
                            [matgame]= PlayerTurn(1,matgame);
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                elseif matgame(3,1)==0 %P2 at 7
                    hold on
                    plot(0.5,1.5,'bx','MarkerSize',100)
                    matgame(2,1) = 1;
                    [matgame]= PlayerTurn(1,matgame);
                    if matgame(2,3)==-1
                        hold on
                        plot(2.5,1.5,'bx','MarkerSize',100)
                        matgame(2,3) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 6
                        hold on
                        plot(1.5,0.5,'bx','MarkerSize',100)
                        matgame(3,2) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(1,2)==-1
                            hold on
                            plot(1.5,2.5,'bx','MarkerSize',100)
                            matgame(1,2) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 2
                            hold on
                            plot(2.5,2.5,'bx','MarkerSize',100)
                            matgame(1,3) = 1;
                            [matgame]= PlayerTurn(1,matgame); %P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                elseif matgame(3,2)==0 %P2 at 8
                    hold on
                    plot(0.5,1.5,'bx','MarkerSize',100)
                    matgame(2,1) = 1;
                    [matgame]= PlayerTurn(1,matgame);
                    if matgame(2,3)==-1
                        hold on
                        plot(2.5,1.5,'bx','MarkerSize',100)
                        matgame(2,3) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 6
                        hold on
                        plot(2.5,2.5,'bx','MarkerSize',100)
                        matgame(1,3) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(3,1)==-1
                            hold on
                            plot(0.5,0.5,'bx','MarkerSize',100)
                            matgame(3,1) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 7
                            hold on
                            plot(2.5,0.5,'bx','MarkerSize',100)
                            matgame(3,3) = 1;
                            [matgame]= PlayerTurn(1,matgame); %P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                elseif matgame(3,3)==0 %P2 at 9
                    hold on
                    plot(1.5,2.5,'bx','MarkerSize',100)
                    matgame(1,2) = 1;
                    [matgame]= PlayerTurn(1,matgame);
                    if matgame(3,2)==-1
                        hold on
                        plot(1.5,0.5,'bx','MarkerSize',100)
                        matgame(3,2) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 8
                        hold on
                        plot(0.5,0.5,'bx','MarkerSize',100)
                        matgame(3,1) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(1,3)==-1
                            hold on
                            plot(2.5,2.5,'bx','MarkerSize',100)
                            matgame(1,3) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 3
                            hold on
                            plot(2.5,1.5,'bx','MarkerSize',100)
                            matgame(2,3) = 1;
                            [matgame]= PlayerTurn(1,matgame); %P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                end
            elseif matgame(1,2)==0 %C1 if P1 is at 2
                hold on
                plot(1.5,1.5,'bx','MarkerSize',100)
                matgame(2,2) = 1;
                [matgame]= PlayerTurn(1,matgame)
                if matgame(1,1)==0 %P2 at 1
                    hold on
                    plot(2.5,2.5,'bx','MarkerSize',100)
                    matgame(1,3) = 1;
                    [matgame]= PlayerTurn(1,matgame)
                    if matgame(3,1)==-1
                        hold on
                        plot(0.5,0.5,'bx','MarkerSize',100)
                        matgame(3,1) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 7
                        hold on
                        plot(0.5,1.5,'bx','MarkerSize',100)
                        matgame(2,1) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(2,3)==-1
                            hold on
                            plot(2.5,1.5,'bx','MarkerSize',100)
                            matgame(2,3) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 6
                            hold on
                            plot(2.5,0.5,'bx','MarkerSize',100)
                            matgame(3,3) = 1;
                            [matgame]= PlayerTurn(1,matgame); %P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                elseif matgame(1,3)==0 %P2 at 3
                    hold on
                    plot(0.5,2.5,'bx','MarkerSize',100)
                    matgame(1,1) = 1;
                    [matgame]= PlayerTurn(1,matgame)
                    if matgame(3,3)==-1
                        hold on
                        plot(2.5,0.5,'bx','MarkerSize',100)
                        matgame(3,3) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 9
                        hold on
                        plot(2.5,1.5,'bx','MarkerSize',100)
                        matgame(2,3) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(2,1)==-1
                            hold on
                            plot(0.5,1.5,'bx','MarkerSize',100)
                            matgame(2,1) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 4
                            hold on
                            plot(1.5,0.5,'bx','MarkerSize',100)
                            matgame(3,2) = 1;
                            [matgame]= PlayerTurn(1,matgame); %P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                elseif matgame(2,1)==0 %P2 at 4
                    hold on
                    plot(0.5,0.5,'bx','MarkerSize',100)
                    matgame(3,1) = 1;
                    [matgame]= PlayerTurn(1,matgame)
                    if matgame(1,3)==-1
                        hold on
                        plot(2.5,2.5,'bx','MarkerSize',100)
                        matgame(1,3) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 3
                        hold on
                        plot(1.5,2.5,'bx','MarkerSize',100)
                        matgame(1,2) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(3,2)==-1
                            hold on
                            plot(1.5,0.5,'bx','MarkerSize',100)
                            matgame(3,2) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 8
                            hold on
                            plot(2.5,0.5,'bx','MarkerSize',100)
                            matgame(3,3) = 1;
                            [matgame]= PlayerTurn(1,matgame); %P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                elseif matgame(2,3)==0 %P2 at 6
                    hold on
                    plot(2.5,0.5,'bx','MarkerSize',100)
                    matgame(3,3) = 1;
                    [matgame]= PlayerTurn(1,matgame)
                    if matgame(1,1)==-1
                        hold on
                        plot(0.5,2.5,'bx','MarkerSize',100)
                        matgame(1,1) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 1
                        hold on
                        plot(2.5,2.5,'bx','MarkerSize',100)
                        matgame(1,3) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(3,1)==-1
                            hold on
                            plot(0.5,0.5,'bx','MarkerSize',100)
                            matgame(3,1) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 7
                            hold on
                            plot(0.5,1.5,'bx','MarkerSize',100)
                            matgame(2,1) = 1;
                            [matgame]= PlayerTurn(1,matgame); %P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                elseif matgame(3,1)==0 %P2 at 7
                    hold on
                    plot(0.5,1.5,'bx','MarkerSize',100)
                    matgame(2,1) = 1;
                    [matgame]= PlayerTurn(1,matgame)
                    if matgame(2,3)==-1
                        hold on
                        plot(2.5,1.5,'bx','MarkerSize',100)
                        matgame(2,3) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 6
                        hold on
                        plot(2.5,0.5,'bx','MarkerSize',100)
                        matgame(3,3) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(1,1)==-1
                            hold on
                            plot(0.5,2.5,'bx','MarkerSize',100)
                            matgame(1,1) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 1
                            hold on
                            plot(2.5,2.5,'bx','MarkerSize',100)
                            matgame(1,3) = 1;
                            [matgame]= PlayerTurn(1,matgame); %P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                elseif matgame(3,2)==0 %P2 at 8
                    hold on
                    plot(2.5,2.5,'bx','MarkerSize',100)
                    matgame(1,3) = 1;
                    [matgame]= PlayerTurn(1,matgame)
                    if matgame(3,1)==-1
                        hold on
                        plot(0.5,0.5,'bx','MarkerSize',100)
                        matgame(3,1) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 7
                        hold on
                        plot(2.5,0.5,'bx','MarkerSize',100)
                        matgame(3,3) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(1,1)==-1
                            hold on
                            plot(0.5,2.5,'bx','MarkerSize',100)
                            matgame(1,1) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        elseif matgame(2,3)==-1
                            hold on
                            plot(2.5,1.5,'bx','MarkerSize',100)
                            matgame(2,3) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        end
                    end
                elseif matgame(3,3)==0 %P2 at 9
                    hold on
                    plot(2.5,1.5,'bx','MarkerSize',100)
                    matgame(2,3) = 1;
                    [matgame]= PlayerTurn(1,matgame)
                    if matgame(2,1)==-1
                        hold on
                        plot(0.5,1.5,'bx','MarkerSize',100)
                        matgame(2,1) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 4
                        hold on
                        plot(2.5,2.5,'bx','MarkerSize',100)
                        matgame(1,3) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(3,1)==-1
                            hold on
                            plot(0.5,0.5,'bx','MarkerSize',100)
                            matgame(3,1) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 7
                            hold on
                            plot(1.5,0.5,'bx','MarkerSize',100)
                            matgame(3,2) = 1;
                            [matgame]= PlayerTurn(1,matgame); %P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                end
            elseif matgame(1,3)==0 %C1 if P1 is at 3
                hold on
                plot(1.5,1.5,'bx','MarkerSize',100)
                matgame(2,2) = 1;
                [matgame]= PlayerTurn(1,matgame)
                if matgame(1,1)==0 %P2 at 1
                    hold on
                    plot(1.5,2.5,'bx','MarkerSize',100)
                    matgame(1,2) = 1;
                    [matgame]= PlayerTurn(1,matgame)
                    if matgame(3,2)==-1
                        hold on
                        plot(1.5,0.5,'bx','MarkerSize',100)
                        matgame(3,2) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 8
                        hold on
                        plot(0.5,1.5,'bx','MarkerSize',100)
                        matgame(2,1) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(2,3)==-1
                            hold on
                            plot(2.5,1.5,'bx','MarkerSize',100)
                            matgame(2,3) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 6
                            hold on
                            plot(2.5,0.5,'bx','MarkerSize',100)
                            matgame(3,3) = 1;
                            [matgame]= PlayerTurn(1,matgame); %P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                elseif matgame(1,2)==0 %P2 at 2
                    hold on
                    plot(0.5,2.5,'bx','MarkerSize',100)
                    matgame(1,1) = 1;
                    [matgame]= PlayerTurn(1,matgame)
                    if matgame(3,3)==-1
                        hold on
                        plot(2.5,0.5,'bx','MarkerSize',100)
                        matgame(3,3) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 9
                        hold on
                        plot(2.5,1.5,'bx','MarkerSize',100)
                        matgame(2,3) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(2,1)==-1
                            hold on
                            plot(0.5,1.5,'bx','MarkerSize',100)
                            matgame(2,1) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 4
                            hold on
                            plot(1.5,0.5,'bx','MarkerSize',100)
                            matgame(3,2) = 1;
                            [matgame]= PlayerTurn(1,matgame); %P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                elseif matgame(2,1)==0 %P2 at 4
                    hold on
                    plot(1.5,2.5,'bx','MarkerSize',100)
                    matgame(1,2) = 1;
                    [matgame]= PlayerTurn(1,matgame)
                    if matgame(3,2)==-1
                        hold on
                        plot(1.5,0.5,'bx','MarkerSize',100)
                        matgame(3,2) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 8
                        hold on
                        plot(2.5,0.5,'bx','MarkerSize',100)
                        matgame(3,3) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(1,1)==-1
                            hold on
                            plot(0.5,2.5,'bx','MarkerSize',100)
                            matgame(1,1) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 1
                            hold on
                            plot(0.5,0.5,'bx','MarkerSize',100)
                            matgame(3,1) = 1;
                            [matgame]= PlayerTurn(1,matgame); %P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                elseif matgame(2,3)==0 %P2 at 6
                    hold on
                    plot(2.5,0.5,'bx','MarkerSize',100)
                    matgame(3,3) = 1;
                    [matgame]= PlayerTurn(1,matgame)
                    if matgame(1,1)==-1
                        hold on
                        plot(0.5,2.5,'bx','MarkerSize',100)
                        matgame(1,1) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 1
                        hold on
                        plot(1.5,2.5,'bx','MarkerSize',100)
                        matgame(1,2) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(3,2)==-1
                            hold on
                            plot(1.5,0.5,'bx','MarkerSize',100)
                            matgame(3,2) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 8
                            hold on
                            plot(0.5,1.5,'bx','MarkerSize',100)
                            matgame(2,1) = 1;
                            [matgame]= PlayerTurn(1,matgame); %P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                elseif matgame(3,1)==0 %P2 at 7
                    hold on
                    plot(0.5,1.5,'bx','MarkerSize',100)
                    matgame(2,1) = 1;
                    [matgame]= PlayerTurn(1,matgame)
                    if matgame(2,2)==-1
                        hold on
                        plot(2.5,1.5,'bx','MarkerSize',100)
                        matgame(2,2) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 6
                        hold on
                        plot(2.5,0.5,'bx','MarkerSize',100)
                        matgame(3,3) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(1,1)==-1
                            hold on
                            plot(0.5,2.5,'bx','MarkerSize',100)
                            matgame(1,1) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 1
                            hold on
                            plot(1.5,2.5,'bx','MarkerSize',100)
                            matgame(1,2) = 1;
                            [matgame]= PlayerTurn(1,matgame); %P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                elseif matgame(3,2)==0 %P2 at 8
                    hold on
                    plot(2.5,1.5,'bx','MarkerSize',100)
                    matgame(2,3) = 1;
                    [matgame]= PlayerTurn(1,matgame)
                    if matgame(2,1)==-1
                        hold on
                        plot(0.5,1.5,'bx','MarkerSize',100)
                        matgame(2,1) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 4
                        hold on
                        plot(0.5,2.5,'bx','MarkerSize',100)
                        matgame(1,1) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(3,3)==-1
                            hold on
                            plot(2.5,0.5,'bx','MarkerSize',100)
                            matgame(3,3) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 9
                            hold on
                            plot(0.5,0.5,'bx','MarkerSize',100)
                            matgame(3,1) = 1;
                            [matgame]= PlayerTurn(1,matgame); %P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                elseif matgame(3,3)==0%P2 at 9
                    hold on
                    plot(2.5,1.5,'bx','MarkerSize',100)
                    matgame(2,3) = 1;
                    [matgame]= PlayerTurn(1,matgame)
                    if matgame(2,1)==-1
                        hold on
                        plot(0.5,1.5,'bx','MarkerSize',100)
                        matgame(2,1) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 4
                        hold on
                        plot(1.5,2.5,'bx','MarkerSize',100)
                        matgame(1,2) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(3,2)==-1
                            hold on
                            plot(1.5,0.5,'bx','MarkerSize',100)
                            matgame(3,2) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 8
                            hold on
                            plot(0.5,0.5,'bx','MarkerSize',100)
                            matgame(3,1) = 1;
                            [matgame]= PlayerTurn(1,matgame); %P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                end
            elseif matgame(2,1)==0 %C1 if P1 is at 4
                hold on
                plot(1.5,1.5,'bx','MarkerSize',100)
                matgame(2,2) = 1;
                [matgame]= PlayerTurn(1,matgame)
                if matgame(1,1)==0 %P2 at 1
                    hold on
                    plot(0.5,0.5,'bx','MarkerSize',100)
                    matgame(3,1) = 1;
                    [matgame]= PlayerTurn(1,matgame)
                    if matgame(1,3)==-1
                        hold on
                        plot(2.5,2.5,'bx','MarkerSize',100)
                        matgame(1,3) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 3
                        hold on
                        plot(1.5,2.5,'bx','MarkerSize',100)
                        matgame(1,2) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(3,2)==-1
                            hold on
                            plot(1.5,0.5,'bx','MarkerSize',100)
                            matgame(3,2) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 8
                            hold on
                            plot(2.5,0.5,'bx','MarkerSize',100)
                            matgame(3,3) = 1;
                            [matgame]= PlayerTurn(1,matgame); %P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                elseif matgame(1,2)==0 %P2 at 2
                    hold on
                    plot(0.5,2.5,'bx','MarkerSize',100)
                    matgame(1,1) = 1;
                    [matgame]= PlayerTurn(1,matgame)
                    if matgame(3,3)==-1
                        hold on
                        plot(2.5,0.5,'bx','MarkerSize',100)
                        matgame(3,3) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 9
                        hold on
                        plot(0.5,0.5,'bx','MarkerSize',100)
                        matgame(3,1) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(1,3)==-1
                            hold on
                            plot(2.5,2.5,'bx','MarkerSize',100)
                            matgame(1,3) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 3
                            hold on
                            plot(2.5,1.5,'bx','MarkerSize',100)
                            matgame(2,3) = 1;
                            [matgame]= PlayerTurn(1,matgame); %P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                elseif matgame(1,3)==0%P2 at 3
                    hold on
                    plot(1.5,2.5,'bx','MarkerSize',100)
                    matgame(1,2) = 1;
                    [matgame]= PlayerTurn(1,matgame)
                    if matgame(3,2)==-1
                        hold on
                        plot(1.5,0.5,'bx','MarkerSize',100)
                        matgame(3,2) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 8
                        hold on
                        plot(2.5,0.5,'bx','MarkerSize',100)
                        matgame(3,3) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(1,1)==-1
                            hold on
                            plot(0.5,2.5,'bx','MarkerSize',100)
                            matgame(1,1) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 1
                            hold on
                            plot(0.5,0.5,'bx','MarkerSize',100)
                            matgame(3,1) = 1;
                            [matgame]= PlayerTurn(1,matgame); %P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                elseif matgame(2,3)==0 %P2 at 6
                    hold on
                    plot(1.5,2.5,'bx','MarkerSize',100)
                    matgame(1,2) = 1;
                    [matgame]= PlayerTurn(1,matgame)
                    if matgame(3,2)==-1
                        hold on
                        plot(1.5,0.5,'bx','MarkerSize',100)
                        matgame(3,2) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 8
                        hold on
                        plot(2.5,2.5,'bx','MarkerSize',100)
                        matgame(1,3) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(1,1)==-1
                            hold on
                            plot(0.5,2.5,'bx','MarkerSize',100)
                            matgame(1,1) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        elseif matgame(3,1)==-1
                            hold on
                            plot(0.5,0.5,'bx','MarkerSize',100)
                            matgame(3,1) = 1;
                            wincount=wincount+1;
                            xlabel([]);
                            break
                        end
                    end
                elseif matgame(3,1)==0 %P2 at 7
                    hold on
                    plot(0.5,2.5,'bx','MarkerSize',100)
                    matgame(1,1) = 1;
                    [matgame]= PlayerTurn(1,matgame)
                    if matgame(3,3)==-1
                        hold on
                        plot(2.5,0.5,'bx','MarkerSize',100)
                        matgame(3,3) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 9
                        hold on
                        plot(1.5,0.5,'bx','MarkerSize',100)
                        matgame(3,2) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(1,2)==-1
                            hold on
                            plot(1.5,2.5,'bx','MarkerSize',100)
                            matgame(1,2) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 2
                            hold on
                            plot(2.5,2.5,'bx','MarkerSize',100)
                            matgame(1,3) = 1;
                            [matgame]= PlayerTurn(1,matgame); %P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                elseif matgame(3,2)==0 %P2 at 8
                    hold on
                    plot(0.5,0.5,'bx','MarkerSize',100)
                    matgame(3,1) = 1;
                    [matgame]= PlayerTurn(1,matgame)
                    if matgame(1,3)==-1
                        hold on
                        plot(2.5,2.5,'bx','MarkerSize',100)
                        matgame(1,3) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 3
                        hold on
                        plot(2.5,0.5,'bx','MarkerSize',100)
                        matgame(3,3) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(1,1)==-1
                            hold on
                            plot(0.5,2.5,'bx','MarkerSize',100)
                            matgame(1,1) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 1
                            hold on
                            plot(1.5,2.5,'bx','MarkerSize',100)
                            matgame(1,2) = 1;
                            [matgame]= PlayerTurn(1,matgame); %P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                elseif matgame(3,3)==0 %P2 at 9
                    hold on
                    plot(1.5,0.5,'bx','MarkerSize',100)
                    matgame(3,2) = 1;
                    [matgame]= PlayerTurn(1,matgame)
                    if matgame(1,2)==-1
                        hold on
                        plot(1.5,2.5,'bx','MarkerSize',100)
                        matgame(1,2) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 2
                        hold on
                        plot(2.5,2.5,'bx','MarkerSize',100)
                        matgame(1,3) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(3,1)==-1
                            hold on
                            plot(0.5,0.5,'bx','MarkerSize',100)
                            matgame(3,1) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 7
                            hold on
                            plot(0.5,2.5,'bx','MarkerSize',100)
                            matgame(1,1) = 1;
                            [matgame]= PlayerTurn(1,matgame); %P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                end
            elseif matgame(2,2)==0 %C1 if P1 is at 5
                hold on
                plot(2.5,2.5,'bx','MarkerSize',100)
                matgame(1,3) = 1;
                [matgame]= PlayerTurn(1,matgame);%P2
                if matgame(1,1)==0 %P2 at 1
                    hold on
                    plot(2.5,0.5,'bx','MarkerSize',100)
                    matgame(3,3) = 1;
                    [matgame]= PlayerTurn(1,matgame);%P3
                    if matgame(2,3)==-1
                        hold on
                        plot(2.5,1.5,'bx','MarkerSize',100)
                        matgame(2,3) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else
                        hold on
                        plot(0.5,1.5,'bx','MarkerSize',100)
                        matgame(2,1) = 1;
                        [matgame]= PlayerTurn(1,matgame);%P4
                        if matgame(1,2)==0 %P4 at 2
                            hold on
                            plot(1.5,0.5,'bx','MarkerSize',100)
                            matgame(3,2) = 1;
                            [matgame]= PlayerTurn(1,matgame);%P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        elseif matgame(3,1)==0 %P4 at 7
                            hold on
                            plot(1.5,2.5,'bx','MarkerSize',100)
                            matgame(1,2) = 1;
                            [matgame]= PlayerTurn(1,matgame);%P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        elseif matgame(3,2)==0 %P4 at 8
                            hold on
                            plot(1.5,2.5,'bx','MarkerSize',100)
                            matgame(1,2) = 1;
                            [matgame]= PlayerTurn(1,matgame);%P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                elseif matgame(1,2)==0 %P2 at 2
                    hold on
                    plot(1.5,0.5,'bx','MarkerSize',100)
                    matgame(3,2) = 1;
                    [matgame]= PlayerTurn(1,matgame);%P3
                    if matgame(1,1)==0 %P3 at 1
                        hold on
                        plot(2.5,0.5,'bx','MarkerSize',100)
                        matgame(3,3) = 1;
                        [matgame]= PlayerTurn(1,matgame);%P4
                        if matgame(2,3)==-1
                            hold on
                            plot(2.5,1.5,'bx','MarkerSize',100)
                            matgame(2,3) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else
                            hold on
                            plot(0.5,0.5,'bx','MarkerSize',100)
                            matgame(3,1) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        end
                    elseif matgame(2,1)==0 %P3 at 4
                        hold on
                        plot(2.5,1.5,'bx','MarkerSize',100)
                        matgame(2,3) = 1;
                        [matgame]= PlayerTurn(1,matgame);%P4
                        if matgame(3,3)==-1
                            hold on
                            plot(2.5,0.5,'bx','MarkerSize',100)
                            matgame(3,3) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else
                            hold on
                            plot(0.5,2.5,'bx','MarkerSize',100)
                            matgame(3,1) = 1;
                            [matgame]= PlayerTurn(1,matgame);%P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    elseif matgame(2,3)==0 %P3 at 6
                        hold on
                        plot(2.5,1.5,'bx','MarkerSize',100)
                        matgame(2,3) = 1;
                        [matgame]= PlayerTurn(1,matgame);%P4
                        if matgame(3,3)==-1
                            hold on
                            plot(2.5,0.5,'bx','MarkerSize',100)
                            matgame(3,3) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else
                            hold on
                            plot(0.5,2.5,'bx','MarkerSize',100)
                            matgame(1,1) = 1;
                            [matgame]= PlayerTurn(1,matgame);%P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    elseif matgame(3,1)==0 %P3 at 7
                        hold on
                        plot(0.5,1.5,'bx','MarkerSize',100)
                        matgame(2,1) = 1;
                        [matgame]= PlayerTurn(1,matgame); %P4
                        if matgame(1,1)==0 %P4 at 1
                            hold on
                            plot(2.5,0.5,'bx','MarkerSize',100)
                            matgame(3,3) = 1;
                            [matgame]= PlayerTurn(1,matgame);
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        elseif matgame(2,3)==0 %P4 at 6
                            hold on
                            plot(2.5,0.5,'bx','MarkerSize',100)
                            matgame(3,3) = 1;
                            [matgame]= PlayerTurn(1,matgame);
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        elseif matgame(3,3)==0 %P4 at 9
                            hold on
                            plot(0.5,2.5,'bx','MarkerSize',100)
                            matgame(1,1) = 1;
                            [matgame]= PlayerTurn(1,matgame);
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    elseif matgame(3,3)==0 %P3 at 9
                        hold on
                        plot(0.5,2.5,'bx','MarkerSize',100)
                        matgame(1,1) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(2,1)==0 %P4 at 4
                            hold on
                            plot(2.5,1.5,'bx','MarkerSize',100)
                            matgame(2,3) = 1;
                            [matgame]= PlayerTurn(1,matgame);
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        elseif matgame(2,3)==0 %P4 at 6
                            hold on
                            plot(0.5,1.5,'bx','MarkerSize',100)
                            matgame(2,1) = 1;
                            [matgame]= PlayerTurn(1,matgame);
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        elseif matgame(3,1)==0 %P4 at 7
                            hold on
                            plot(0.5,1.5,'bx','MarkerSize',100)
                            matgame(2,1) = 1;
                            [matgame]= PlayerTurn(1,matgame);
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                elseif matgame(2,1)==0 %P2 at 4
                    hold on
                    plot(2.5,1.5,'bx','MarkerSize',100)
                    matgame(2,3) = 1;
                    [matgame]= PlayerTurn(1,matgame);
                    if matgame(3,3)==-1
                        hold on
                        plot(2.5,0.5,'bx','MarkerSize',100)
                        matgame(3,3) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else
                        hold on
                        plot(0.5,2.5,'bx','MarkerSize',100)
                        matgame(1,1) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(1,2)==-1
                            hold on
                            plot(1.5,2.5,'bx','MarkerSize',100)
                            matgame(1,2) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else
                            hold on
                            plot(1.5,0.5,'bx','MarkerSize',100)
                            matgame(3,2) = 1;
                            [matgame]= PlayerTurn(1,matgame);
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                elseif matgame(2,3)==0 %P2 at 6
                    hold on
                    plot(0.5,1.5,'bx','MarkerSize',100)
                    matgame(2,1) = 1;
                    [matgame]= PlayerTurn(1,matgame);
                    if matgame(1,1)==0 %P3 at 1
                        hold on
                        plot(2.5,0.5,'bx','MarkerSize',100)
                        matgame(3,3) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(1,2)==0 %P4 at 2
                            hold on
                            plot(1.5,0.5,'bx','MarkerSize',100)
                            matgame(3,2) = 1;
                            [matgame]= PlayerTurn(1,matgame);
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        elseif matgame(3,1)==0 %P4 at 7
                            hold on
                            plot(1.5,2.5,'bx','MarkerSize',100)
                            matgame(1,2) = 1;
                            [matgame]= PlayerTurn(1,matgame);
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        elseif matgame(3,2)==0 %P4 at 8
                            hold on
                            plot(1.5,2.5,'bx','MarkerSize',100)
                            matgame(1,2) = 1;
                            [matgame]= PlayerTurn(1,matgame);
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    elseif matgame(1,2)==0 %P3 at 2
                        hold on
                        plot(1.5,0.5,'bx','MarkerSize',100)
                        matgame(3,2) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(1,1)==0 %P4 at 1
                            hold on
                            plot(2.5,0.5,'bx','MarkerSize',100)
                            matgame(3,3) = 1;
                            [matgame]= PlayerTurn(1,matgame);
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        elseif matgame(3,1)==0 %P4 at 7
                            hold on
                            plot(2.5,0.5,'bx','MarkerSize',100)
                            matgame(3,3) = 1;
                            [matgame]= PlayerTurn(1,matgame);
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        elseif matgame(3,3)==0 %P4 at 9
                            hold on
                            plot(0.5,2.5,'bx','MarkerSize',100)
                            matgame(1,1) = 1;
                            [matgame]= PlayerTurn(1,matgame);
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    elseif matgame(3,1)==0 %P3 at 7
                        hold on
                        plot(0.5,2.5,'bx','MarkerSize',100)
                        matgame(1,1) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(1,2)==-1
                            hold on
                            plot(1.5,2.5,'bx','MarkerSize',100)
                            matgame(1,2) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 2
                            hold on
                            plot(1.5,0.5,'bx','MarkerSize',100)
                            matgame(3,2) = 1;
                            [matgame]= PlayerTurn(1,matgame);
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    elseif matgame(3,2)==0 %P3 at 8
                        hold on
                        plot(1.5,2.5,'bx','MarkerSize',100)
                        matgame(1,2) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(1,1)==-1
                            hold on
                            plot(0.5,2.5,'bx','MarkerSize',100)
                            matgame(1,1) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 1
                            hold on
                            plot(2.5,0.5,'bx','MarkerSize',100)
                            matgame(3,3) = 1;
                            [matgame]= PlayerTurn(1,matgame);
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    elseif matgame(3,3)==0 %P3 at 9
                        hold on
                        plot(0.5,2.5,'bx','MarkerSize',100)
                        matgame(1,1) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(1,2)==-1
                            hold on
                            plot(1.5,2.5,'bx','MarkerSize',100)
                            matgame(1,2) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 2
                            hold on
                            plot(1.5,0.5,'bx','MarkerSize',100)
                            matgame(3,2) = 1;
                            [matgame]= PlayerTurn(1,matgame);
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                elseif matgame(3,1)==0 %P2 at 7
                    hold on
                    plot(2.5,0.5,'bx','MarkerSize',100)
                    matgame(3,3) = 1;
                    [matgame]= PlayerTurn(1,matgame);
                    if matgame(2,3)==-1
                        hold on
                        plot(2.5,1.5,'bx','MarkerSize',100)
                        matgame(2,3) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 6
                        hold on
                        plot(0.5,1.5,'bx','MarkerSize',100)
                        matgame(2,1) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(1,1)==0 %P4 at 1
                            hold on
                            plot(1.5,2.5,'bx','MarkerSize',100)
                            matgame(1,2) = 1;
                            [matgame]= PlayerTurn(1,matgame);
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        elseif matgame(1,2)==0 %P4 at 2
                            hold on
                            plot(1.5,0.5,'bx','MarkerSize',100)
                            matgame(3,2) = 1;
                            [matgame]= PlayerTurn(1,matgame);
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        elseif matgame(3,2)==0 %P4 at 8
                            hold on
                            plot(1.5,2.5,'bx','MarkerSize',100)
                            matgame(1,2) = 1;
                            [matgame]= PlayerTurn(1,matgame);
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                elseif matgame(3,2)==0 %P2 at 8
                    hold on
                    plot(1.5,2.5,'bx','MarkerSize',100)
                    matgame(1,2) = 1;
                    [matgame]= PlayerTurn(1,matgame);
                    if matgame(1,1)==-1
                        hold on
                        plot(0.5,2.5,'bx','MarkerSize',100)
                        matgame(1,1) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 1
                        hold on
                        plot(2.5,0.5,'bx','MarkerSize',100)
                        matgame(3,3) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(2,3)==-1
                            hold on
                            plot(2.5,1.5,'bx','MarkerSize',100)
                            matgame(2,3) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 6
                            hold on
                            plot(0.5,1.5,'bx','MarkerSize',100)
                            matgame(2,1) = 1;
                            [matgame]= PlayerTurn(1,matgame);
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                elseif matgame(3,3)==0 %P2 at 9
                    hold on
                    plot(0.5,2.5,'bx','MarkerSize',100)
                    matgame(1,1) = 1;
                    [matgame]= PlayerTurn(1,matgame);
                    if matgame(1,2)==-1
                        hold on
                        plot(1.5,2.5,'bx','MarkerSize',100)
                        matgame(1,2) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 2
                        hold on
                        plot(1.5,0.5,'bx','MarkerSize',100)
                        matgame(3,2) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(2,1)==0 %P4 at 4
                            hold on
                            plot(2.5,1.5,'bx','MarkerSize',100)
                            matgame(2,3) = 1;
                            [matgame]= PlayerTurn(1,matgame);
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        elseif matgame(2,3)==0 %P4 at 6
                            hold on
                            plot(0.5,1.5,'bx','MarkerSize',100)
                            matgame(2,1) = 1;
                            [matgame]= PlayerTurn(1,matgame);
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        elseif matgame(3,1)==0 %P4 at 6
                            hold on
                            plot(0.5,1.5,'bx','MarkerSize',100)
                            matgame(2,1) = 1;
                            [matgame]= PlayerTurn(1,matgame);
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                end
            elseif matgame(2,3)==0 %C1 if P1 is at 6
                hold on
                plot(1.5,1.5,'bx','MarkerSize',100)
                matgame(2,2) = 1;
                [matgame]= PlayerTurn(1,matgame);
                if matgame(1,1)==0 %P2 at 1
                    hold on
                    plot(1.5,2.5,'bx','MarkerSize',100)
                    matgame(1,2) = 1;
                    [matgame]= PlayerTurn(1,matgame)
                    if matgame(3,2)==-1
                        hold on
                        plot(1.5,0.5,'bx','MarkerSize',100)
                        matgame(3,2) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 8
                        hold on
                        plot(0.5,0.5,'bx','MarkerSize',100)
                        matgame(3,1) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(1,3)==-1
                            hold on
                            plot(2.5,2.5,'bx','MarkerSize',100)
                            matgame(1,3) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 3
                            hold on
                            plot(2.5,0.5,'bx','MarkerSize',100)
                            matgame(3,3) = 1;
                            [matgame]= PlayerTurn(1,matgame); %P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                elseif matgame(1,2)==0 %P2 at 2
                    hold on
                    plot(2.5,2.5,'bx','MarkerSize',100)
                    matgame(1,3) = 1;
                    [matgame]= PlayerTurn(1,matgame)
                    if matgame(3,1)==-1
                        hold on
                        plot(0.5,0.5,'bx','MarkerSize',100)
                        matgame(3,1) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 7
                        hold on
                        plot(2.5,0.5,'bx','MarkerSize',100)
                        matgame(3,3) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(1,1)==-1
                            hold on
                            plot(0.5,2.5,'bx','MarkerSize',100)
                            matgame(1,1) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 1
                            hold on
                            plot(0.5,1.5,'bx','MarkerSize',100)
                            matgame(2,1) = 1;
                            [matgame]= PlayerTurn(1,matgame); %P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                elseif matgame(1,3)==0 %P2 at 3
                    hold on
                    plot(2.5,0.5,'bx','MarkerSize',100)
                    matgame(3,3) = 1;
                    [matgame]= PlayerTurn(1,matgame)
                    if matgame(1,1)==-1
                        hold on
                        plot(0.5,2.5,'bx','MarkerSize',100)
                        matgame(1,1) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 1
                        hold on
                        plot(1.5,2.5,'bx','MarkerSize',100)
                        matgame(1,2) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(3,2)==-1
                            hold on
                            plot(1.5,0.5,'bx','MarkerSize',100)
                            matgame(3,2) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 8
                            hold on
                            plot(0.5,0.5,'bx','MarkerSize',100)
                            matgame(3,1) = 1;
                            [matgame]= PlayerTurn(1,matgame); %P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                elseif matgame(2,1)==0 %P2 at 4
                    hold on
                    plot(1.5,2.5,'bx','MarkerSize',100)
                    matgame(1,2) = 1;
                    [matgame]= PlayerTurn(1,matgame)
                    if matgame(3,2)==-1
                        hold on
                        plot(1.5,0.5,'bx','MarkerSize',100)
                        matgame(3,2) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 8
                        hold on
                        plot(2.5,2.5,'bx','MarkerSize',100)
                        matgame(1,3) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(1,1)==-1
                            hold on
                            plot(0.5,2.5,'bx','MarkerSize',100)
                            matgame(1,1) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        elseif matgame(3,1)==-1
                            hold on
                            plot(0.5,0.5,'bx','MarkerSize',100)
                            matgame(3,1) = 1;
                            wincount=wincount+1;
                            xlabel([]);
                            break
                        end
                    end
                elseif matgame(3,1)==0 %P2 at 7
                    hold on
                    plot(1.5,0.5,'bx','MarkerSize',100)
                    matgame(3,2) = 1;
                    [matgame]= PlayerTurn(1,matgame)
                    if matgame(1,2)==-1
                        hold on
                        plot(1.5,2.5,'bx','MarkerSize',100)
                        matgame(1,2) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 2
                        hold on
                        plot(0.5,2.5,'bx','MarkerSize',100)
                        matgame(1,1) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(3,3)==-1
                            hold on
                            plot(2.5,0.5,'bx','MarkerSize',100)
                            matgame(3,3) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 9
                            hold on
                            plot(2.5,2.5,'bx','MarkerSize',100)
                            matgame(1,3) = 1;
                            [matgame]= PlayerTurn(1,matgame); %P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                elseif matgame(3,2)==0 %P2 at 8
                    hold on
                    plot(2.5,0.5,'bx','MarkerSize',100)
                    matgame(3,3) = 1;
                    [matgame]= PlayerTurn(1,matgame)
                    if matgame(1,1)==-1
                        hold on
                        plot(0.5,2.5,'bx','MarkerSize',100)
                        matgame(1,1) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 1
                        hold on
                        plot(2.5,2.5,'bx','MarkerSize',100)
                        matgame(1,3) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(3,1)==-1
                            hold on
                            plot(0.5,0.5,'bx','MarkerSize',100)
                            matgame(3,1) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 7
                            hold on
                            plot(0.5,1.5,'bx','MarkerSize',100)
                            matgame(2,1) = 1;
                            [matgame]= PlayerTurn(1,matgame); %P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                elseif matgame(3,3)==0 %P2 at 9
                    hold on
                    plot(2.5,2.5,'bx','MarkerSize',100)
                    matgame(1,3) = 1;
                    [matgame]= PlayerTurn(1,matgame)
                    if matgame(3,1)==-1
                        hold on
                        plot(0.5,0.5,'bx','MarkerSize',100)
                        matgame(3,1) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 7
                        hold on
                        plot(1.5,0.5,'bx','MarkerSize',100)
                        matgame(3,2) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(1,2)==-1
                            hold on
                            plot(1.5,2.5,'bx','MarkerSize',100)
                            matgame(1,2) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 2
                            hold on
                            plot(0.5,2.5,'bx','MarkerSize',100)
                            matgame(1,1) = 1;
                            [matgame]= PlayerTurn(1,matgame); %P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                end
            elseif matgame(3,1)==0 %C1 if P1 is at 7
                hold on
                plot(1.5,1.5,'bx','MarkerSize',100)
                matgame(2,2) = 1;
                [matgame]= PlayerTurn(1,matgame);
                if matgame(1,1)==0 %P2 at 1
                    hold on
                    plot(0.5,1.5,'bx','MarkerSize',100)
                    matgame(2,1) = 1;
                    [matgame]= PlayerTurn(1,matgame)
                    if matgame(2,3)==-1
                        hold on
                        plot(2.5,1.5,'bx','MarkerSize',100)
                        matgame(2,3) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 6
                        hold on
                        plot(1.5,2.5,'bx','MarkerSize',100)
                        matgame(1,2) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(3,2)==-1
                            hold on
                            plot(1.5,0.5,'bx','MarkerSize',100)
                            matgame(3,2) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 8
                            hold on
                            plot(1.5,0.5,'bx','MarkerSize',100)
                            matgame(3,2) = 1;
                            [matgame]= PlayerTurn(1,matgame); %P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                elseif matgame(1,2)==0 %P2 at 2
                    hold on
                    plot(0.5,1.5,'bx','MarkerSize',100)
                    matgame(2,1) = 1;
                    [matgame]= PlayerTurn(1,matgame)
                    if matgame(2,3)==-1
                        hold on
                        plot(2.5,1.5,'bx','MarkerSize',100)
                        matgame(2,3) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 6
                        hold on
                        plot(2.5,0.5,'bx','MarkerSize',100)
                        matgame(3,3) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(1,1)==-1
                            hold on
                            plot(0.5,2.5,'bx','MarkerSize',100)
                            matgame(1,1) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 1
                            hold on
                            plot(2.5,2.5,'bx','MarkerSize',100)
                            matgame(1,3) = 1;
                            [matgame]= PlayerTurn(1,matgame); %P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                elseif matgame(1,3)==0 %P2 at 3
                    hold on
                    plot(0.5,1.5,'bx','MarkerSize',100)
                    matgame(2,1) = 1;
                    [matgame]= PlayerTurn(1,matgame)
                    if matgame(2,3)==-1
                        hold on
                        plot(2.5,1.5,'bx','MarkerSize',100)
                        matgame(2,3) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 6
                        hold on
                        plot(2.5,0.5,'bx','MarkerSize',100)
                        matgame(3,3) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(1,1)==-1
                            hold on
                            plot(0.5,2.5,'bx','MarkerSize',100)
                            matgame(1,1) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 1
                            hold on
                            plot(1.5,2.5,'bx','MarkerSize',100)
                            matgame(1,2) = 1;
                            [matgame]= PlayerTurn(1,matgame); %P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                elseif matgame(2,1)==0 %P2 at 4
                    hold on
                    plot(0.5,2.5,'bx','MarkerSize',100)
                    matgame(1,1) = 1;
                    [matgame]= PlayerTurn(1,matgame)
                    if matgame(3,3)==-1
                        hold on
                        plot(2.5,0.5,'bx','MarkerSize',100)
                        matgame(3,3) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 9
                        hold on
                        plot(1.5,0.5,'bx','MarkerSize',100)
                        matgame(3,2) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(1,2)==-1
                            hold on
                            plot(1.5,2.5,'bx','MarkerSize',100)
                            matgame(1,2) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 2
                            hold on
                            plot(2.5,2.5,'bx','MarkerSize',100)
                            matgame(1,3) = 1;
                            [matgame]= PlayerTurn(1,matgame); %P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                elseif matgame(2,3)==0 %P2 at 6
                    hold on
                    plot(1.5,0.5,'bx','MarkerSize',100)
                    matgame(3,2) = 1;
                    [matgame]= PlayerTurn(1,matgame)
                    if matgame(1,2)==-1
                        hold on
                        plot(1.5,2.5,'bx','MarkerSize',100)
                        matgame(1,2) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 2
                        hold on
                        plot(0.5,2.5,'bx','MarkerSize',100)
                        matgame(1,1) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(3,3)==-1
                            hold on
                            plot(2.5,0.5,'bx','MarkerSize',100)
                            matgame(3,3) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 9
                            hold on
                            plot(2.5,2.5,'bx','MarkerSize',100)
                            matgame(1,3) = 1;
                            [matgame]= PlayerTurn(1,matgame); %P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                elseif matgame(3,2)==0 %P2 at 8
                    hold on
                    plot(2.5,0.5,'bx','MarkerSize',100)
                    matgame(3,3) = 1;
                    [matgame]= PlayerTurn(1,matgame)
                    if matgame(1,1)==-1
                        hold on
                        plot(0.5,2.5,'bx','MarkerSize',100)
                        matgame(1,1) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 1
                        hold on
                        plot(0.5,1.5,'bx','MarkerSize',100)
                        matgame(2,1) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(2,3)==-1
                            hold on
                            plot(2.5,1.5,'bx','MarkerSize',100)
                            matgame(2,3) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 6
                            hold on
                            plot(2.5,2.5,'bx','MarkerSize',100)
                            matgame(1,3) = 1;
                            [matgame]= PlayerTurn(1,matgame); %P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                elseif matgame(3,3)==0 %P2 at 9
                    hold on
                    plot(1.5,0.5,'bx','MarkerSize',100)
                    matgame(3,2) = 1;
                    [matgame]= PlayerTurn(1,matgame)
                    if matgame(1,2)==-1
                        hold on
                        plot(1.5,2.5,'bx','MarkerSize',100)
                        matgame(1,2) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 2
                        hold on
                        plot(0.5,1.5,'bx','MarkerSize',100)
                        matgame(2,1) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(2,3)==-1
                            hold on
                            plot(2.5,1.5,'bx','MarkerSize',100)
                            matgame(2,3) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 6
                            hold on
                            plot(2.5,2.5,'bx','MarkerSize',100)
                            matgame(1,3) = 1;
                            [matgame]= PlayerTurn(1,matgame); %P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                end
            elseif matgame(3,2)==0 %C1 if P1 is at 8
                hold on
                plot(1.5,1.5,'bx','MarkerSize',100)
                matgame(2,2) = 1;
                [matgame]= PlayerTurn(1,matgame);
                if matgame(1,1)==0 %P2 at 1
                    hold on
                    plot(0.5,1.5,'bx','MarkerSize',100)
                    matgame(2,1) = 1;
                    [matgame]= PlayerTurn(1,matgame)
                    if matgame(2,3)==-1
                        hold on
                        plot(2.5,1.5,'bx','MarkerSize',100)
                        matgame(2,3) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 6
                        hold on
                        plot(2.5,2.5,'bx','MarkerSize',100)
                        matgame(1,3) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(3,1)==-1
                            hold on
                            plot(0.5,0.5,'bx','MarkerSize',100)
                            matgame(3,1) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 7
                            hold on
                            plot(2.5,0.5,'bx','MarkerSize',100)
                            matgame(3,3) = 1;
                            [matgame]= PlayerTurn(1,matgame); %P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                elseif matgame(1,2)==0 %P2 at 2
                    hold on
                    plot(0.5,1.5,'bx','MarkerSize',100)
                    matgame(2,1) = 1;
                    [matgame]= PlayerTurn(1,matgame)
                    if matgame(2,3)==-1
                        hold on
                        plot(2.5,1.5,'bx','MarkerSize',100)
                        matgame(2,3) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 6
                        hold on
                        plot(2.5,2.5,'bx','MarkerSize',100)
                        matgame(1,3) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(3,1)==-1
                            hold on
                            plot(0.5,0.5,'bx','MarkerSize',100)
                            matgame(3,1) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 7
                            hold on
                            plot(2.5,0.5,'bx','MarkerSize',100)
                            matgame(3,3) = 1;
                            [matgame]= PlayerTurn(1,matgame); %P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                elseif matgame(1,3)==0 %P2 at 3
                    hold on
                    plot(2.5,1.5,'bx','MarkerSize',100)
                    matgame(2,3) = 1;
                    [matgame]= PlayerTurn(1,matgame)
                    if matgame(2,1)==-1
                        hold on
                        plot(0.5,1.5,'bx','MarkerSize',100)
                        matgame(2,1) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 4
                        hold on
                        plot(0.5,2.5,'bx','MarkerSize',100)
                        matgame(1,1) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(3,3)==-1
                            hold on
                            plot(2.5,0.5,'bx','MarkerSize',100)
                            matgame(3,3) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 9
                            hold on
                            plot(0.5,0.5,'bx','MarkerSize',100)
                            matgame(3,1) = 1;
                            [matgame]= PlayerTurn(1,matgame); %P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                elseif matgame(2,1)==0 %P2 at 4
                    hold on
                    plot(0.5,0.5,'bx','MarkerSize',100)
                    matgame(3,1) = 1;
                    [matgame]= PlayerTurn(1,matgame)
                    if matgame(1,3)==-1
                        hold on
                        plot(2.5,2.5,'bx','MarkerSize',100)
                        matgame(1,3) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 3
                        hold on
                        plot(0.5,2.5,'bx','MarkerSize',100)
                        matgame(1,1) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(3,3)==-1
                            hold on
                            plot(2.5,0.5,'bx','MarkerSize',100)
                            matgame(3,3) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 9
                            hold on
                            plot(2.5,1.5,'bx','MarkerSize',100)
                            matgame(2,3) = 1;
                            [matgame]= PlayerTurn(1,matgame); %P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                elseif matgame(2,3)==0 %P2 at 6
                    hold on
                    plot(2.5,0.5,'bx','MarkerSize',100)
                    matgame(3,3) = 1;
                    [matgame]= PlayerTurn(1,matgame)
                    if matgame(1,1)==-1
                        hold on
                        plot(0.5,2.5,'bx','MarkerSize',100)
                        matgame(1,1) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 1
                        hold on
                        plot(2.5,2.5,'bx','MarkerSize',100)
                        matgame(1,3) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(3,1)==-1
                            hold on
                            plot(0.5,0.5,'bx','MarkerSize',100)
                            matgame(3,1) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 7
                            hold on
                            plot(0.5,1.5,'bx','MarkerSize',100)
                            matgame(3,3) = 1;
                            [matgame]= PlayerTurn(1,matgame); %P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                elseif matgame(3,1)==0 %P2 at 7
                    hold on
                    plot(2.5,0.5,'bx','MarkerSize',100)
                    matgame(3,3) = 1;
                    [matgame]= PlayerTurn(1,matgame)
                    if matgame(1,1)==-1
                        hold on
                        plot(0.5,2.5,'bx','MarkerSize',100)
                        matgame(1,1) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 1
                        hold on
                        plot(0.5,1.5,'bx','MarkerSize',100)
                        matgame(2,1) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(2,3)==-1
                            hold on
                            plot(2.5,1.5,'bx','MarkerSize',100)
                            matgame(2,3) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 7
                            hold on
                            plot(2.5,2.5,'bx','MarkerSize',100)
                            matgame(2,3) = 1;
                            [matgame]= PlayerTurn(1,matgame); %P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                elseif matgame(3,3)==0 %P2 at 9
                    hold on
                    plot(0.5,0.5,'bx','MarkerSize',100)
                    matgame(3,1) = 1;
                    [matgame]= PlayerTurn(1,matgame)
                    if matgame(1,3)==-1
                        hold on
                        plot(2.5,2.5,'bx','MarkerSize',100)
                        matgame(1,3) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 3
                        hold on
                        plot(2.5,1.5,'bx','MarkerSize',100)
                        matgame(2,3) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(2,1)==-1
                            hold on
                            plot(0.5,1.5,'bx','MarkerSize',100)
                            matgame(2,1) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 4
                            hold on
                            plot(1.5,2.5,'bx','MarkerSize',100)
                            matgame(1,2) = 1;
                            [matgame]= PlayerTurn(1,matgame); %P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                end
            elseif matgame(3,3)==0 %C1 if P1 is at 9
                hold on
                plot(1.5,1.5,'bx','MarkerSize',100)
                matgame(2,2) = 1;
                [matgame]= PlayerTurn(1,matgame);
                if matgame(1,1)==0 %P2 at 1
                    hold on
                    plot(0.5,1.5,'bx','MarkerSize',100)
                    matgame(2,1) = 1;
                    [matgame]= PlayerTurn(1,matgame)
                    if matgame(2,3)==-1
                        hold on
                        plot(2.5,1.5,'bx','MarkerSize',100)
                        matgame(2,3) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 6
                        hold on
                        plot(2.5,2.5,'bx','MarkerSize',100)
                        matgame(1,3) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(3,1)==-1
                            hold on
                            plot(0.5,0.5,'bx','MarkerSize',100)
                            matgame(3,1) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 7
                            hold on
                            plot(1.5,0.5,'bx','MarkerSize',100)
                            matgame(3,2) = 1;
                            [matgame]= PlayerTurn(1,matgame); %P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                elseif matgame(1,2)==0 %P2 at 2
                    hold on
                    plot(2.5,1.5,'bx','MarkerSize',100)
                    matgame(2,3) = 1;
                    [matgame]= PlayerTurn(1,matgame)
                    if matgame(2,1)==-1
                        hold on
                        plot(0.5,1.5,'bx','MarkerSize',100)
                        matgame(2,1) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 4
                        hold on
                        plot(0.5,0.5,'bx','MarkerSize',100)
                        matgame(3,1) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(1,3)==-1
                            hold on
                            plot(2.5,2.5,'bx','MarkerSize',100)
                            matgame(1,3) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 3
                            hold on
                            plot(0.5,2.5,'bx','MarkerSize',100)
                            matgame(1,1) = 1;
                            [matgame]= PlayerTurn(1,matgame); %P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                elseif matgame(1,3)==0 %P2 at 3
                    hold on
                    plot(2.5,1.5,'bx','MarkerSize',100)
                    matgame(2,3) = 1;
                    [matgame]= PlayerTurn(1,matgame)
                    if matgame(2,1)==-1
                        hold on
                        plot(0.5,1.5,'bx','MarkerSize',100)
                        matgame(2,1) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 4
                        hold on
                        plot(1.5,2.5,'bx','MarkerSize',100)
                        matgame(1,2) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(3,2)==-1
                            hold on
                            plot(1.5,0.5,'bx','MarkerSize',100)
                            matgame(3,2) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 8
                            hold on
                            plot(0.5,0.5,'bx','MarkerSize',100)
                            matgame(3,1) = 1;
                            [matgame]= PlayerTurn(1,matgame); %P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                elseif matgame(2,1)==0 %P2 at 4
                    hold on
                    plot(1.5,0.5,'bx','MarkerSize',100)
                    matgame(3,2) = 1;
                    [matgame]= PlayerTurn(1,matgame)
                    if matgame(1,2)==-1
                        hold on
                        plot(1.5,2.5,'bx','MarkerSize',100)
                        matgame(1,2) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 2
                        hold on
                        plot(2.5,2.5,'bx','MarkerSize',100)
                        matgame(1,3) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(3,1)==-1
                            hold on
                            plot(0.5,0.5,'bx','MarkerSize',100)
                            matgame(3,1) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 7
                            hold on
                            plot(0.5,2.5,'bx','MarkerSize',100)
                            matgame(1,1) = 1;
                            [matgame]= PlayerTurn(1,matgame); %P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                elseif matgame(2,3)==0 %P2 at 6
                    hold on
                    plot(2.5,2.5,'bx','MarkerSize',100)
                    matgame(1,3) = 1;
                    [matgame]= PlayerTurn(1,matgame)
                    if matgame(3,1)==-1
                        hold on
                        plot(0.5,0.5,'bx','MarkerSize',100)
                        matgame(3,1) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 7
                        hold on
                        plot(1.5,0.5,'bx','MarkerSize',100)
                        matgame(3,2) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(1,2)==-1
                            hold on
                            plot(1.5,2.5,'bx','MarkerSize',100)
                            matgame(1,2) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 2
                            hold on
                            plot(0.5,1.5,'bx','MarkerSize',100)
                            matgame(2,1) = 1;
                            [matgame]= PlayerTurn(1,matgame); %P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                elseif matgame(3,1)==0 %P2 at 7
                    hold on
                    plot(1.5,0.5,'bx','MarkerSize',100)
                    matgame(3,2) = 1;
                    [matgame]= PlayerTurn(1,matgame)
                    if matgame(1,2)==-1
                        hold on
                        plot(1.5,2.5,'bx','MarkerSize',100)
                        matgame(1,2) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 2
                        hold on
                        plot(2.5,1.5,'bx','MarkerSize',100)
                        matgame(2,3) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(2,1)==-1
                            hold on
                            plot(0.5,1.5,'bx','MarkerSize',100)
                            matgame(2,1) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 4
                            hold on
                            plot(0.5,2.5,'bx','MarkerSize',100)
                            matgame(1,1) = 1;
                            [matgame]= PlayerTurn(1,matgame); %P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                elseif matgame(3,2)==0 %P2 at 8
                    hold on
                    plot(0.5,0.5,'bx','MarkerSize',100)
                    matgame(3,1) = 1;
                    [matgame]= PlayerTurn(1,matgame)
                    if matgame(1,3)==-1
                        hold on
                        plot(2.5,2.5,'bx','MarkerSize',100)
                        matgame(1,3) = 1;
                        wincount=wincount+1;
                        xlabel([])
                        break
                    else %P3 at 3
                        hold on
                        plot(2.5,1.5,'bx','MarkerSize',100)
                        matgame(2,3) = 1;
                        [matgame]= PlayerTurn(1,matgame);
                        if matgame(2,1)==-1
                            hold on
                            plot(0.5,1.5,'bx','MarkerSize',100)
                            matgame(2,1) = 1;
                            wincount=wincount+1;
                            xlabel([])
                            break
                        else %P4 at 4
                            hold on
                            plot(1.5,2.5,'bx','MarkerSize',100)
                            matgame(1,2) = 1;
                            [matgame]= PlayerTurn(1,matgame); %P5
                            wincount=0;%TIE
                            xlabel([]);
                            break
                        end
                    end
                end
            end
        end
    end
    
    %End Message and Taunt
    if wincount >=1;
        uiwait(msgbox('WINNER WINNER CHICKEN DINNER','YOU LOSE!'));
    end
    if wincount>=2;
        for i=1:wincount-1
            questdlg('And I beat you the time before...','YOU LOSE!','I Know','I Know');
        end
    elseif wincount==0;
        uiwait(msgbox('It was a tie. I knew you couldn''t win','TIE'));
    end
    %Asking to Play Again
    cont = questdlg('Want to play again?','Tic Tac Toe','Yes','No','Yes')
    switch cont;
        case 'Yes';
            cont = 1;
        case 'No';
            cont = 0;
    end
end
%End message saying goodbye if player does not want to play again
msgbox('Scared of a little competition, huh? Practice up and come back and play!');
close all



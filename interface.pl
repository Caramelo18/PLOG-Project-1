:- use_module(library(system)).
:- use_module(library(random)).

getInt(Input):-
                get_code(Tinput),
                Input is Tinput - 48.

getChar(Input):-get_char(Input),
                get_char(_).

getCode(Input):- get_code(TempInput),
                 %get_code(_),
              	 Input is TempInput.

clearInput :- get_code(H),
              (
                H =\= 10 -> clearInput;
                true

              ).

inputCoords(Row,Col):-  %read row
                        getCode(RRow),

                        %read Col

                        getInt(RCol),

                        get_code(_),
                        Row is RRow - 65,
                        Col is RCol - 1. % A = 41.

getNewTileCoord(Row,Col):-
    write('Inser coordinates to place tile: [ Row, Col ]'),
    inputCoords(Row,Col),
    Row < 6, Col < 6.



displayPlayerHand(L1,Pname):-  %draw all pieces in player hand
                          write('Player '),
                          write(Pname),
                          write(' hand: '),
                          nl,
                          write('  -------------------'),
                          nl,
                          write('  |'),
                          display_line_p1(L1),
                          write('  |'),
                          display_line_p2(L1),
                          write('  |'),
                          display_line_p3(L1),
                          write('  -------------------').


optionSelect(Min,Max, Value):- write('Insert an option: '),
                            getInt(H),
                            clearInput,
                            nl,
                            Min =< H,
                            H =< Max,
                            Value is H.

displayStart:- write('----------------------------'), nl,
               write('||       || ILIOS ||      ||'), nl,
               write('||                        ||'), nl,
               write('----------------------------').

displayMenu:- write('----------------------------'), nl,
              write('| |          Menu         | |'), nl,
              write('| |  1 Player Vs Player   | |'), nl,
              write('| |  2 Player Vs Bot      | |'), nl,
              write('| |  3 Bot    Vs Bot      | |'), nl,
              write('| |  4 Exit               | |'), nl,
              write('----------------------------').

displayBotLevel:-write('----------------------------'), nl,
                 write('| |       Bot Level      | |'), nl,
                 write('| |     1  Level 1       | |'), nl,
                 write('| |     2  Level 2       | |'), nl,
                 write('----------------------------').


selectBot(BotLevel):- repeat,
                      nl,
                      displayBotLevel,
                      nl,
                      write('----------------------------'),
                      nl,
                      optionSelect(1,2,BotLevel),
                      write('----------------------------'),
                      nl.

confGame(GameType,BotLevel):- displayStart,
                               nl,
                               displayMenu,
                               repeat,
                               nl,
                               write('----------------------------'),
                               nl,
                               optionSelect(1,4,GameType),
                               (
                                  GameType = 1 -> BotLevel is 0; % PvP
                                  GameType = 2 -> selectBot(BotLevel); % PvB
                                  GameType = 3 -> selectBot(BotLevel); % BvB
                                  GameType = 4 % Exit
                               ),
                               write('----------------------------'),
                               nl.

%testes

playerhand([tile(a,t2,u),     tile(a,t2,l), tile(a,t2,r)]).
thand:-playerhand(X), write(X), nl, displayPlayerHand(X,'Player 1').
tinput:- getNewTileCoord(X,Y),write(X), nl, write(Y),nl.

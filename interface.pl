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


%testes

playerhand([tile(a,t2,u),     tile(a,t2,l), tile(a,t2,r)]).
thand:-playerhand(X),displayPlayerHand(X,'Player 1').
tinput:- getNewTileCoord(X,Y),write(X), nl, write(Y),nl.


%RANDOM

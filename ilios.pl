%:-initialization main.
:-dynamic(counter/1).
:-include('board.pl').
:-include('interface.pl').
:-dynamic(playerList/1).

changeOwner(tile(_,T,D),P,tile(P,T,D)).

changeOwnerLine([E1|Es],0,NewOwner,[H|Es]):- changeOwner(E1,NewOwner,H).
changeOwnerLine([E1|Es],Index,NewOwner,[E1|Result]):-Index>0,
                                                    I1 is Index-1,
                                                    changeOwnerLine(Es,I1,NewOwner,Result).

changeOwnerBoard([L1|Ls],0,Col,NewOwner,[H|Ls]):- changeOwnerLine(L1,Col,NewOwner,H).
changeOwnerBoard([L1|Ls],Line,Col,NewOwner,[L1|Result]):- Line > 0,
                                                           Line1 is Line - 1,
                                                           changeOwnerBoard(Ls,Line1,Col,NewOwner,Result).

placeTilePlace(tile(_,_,_), tile(P, T, D), tile(P, T, D)).

placeTileLine([L1|Ls], tile(P, T, D), 0, [H|Ls]):- placeTilePlace(L1, tile(P, T, D), H).
placeTileLine([L1|Ls], tile(P, T, D), Index, [L1|Os]):- Index > 0,
                                                        I1 is Index - 1,
                                                        placeTileLine(Ls, tile(P, T, D), I1, Os).

placeTile([L1|Ls], tile(P, T, D), 0, Col, [H|Ls]):- placeTileLine(L1, tile(P, T, D), Col, H).
placeTile([L1|Ls], tile(P, T, D), Line, Col, [L1|Os]):- Line > 0,
                                                        Line1 is Line - 1,
                                                        placeTile(Ls, tile(P, T, D), Line1, Col, Os).


getRandom(X,Max):- random(0,Max,X).

updatePool(Pool, Pool).

getRandomTile(0, [Pool|PoolS], Pool, PoolS).
getRandomTile(Num, [Pool|PoolS],Tile,[Pool|R]):- Num > 0,
                                        Num1 is Num - 1,
                                        getRandomTile(Num1, PoolS, Tile, R).
getRandomTile(Tile,Pool, R, Size):- getRandom(LineNum, Size), getRandomTile(LineNum , Pool, Tile,R).


assignTile(Tile, Tile).
createTile(Tile, Player, Type):- assignTile(tile(Player, Type, _), Tile).

getPlayerStartHand(Player, [Hand], 0, Pool, NewPool):- getRandomTile(Type,Pool, NewPool, 30), %TODO - fix size - pool does not start always with size 36
                                                       createTile(Hand, Player, Type).
getPlayerStartHand(Player, [Hand|Hands], Num, Pool, NewPool):- Num > 0,
                                                Size is 36 - 3 + Num,
                                                getRandomTile(Type,Pool, TPool, Size),
                                                createTile(Hand, Player, Type),
                                                Num1 is Num -1,
                                                getPlayerStartHand(Player, Hands, Num1,TPool,NewPool).
getPlayerStartHand(Player, Hand, Pool, NewPool):- getPlayerStartHand(Player, Hand, 2, Pool, NewPool).


removeTilePlayerHand(Tile, [Hand|Hands], Hands, 0):- assignTile(Hand, Tile).
removeTilePlayerHand(Tile, [Hand|Hands], [Hand|NewHands], TileNum):- TileNum > 0, TileNum < 3,
                                                                        TileNum1 is TileNum -1,
                                                                        removeTilePlayerHand(Tile, Hands, NewHands, TileNum1).

addTilePlayerHand(NewPool, Player, Hand, NewHand):- getRandomTile(Type, NewPool), createTile(Tile, Player, Type), append([Tile], Hand, NewHand), nl.
displayboard:- board(X), display_first_line, display_board(X, 1).

gametestchangeowner:- board(X), display_first_line, display_board(X, 1), changeOwnerBoard(X, 4, 2, b, T), display_first_line, display_board(T, 1).
gametestplacetile:- board(X), display_first_line, display_board(X, 1), placeTile(X, tile(b, t8, u), 5, 5, T), display_first_line, display_board(T, 1).

%testdrawtile:- getRandomTile(Tile,R), write('Tile: '), write(Tile), nl.
getplayerhand:- tilePool(Pool), getPlayerStartHand(a, List, Pool, NewPool), write(List), nl, displayPlayerHand(List, 'A'),nl, write(NewPool).
%testremoveplayertile:- getPlayerStartHand(a, Hand), displayPlayerHand(Hand, 'A'), nl, removeTilePlayerHand(Tile, Hand, NewHand, 0), write(Tile), nl, displayPlayerHand(NewHand, 'A').

tph([tile(a,t2,r), tile(a,t2,l)]).
%testaddplayertile:- tph(Hand), addTilePlayerHand(NewPool, a, Hand, NewHand), displayPlayerHand(NewHand, 'A').

getTilePoint(Tile, Value):- getTile(Tile, Type), integer(Type), Value is Type.
getTilePoint(_, Value):- Value is 0.

updatePoints(Base, Sum, Total):- Total is Base + Sum.

sumPoints('A', PointsA, _, NewPointsA, _, Value):- updatePoints(PointsA, Value, NewPointsA), nl, write('nv'). % TODO - fix NewPointsA assignement
sumPoints('B', _, PointsB, _, NewPointsB, Value):- NewPointsB = PointsB + Value.
sumPoints(_, PointsA, PointsB, NewPointsA, NewPointsB, _):- NewPointsA is PointsA, NewPointsB is PointsB.

totalPointsLine([], _, _, _, _).
totalPointsLine([Line|LineS], PlA, PlB, ScA, ScB):- getTilePoint(Line, Value), write(Value), write(' '),
                                                    getPlayer(Line, Player),
                                                    sumPoints(Player, PlA, PlB, ScA, ScB, Value),
                                                    totalPointsLine(LineS, ScA, ScB, ScA, ScB).

totalPoints([], _, _, _, _).
totalPoints([Board|BoardS], PlA, PlB, ScA, ScB):- totalPointsLine(Board, PlA, PlB, ScA, ScB), nl,
                                                  totalPoints(BoardS, ScA, ScB, ScA, ScB).

totalPoints(ScoreA, ScoreB):- board(Board), totalPoints(Board, 0, 0, ScoreA, ScoreB).

testgettotalpoints:- totalPoints(ScoreA, ScoreB), write('Points A: '), write(ScoreA), nl, write('Points B: '), write(ScoreB).



/* GAME

Inicializaçao

repeat:
        jogar,
        fim de jogo,
      Mostar Resultados
*/
/*


*/
main:- confGame(GameType,BotLevel),
        %debug
        write(GameType), write(' '), write(BotLevel).

playerListOp([['A' , 'B'], ['B', 'A']]).
pickFirstPlayer(0, Order):- playerListOp([Order|_]).
pickFirstPlayer(1, Order):- playerListOp([_|[Order]]).
drawFirstPlayer([Pl|Ps]):- random(0, 2, P), pickFirstPlayer(P, [Pl|Ps]).

%redefinir tabuleiro com retract
startGame(B3, P1Hand, P2Hand, PoolF, [P1|[P2]]):-
    board(B), tilePool(Pool),
    drawFirstPlayer([P1|[P2]]),
    getPlayerStartHand(P1, P1Hand, Pool, NewPool),
    getPlayerStartHand(P2, P2Hand, NewPool, PoolF),
    displayBoard(B), nl,
    showStarterPlayer(P1), nl,
    showPlace2STiles(P1),
    getNewTileCoord(P1SC, P1SR),
    getNewTileCoord(P1SC2, P1SR2),
    placeTile(B, tile(P1,t10,u), P1SR, P1SC, B1),
    placeTile(B1, tile(P1,t10,u), P1SR2, P1SC2, B2),
    displayBoard(B2), nl,
    showPlace1STiles(P2),
    getNewTileCoord(P2SC, P2SR),
    placeTile(B2, tile(P2, t10,u), P2SR, P2SC, B3),
    displayBoard(B3), nl.


game(Board, P1Hand, P2Hand, TilePool, [P1|P2]):-
    displayPlayerHand(P1Hand, P1),
    getNumTile(P1TN),
    removeTilePlayerHand(Tile, P1Hand, NP1Hand, P1TN),
    getNewTileCoord(P1C, P1R),
    placeTile(Board, Tile, P1R, P1C, Board1),
    displayBoard(Board1), nl,
    displayPlayerHand(P2Hand, P2),
    getNumTile(P2TN),
    removeTilePlayerHand(Tile2, P2Hand, NP2Hand, P2TN),
    getNewTileCoord(P2C, P2R),
    placeTile(Board1, Tile2, P2R, P2C, NewBoard),
    displayBoard(NewBoard), nl.
/*
selectTile([Hand|HandS], 0, Hand).
selectTile([Hand|HandS], Num, Tile):- Num1 is Num - 1,
                                      selectTile(HandS, Num1, Tile).
*/
test:- startGame(Board, P1Hand, P2Hand, TPool, Players), game(Board, P1Hand, P2Hand, TPool, Players).

:-include('board.pl').
:-include('interface.pl').

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
getRandomTile(Tile, R):- tilePool(Pool), getRandom(LineNum,36), getRandomTile(LineNum , Pool, Tile,R).


assignTile(Tile, Tile).
createTile(Tile, Player, Type):- assignTile(tile(Player, Type, _), Tile).

getPlayerStartHand(Player, [Hand|Hands], 0):- getRandomTile(Type, NewPool),
                                              createTile(Hand, Player, Type).
getPlayerStartHand(Player, [Hand|Hands], Num):- Num > 0,
                                                getRandomTile(Type, NewPool),
                                                createTile(Hand, Player, Type),
                                                Num1 is Num -1,
                                                getPlayerStartHand(Player, Hands, Num1).
getPlayerStartHand(Player, Hand):- getPlayerStartHand(Player, Hand, 2).


removeTilePlayerHand(Tile, [Hand|Hands], Hands, 0):- assignTile(Hand, Tile).
removeTilePlayerHand(Tile, [Hand|Hands], [Hand|NewHands], TileNum):- TileNum > 0, TileNum < 3,
                                                                        TileNum1 is TileNum -1,
                                                                        removeTilePlayerHand(Tile, Hands, NewHands, TileNum1).

addTilePlayerHand(NewPool, Player, Hand, NewHand):- getRandomTile(Type, NewPool), createTile(Tile, Player, Type), append([Tile], Hand, NewHand), nl.
displayboard:- board(X), display_first_line, display_board(X, 1).

gametestchangeowner:- board(X), display_first_line, display_board(X, 1), changeOwnerBoard(X, 4, 2, b, T), display_first_line, display_board(T, 1).
gametestplacetile:- board(X), display_first_line, display_board(X, 1), placeTile(X, tile(b, t8, u), 5, 5, T), display_first_line, display_board(T, 1).

testdrawtile:- getRandomTile(Tile,R), write('Tile: '), write(Tile), nl.
getplayerhand:- getPlayerStartHand(a, List), write(List), nl, displayPlayerHand(List, 'A').
testremoveplayertile:- getPlayerStartHand(a, Hand), displayPlayerHand(Hand, 'A'), nl, removeTilePlayerHand(Tile, Hand, NewHand, 0), write(Tile), nl, displayPlayerHand(NewHand, 'A').

tph([tile(a,t2,r), tile(a,t2,l)]).
testaddplayertile:- tph(Hand), addTilePlayerHand(NewPool, a, Hand, NewHand), displayPlayerHand(NewHand, 'A').
/*
    TODO - gerar mao aleatoria do jogador - falta actualizar tabuleiro
         - remover peça da mão - CHECK
         - adicionar peça à mão - CHECK
         - contar pontos
*/

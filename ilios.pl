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

getRandomLineNum(X):- random(0,5,X).
getRandomColNum(X):- random(0,7,X).

assignTile(Pool, Pool).
%removeTile(Pool, Empty). %TODO - remover tile da pool
getRandomCol(0, [Pool|PoolS], Tile):- assignTile(Pool, Tile).
getRandomCol(Num, [Pool|PoolS], Tile):- Num > 0,
                                        Num1 is Num - 1,
                                        getRandomCol(Num1, PoolS, Tile).

getRandomLine(0, [Pool|PoolS], Tile):- getRandomColNum(X), getRandomCol(X, Pool, Tile).
getRandomLine(Num, [Pool|PoolS], Tile):- Num > 0,
                                        Num1 is Num - 1,
                                        getRandomLine(Num1, PoolS, Tile).

getRandomTile(Tile):- tiles_pool(Pool), getRandomLineNum(LineNum), getRandomLine(LineNum, Pool, Tile).


game :- board(X), display_first_line, display_board(X, 1).

gametestchangeowner:- board(X), display_first_line, display_board(X, 1), changeOwnerBoard(X, 4, 2, b, T), display_first_line, display_board(T, 1).
gametestplacetile:- board(X), display_first_line, display_board(X, 1), placeTile(X, tile(b, t8, u), 5, 5, T), display_first_line, display_board(T, 1).

testdrawhand:- getRandomTile(Tile), write('Tile: '), write(Tile).
oioi:- tiles_pool(Pool), getRandomLine(X), getRandomLine(X, Line, Pool), write(X).

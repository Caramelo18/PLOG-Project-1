validP(_,_, _).
makeValidP(Row,Col, Dir, validP(Row,Col,Dir)).

listValidMoves(Board,Result,Player):- listValidMoves(Board,Temp,0,0,Player,Board),delete(Temp, [], Result).

listValidMoves([],[],_,_,_,_).
listValidMoves([L1|Ls],Result,Row,Col,Player,Board):-  listValidMovesLine(L1,R1,Row,Col,Player,Board),
                                                       Row1 is Row + 1,!,
                                                       % write('ROW '),write(Row),nl,
                                                       listValidMoves(Ls,Rs,Row1,0,Player,Board),
                                                       append(R1,Rs,Result).


listValidMovesLine([],[],_,_,_,_).
listValidMovesLine([_|Es],Result,Row,Col,Player,Board):-  Col1 is Col+1,
                                                            %write('col '),write(Col),nl,
                                                            checkIsEnemy(Board,Row,Col,Player),
                                                            listValidPos(Board,Row,Col,R1,Player),
                                                            listValidMovesLine(Es,Rs,Row,Col1,Player,Board),
                                                            append(R1,Rs,Result),write('append moves line'),nl,write(Result),nl.

listValidMovesLine([_|Es],Result,Row,Col,Player,Board):-  Col1 is Col+1,
                                                           listValidMovesLine(Es,Result,Row,Col1,Player,Board).

checkIsEnemy(Board,Row,Col,Player):-  getTileBoard(Board,Row,Col,Tile),
                                      assertEnemy(Tile,Player).


listValidPos(Board,Row,Col,Result,Player):-  Up is Row -1,
                                             Down is Row + 1,
                                             Left is Col -1,
                                             Rigth is Col +1,
                                             getValidPos(Board,Up,Col,R1,d),
                                             getValidPos(Board,Up,Left,R2,dr),
                                             getValidPos(Board,Up,Rigth,R3,dl),

                                             getValidPos(Board,Row,Left,R4,r),
                                             getValidPos(Board,Row,Rigth,R5,dl),

                                             getValidPos(Board,Down,Left,R6,dl),
                                             getValidPos(Board,Down,Col,R7,dl),
                                             getValidPos(Board,Down,Rigth,R8,dl),

                                             append([R1],[R2], T1),
                                             append([R3],[R4], T2),
                                             append([R5],[R6], T3),
                                             append([R7],[R8], T4),

                                             append(T1,T2,F1),
                                             append(T3,T4,F2),

                                             append(F1,F2,Result), write('append listValidPos'),nl,write(Result),nl.

getValidPos(Board,Row,Col,Result,Dir):-  Row < 6, Col < 6,
                                         Row > -1, Col > -1,
                                         emptyPlace(Board,Row, Col),
                                         makeValidP(Row,Col,Dir,Result).
getValidPos(_,_,_,[],_).

assertEnemy(E1,Player):- getPlayer(E1,P), P \== e, P \= Player.


xXx([[],[],validP(0,4,dl),[],validP(1,4,dl),[],[],validP(2,4,dl),validP(1,5,d),validP(1,4,dr),[],validP(2,4,r),[],validP(3,4,dl),validP(3,5,dl),[]]).
tvalid:-testboard(X),listValidMoves(X,R,'A'),displayBoard(X),nl,write(R),nl.
trem:- xXx(X), clearOutput(X,R), nl, write(R),nl.

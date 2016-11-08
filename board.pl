/*
Player -> Player Representation
Type -> Tile number ( 1,2,3,4,8,10).
Direction-> u,d,l,r
*/
tile(_,_,_).


board([[tile(a,t1,u),     tile(a,t1,l), tile(a,t1,r), tile(a,t1,d), tile(e,e,e),  tile(e,e,e)],
       [tile(a,t2,u),     tile(a,t2,l), tile(a,t2,r), tile(a,t2,d), tile(e,e,e),  tile(e,e,e)],
       [tile(a,t3,u),     tile(a,t3,l), tile(a,t3,r), tile(a,t3,d), tile(e,e,e),  tile(e,e,e)],
       [tile(a,t4,u),     tile(a,t4,l), tile(a,t4,r), tile(a,t4,d), tile(e,e,e),  tile(e,e,e)],
       [tile(a,t8,u),     tile(a,t8,l), tile(a,t8,r), tile(a,t8,d), tile(e,e,e),  tile(e,e,e)],
       [tile(a,t10,u),    tile(a,t10,l),tile(a,t10,r),tile(a,t10,d),tile(e,e,e),  tile(e,e,e)]]).


intermediate_board([[a1U,a1R,a1D,a1L,s,b10],
                    [a2L,a2R,s,bb,s,b8],
                    [a3U,a3R,a3D,a3L,s,b4],
                    [a4,s,b3L,b3D,b3R,b3U],
                    [a8,s,aa,s,b2R,b2L],
                    [a10,s,b1L,b1D,b1R,b1U]]).


startgame([[aa,bb,bb,aa,aa,aa],
           [aa,bb,bb,bb,bb,aa],
           [bb,bb,aa,bb,aa,aa],
           [aa,aa,bb,bb,aa,aa],
           [bb,bb,bb,aa,bb,aa],
           [bb,aa,aa,aa,bb,aa]]).


validmove([[s,s,s,s,s,s],
           [s,a10,s,s,s,s]]).





display_board([],_):-nl.
display_board([L1|Ls], N):- write('  |'),
                                     display_line_p1(L1),
                                     write(N),
                                     write(' |'),
                                     display_line_p2(L1),
                                     write('  |'),
                                     display_line_p3(L1),
                                     display_line_separators, nl ,
                                     N1 is N + 1,
                                     display_board(Ls, N1).


display_line_p1([]):-nl.
display_line_p1([E|Es]):- display_tile_p1(E),
                          write('|'),
                          display_line_p1(Es).




display_line_p2([]):-nl.
display_line_p2([E|Es]):- display_tile_p2(E),
                          write('|'),
                          display_line_p2(Es).



display_line_p3([]):- nl.
display_line_p3([E|Es]):- display_tile_p3(E),
                          write('|'),
                          display_line_p3(Es).

display_tile_p1(tile(_,t1,u)):-draw_tile1_MV.
display_tile_p1(tile(_,t1,_)):-draw_empty.
display_tile_p1(tile(_,t2,l)):-draw_tile2_1RL.
display_tile_p1(tile(_,t2,r)):-draw_tile2_1LR.
display_tile_p1(tile(_,t3,d)):-draw_empty.
display_tile_p1(tile(_,t3,_)):-draw_tile1_MV.
display_tile_p1(tile(_,t4,_)):-draw_tile4_1.
display_tile_p1(tile(_,t8,_)):-draw_tile8_1.
display_tile_p1(tile(_,t10,_)):-draw_tile10_1.
display_tile_p1(tile(_,_,_)):-draw_empty.

display_tile_p2(tile(P,t1,u)):-draw_empty(P).
display_tile_p2(tile(P,t1,r)):-draw_tile1_MHR(P).
display_tile_p2(tile(P,t1,d)):-draw_empty(P).
display_tile_p2(tile(P,t1,l)):-draw_tile1_MHL(P).
display_tile_p2(tile(P,t2,_)):-draw_empty(P).
display_tile_p2(tile(P,t3,r)):-draw_tile1_MHR(P).
display_tile_p2(tile(P,t3,l)):-draw_tile1_MHL(P).
display_tile_p2(tile(P,t3,_)):-draw_tile3_2(P).
display_tile_p2(tile(P,t4,_)):-draw_tile4_2(P).
display_tile_p2(tile(P,t8,_)):-draw_tile8_2(P).
display_tile_p2(tile(P,t10,_)):-draw_tile10_2(P).
display_tile_p2(tile(e,_,_)):-draw_empty.
display_tile_p2(tile(P,_,_)):-draw_final_tile(P).


display_tile_p3(tile(_,t1,d)):-draw_tile1_MV.
display_tile_p3(tile(_,t1,_)):-draw_empty.
display_tile_p3(tile(_,t2,r)):-draw_tile2_3LR.
display_tile_p3(tile(_,t2,l)):-draw_tile2_3RL.
display_tile_p3(tile(_,t3,u)):-draw_empty.
display_tile_p3(tile(_,t3,_)):-draw_tile1_MV.
display_tile_p3(tile(_,t4,_)):-draw_tile4_3.
display_tile_p3(tile(_,t8,_)):-draw_tile8_3.
display_tile_p3(tile(_,t10,_)):-draw_tile10_3.
display_tile_p3(tile(_,_,_)):-draw_empty.

display_line_separators:- write('  -------------------------------------').
display_first_line:- write('     A     B     C     D     E     F'), nl,
                     display_line_separators, nl.


draw_tile8_1:- write(''\' | /').
draw_tile8_2(P):- write('--'), write(P), write('--').
draw_tile8_3:- write('/ | '\'').

draw_tile1_MV:- write('  |  ').
draw_tile1_MHL(P):-write('--'),write(P),write('  ').
draw_tile1_MHR(P):-write('  '),write(P),write('--').

draw_empty:- write('     ').
draw_empty(P):-write('  '),write(P),write('  ').

draw_tile2_1LR:- write(''\'    ').
draw_tile2_3LR:- write('    '\'').
draw_tile2_1RL:- write('    /').
draw_tile2_3RL:- write('/    ').

draw_tile3_2(P):-write('--'),write(P),write('--').

draw_tile4_1:- write(''\'   /').
draw_tile4_2(P):- write('  '), write(P), write('  ').
draw_tile4_3:- write('/   '\'').

draw_tile10_1:- write('@ @ @').
draw_tile10_2(P):-write('@ '), write(P), write(' @').
draw_tile10_3:- write('@ @ @').

draw_final_tile(P):-write('  '), write(P), write('  ').


/*Pool dee Soldados*/
tiles_pool( [[p1,p1,p1,p1,p1,p1,p1],
             [p2,p2,p2,p2,p2,p2,p2],
             [p3,p3,p3,p3,p3,p3,p3],
             [p4,p4,p4,p4,p4,p4,p4],
             [p8,p8,p8,p8,p8,p8,p8]]).% 35 peças 7 de cada tipo
   % 3 peças  starter ( tipo X )
   % total 39 peças

/*Jogadas a implementar */

/*criaçao do jogo*/
%draw_start_hand(T). % buscar 3 Soldado aleatorios á pool
                    % para a mao do jogador

% dar iron tiles aos jogadores 2 ao 1º, 1 ao 2º.
%place_p10_tile(Location,Player).% colocar iron tiles no tabuleiro


/*Inicio de turno*/

%placeTile(Tile,Player,Col,Line). %colocar um soldado da mao Soldado no tabuleiro

/*Jogadas de ataque  */
%attack(Peca). % atacar as peças á volta ( trocar o dono da peça)

/*Casas bloqueadas */
%surrounded_tiles(Pecas). %casas bloqueadas em todas as direçoes

/*Conquistar casas*/
%conquest_tile(Peca). % remover peca  e deixar marca do Jogador

/*final do turno*/
%getSoldier(S). % retirar  um Soldado aleatorio á pool.


/*Game end */
%game_end(D). % todos os quadrados atribuidos a jogadores  e sem pecas em campo.



maketile(P,T,D, tile(P,T,D)).

/* get info from tile*/
getPlayer(tile(P,_,_),P).
getTile(tile(_,T,_),T):- write(T).
getDirection(tile(_,_,D),D).



line([tile(a,t1,u),tile(a,t1,l), tile(a,t1,r), tile(a,t1,d), tile(e,e,e),  tile(e,e,e)]).

tLine:-line(X),changeOwnerLine(X,0,b,R),write(R).
tboard:- board(X), changeOwnerBoard(X,1,3,c,R), write(R), nl, display_board(R,1).

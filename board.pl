board([[s,s,s,s,s,s],
       [s,s,s,s,s,s],
       [s,s,s,s,s,s],
       [s,s,s,s,s,s],
       [s,s,s,s,s,s],
       [s,s,s,s,s,s]]).

intermediate_board([[s,s,s,s,s,s],
                    [s,s,s,s,p1,s],
                    [s,p8,s,s,s,s],
                    [s,s,p2,s,p3,s],
                    [s,s,s,s,s,s],
                    [s,s,s,p4,s,s]]).





display_board([]):-nl.
display_board([L1|Ls], N):- write(' '), display_line_p1(L1), nl,
                         write(N),
                         display_line_p2(L1), nl,
                         write(' '),
                         display_line_p3(L1),nl,
                         display_line_separator(L1), nl ,
                         N1 is N + 1,
                         display_board(Ls, N1).

display_line_p1([]).
display_line_p1(E):- display_tile_p1(E),nl.
display_line_p1([E|Es]):- display_tile_p1(E),
                          write('|'),
                          display_line_p1(Es).

display_line_p2([]).
display_line_p2(E):- display_tile_p2(E,g),nl.
display_line_p2([E|Es]):- display_tile_p2(E,g),
                          write('|'),
                          display_line_p2(Es).

display_line_p3([]).
display_line_p3(E):- display_tile_p3(E), nl.
display_line_p3([E|Es]):- display_tile_p3(E),
                          write('|'),
                          display_line_p3(Es).

display_tile_p1(p1):-draw_tile1_MV.
display_tile_p1(p2):-draw_tile2_1LR.
display_tile_p1(p3):-draw_tile1_MV.
display_tile_p1(p4):-draw_tile4_1.
display_tile_p1(p8):-draw_tile8_1.
display_tile_p1(s):- draw_empty.


display_tile_p2(p1,R):-draw_empty(R).
display_tile_p2(p2,R):-draw_empty(R).
display_tile_p2(p3,R):-draw_tile3_2(R).
display_tile_p2(p4,R):-draw_tile4_2(R).
display_tile_p2(p8,R):-draw_tile8_2(R).
display_tile_p2(s,R):- draw_empty(R).

display_tile_p3(p1):-draw_empty.
display_tile_p3(p2):-draw_tile2_3LR.
display_tile_p3(p3):-draw_empty.
display_tile_p3(p4):-draw_tile4_3.
display_tile_p3(p8):-draw_tile8_3.
display_tile_p3(s):-draw_empty.

display_line_separator(T):- write('  -----------------------------------').
display_first_line(T):- write('   A     B     C     D     E     F'), nl.


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
draw_start_hand(T). % buscar 3 Soldado aleatorios á pool
                    % para a mao do jogador

% dar iron tiles aos jogadores 2 ao 1º, 1 ao 2º.
place_X_tile(Location).% colocar iron tiles no tabuleiro


/*Inicio de turno*/

placeSoldier(S). %colocar um soldado da mao Soldado no tabuleiro

/*Jogadas de ataque  */
attack(Peca). % atacar as peças á volta ( trocar o dono da peça)

/*Casas bloqueadas */
surrounded_tiles(Pecas). %casas bloqueadas em todas as direçoes

/*Conquistar casas*/
conquest_tile(Peca). % remover peca  e deixar marca do Jogador

/*final do turno*/
getSoldier(S). % retirar  um Soldado aleatorio á pool.


/*Game end */
game_end(D). % todos os quadrados atribuidos a jogadores  e sem pecas em campo.


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



game(X):-intermediate_board(X), display_first_line(X), display_board(X, 1).

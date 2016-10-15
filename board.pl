board([[s,s,s,s,s,s],
       [s,s,s,s,s,s],
       [s,s,s,s,s,s],
       [s,s,s,s,s,s],
       [s,s,s,s,s,s],
       [s,s,s,s,s,s]]).

intermediate_board([[a1U,a1R,a1D,a1L,s,s],
                    [a2L,a2R,s,s,s,b8],
                    [a3U,a3R,a3D,a3L,s,b4],
                    [a4,s,b3L,b3D,b3R,b3U],
                    [a8,s,s,s,b2R,b2L],
                    [s,s,b1L,b1D,b1R,b1U]]).


/* Peças vao ter o seguinte significado:
    Jogador - Tipo de peca - direccao
    Exemplo: a3R - jogador A, peca com 3 direccoes e virada para a direita
    Quando uma casa e dominada fica apenas a letra do jogador. Ex: A */


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
display_line_p2([E|Es]):- display_tile_p2(E),
                          write('|'),
                          display_line_p2(Es).

display_line_p3([]).
display_line_p3(E):- display_tile_p3(E), nl.
display_line_p3([E|Es]):- display_tile_p3(E),
                          write('|'),
                          display_line_p3(Es).

display_tile_p1(a1U):-draw_tile1_MV.
display_tile_p1(a1R):-draw_empty.
display_tile_p1(a1D):-draw_empty.
display_tile_p1(a1L):-draw_empty.
display_tile_p1(a2L):-draw_tile2_1LR.
display_tile_p1(a2R):-draw_tile2_1RL.
display_tile_p1(a3U):-draw_tile1_MV.
display_tile_p1(a3R):-draw_tile1_MV.
display_tile_p1(a3D):-draw_empty.
display_tile_p1(a3L):-draw_tile1_MV.
display_tile_p1(a4):-draw_tile4_1.
display_tile_p1(a8):-draw_tile8_1.
display_tile_p1(b1U):-draw_tile1_MV.
display_tile_p1(b1R):-draw_empty.
display_tile_p1(b1D):-draw_empty.
display_tile_p1(b1L):-draw_empty.
display_tile_p1(b2L):-draw_tile2_1LR.
display_tile_p1(b2R):-draw_tile2_1RL.
display_tile_p1(b3U):-draw_tile1_MV.
display_tile_p1(b3R):-draw_tile1_MV.
display_tile_p1(b3D):-draw_empty.
display_tile_p1(b3L):-draw_tile1_MV.
display_tile_p1(b4):-draw_tile4_1.
display_tile_p1(b8):-draw_tile8_1.

display_tile_p1(s):- draw_empty.


display_tile_p2(a1U):-draw_empty(a).
display_tile_p2(a1R):-draw_tile1_MHR(a).
display_tile_p2(a1D):-draw_empty(a).
display_tile_p2(a1L):-draw_tile1_MHL(a).
display_tile_p2(a2L):-draw_empty(a).
display_tile_p2(a2R):-draw_empty(a).
display_tile_p2(a3U):-draw_tile3_2(a).
display_tile_p2(a3R):-draw_tile1_MHR(a).
display_tile_p2(a3D):-draw_tile3_2(a).
display_tile_p2(a3L):-draw_tile1_MHL(a).
display_tile_p2(a4):-draw_tile4_2(a).
display_tile_p2(a8):-draw_tile8_2(a).
display_tile_p2(b1U):-draw_empty(b).
display_tile_p2(b1R):-draw_tile1_MHR(b).
display_tile_p2(b1D):-draw_empty(b).
display_tile_p2(b1L):-draw_tile1_MHL(b).
display_tile_p2(b2L):-draw_empty(b).
display_tile_p2(b2R):-draw_empty(b).
display_tile_p2(b3U):-draw_tile3_2(b).
display_tile_p2(b3R):-draw_tile1_MHR(b).
display_tile_p2(b3D):-draw_tile3_2(b).
display_tile_p2(b3L):-draw_tile1_MHL(b).
display_tile_p2(b4):-draw_tile4_2(b).
display_tile_p2(b8):-draw_tile8_2(b).

display_tile_p2(s):- draw_empty.


display_tile_p3(a1U):-draw_empty.
display_tile_p3(a1R):-draw_empty.
display_tile_p3(a1D):-draw_tile1_MV.
display_tile_p3(a1L):-draw_empty.
display_tile_p3(a2L):-draw_tile2_3LR.
display_tile_p3(a2R):-draw_tile2_3RL.
display_tile_p3(a3U):-draw_empty.
display_tile_p3(a3R):-draw_tile1_MV.
display_tile_p3(a3D):-draw_tile1_MV.
display_tile_p3(a3L):-draw_tile1_MV.
display_tile_p3(a4):-draw_tile4_3.
display_tile_p3(a8):-draw_tile8_3.
display_tile_p3(b1U):-draw_empty.
display_tile_p3(b1R):-draw_empty.
display_tile_p3(b1D):-draw_tile1_MV.
display_tile_p3(b1L):-draw_empty.
display_tile_p3(b2L):-draw_tile2_3LR.
display_tile_p3(b2R):-draw_tile2_3RL.
display_tile_p3(b3U):-draw_empty.
display_tile_p3(b3R):-draw_tile1_MV.
display_tile_p3(b3D):-draw_tile1_MV.
display_tile_p3(b3L):-draw_tile1_MV.
display_tile_p3(b4):-draw_tile4_3.
display_tile_p3(b8):-draw_tile8_3.

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

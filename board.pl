board([[s,s,s,s,s,s],
       [s,s,s,s,s,s],
       [s,s,s,s,s,s],
       [s,s,s,s,s,s],
       [s,s,s,s,s,s],
       [s,s,s,s,s,s]]).




display_board([]):-nl.
display_board([L1|Ls]):- display_line_p1(L1), nl,
                         display_line_p2(L1), nl,
                         display_line_p3(L1),nl,
                         display_board(Ls).

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
display_line_p3(E):- display_tile_p3(E),nl.
display_line_p3([E|Es]):- display_tile_p3(E),
                          write('|'),
                          display_line_p3(Es).

display_tile_p1(E):- E == p1 -> draw_tile1_MV;
                     E == p2 -> draw_tile2_1LR;
                     E == s -> draw_empty.

display_tile_p2(E,R):- E == p1 -> draw_empty(R);
                       E == p2 -> draw_tile2_3LR(R);
                       E == s  -> draw_empty(R).

display_tile_p3(E):- E == p1 -> draw_empty;
                     E == s -> draw_empty.



display_row_separator():- write('___|___|___|___|___|___').
display_first_line(E):-    write('_______________________'), nl.


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
getSolier(S). % retirar  um Soldado aleatorio á pool.


/*Game end */
game_end(D). % todos os quadrados atribuidos a jogadores  e sem pecas em campo.


draw_tile8_1:- write(''\' | /').
draw_tile8_2(R):- write('--'), write(R), write('--').
draw_tile8_3:- write('/ | '\'').

draw_tile1_MV:- write(' | ').
draw_tile1_MHL(R):-write('--'),write(R),write('  ').
draw_tile1_MHR(R):-write('  '),write(R),write('--').

draw_empty:- write('     ').
draw_empty(R):-write('  '),write(R),write('  ').

draw_tile2_1LR:- write(''\'   ').
draw_tile2_1RL:- write('    /').
draw_tile2_3LR:- write('    '\'').
draw_tile2_3RL:- write('/    ').


game(X):-board(X),display_board(X).

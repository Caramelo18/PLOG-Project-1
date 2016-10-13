board([[s,s,s,s,s,s],
       [s,s,s,s,s,s],
       [s,s,s,s,s,s],
       [s,s,s,s,s,s],
       [s,s,s,s,s,s],
       [s,s,s,s,s,s]]).




display_board([]):-nl.
display_board([L1|Ls]):- display_line(L1), nl, display_board(Ls).

display_line([]):-nl.
display_line([E]):- translate(E),nl, display_row_separator(E).
display_line([E|Es]):- translate(E), write('|'), display_line(Es).


display_row_separator(E):- write('___|___|___|___|___|___').
display_first_line(E):-    write('_______________________'), nl.

%casa do tabuleiro vazia
translate(s):- write('   ').
%cor do jogador
translate(r):- write('R').
translate(g):- write('G').

%tipos de peças
translate(p1):- write('1').
translate(p2):- write('2').
translate(p3):- write('3').
translate(p4):- write('4').
translate(p8):- write('8').
translate(pX):- write('X').



/*Pool de Soldados*/
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

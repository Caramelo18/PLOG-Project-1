board([[s,s,s,s,s,s],[s,s,s,s,s,s],[s,s,s,s,s,s],[s,s,s,s,s,s],[s,s,s,s,s,s],[s,s,s,s,s,s]]).
display_board([]):-nl.
display_board([L1|Ls]):- display_line(L1), nl, display_board(Ls).
display_line([]):-nl.
display_line([E]):- translate(E),nl, display_row_separator(E).
display_line([E|Es]):- translate(E), write('|'), display_line(Es).
translate(s):- write('  ').
display_row_separator(E):- write('__|__|__|__|__|__').
display_first_line(E):- write('_________________'), nl.

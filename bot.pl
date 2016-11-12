% level 1


/*
  Pick 1º from hand
  |        findEnemyTile
  |            -> if pick is t1, t3 ,t8
  |             |         checkempty
  |             |             -> Row-1,  Col,
  |             |             -> Row, Col-1,
  |             |             -> Row, Col +1.
  |             |             -> Row+1, Col
  |            -> if pick is t2, t4, t8
  |             |         checkempty
  |             |            -> Row -1, Col-1,
  |             |            -> Row -1, Col+1,
  |             |            -> Row +1, Col-1,
  |             |            -> Row +1, Col+1,
  |
  |        If some oferaly condictions are valid  place tile in direction to enemy tile.
  |
  |
  Non valid places
    -> findEmpty place and place tile there.

*/

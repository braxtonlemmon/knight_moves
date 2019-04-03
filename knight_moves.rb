#!/home/braxton/.rbenv/shims/ruby

# This program will have a function that accepts two inputs:
#   1) The coordinates of the chess square the knight is currently on
#   2) The coordinates of the chess square you desire to move the knight to
# The function will return the shortest path (using coordinates for moves) between the two squares
#
# TODO: The program must recognize a bad move. This happens when the potential move contains an x or y
#       coordinate that is < 0 or > 7.
# TODO: The program must use these figures when calculating potential landing spaces:
#       (-2, -1), (-2, +1), (-1, -2), (-1, +2), (+1, -2), (+1, +2), (+2, -1), (+2, +1)
# TODO: Decide which search algorithm is best for this problem.

# CHILDREN: all possible moves
# Take into consideration the graph
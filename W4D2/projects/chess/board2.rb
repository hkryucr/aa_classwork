'''
Board
instance var:
    @board = 2D array to hold each row
    - @sentinel : null piece class instance

methods:
    initialize
    - place ?

    [](pos) 
    []=(pos, val)
    move_piece(team_color, start_pos, end_pos) : 
        1. consider raising error if start_pos is Null Piece, 
        2. call valid_pos? on end_pos 
    valid_pos?(pos) : 
        call valid_moves from Piece class
    add_piece:(piece, pos)
        TO figure out when writing move_piece
        Consider making it a factory method for Piece.new 
    checkmate?(color)
        in_check? == true
        no move to remove the threat
        (call in_check & find_king)
    in_check?(color)
        king threatened with capture
         (call find_king)
    find_king?(color)
        return pos of king for in_check? and checkmate?
    pieces
        to get start_pos of non-null pieces
    dup
        make a dup of the current state of board
    move_piece!(team_color, start_pos, end_pos) 
        mutate the board
'''

'''
Piece
instance var:
    @color
    @board
    @pos

methods:
    #


'''
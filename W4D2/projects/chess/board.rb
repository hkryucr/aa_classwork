require_relative "piece.rb"
require_relative "null_piece.rb"

class Board
    attr_reader :board
    def initialize 
        @board = Array.new(8){Array.new(8, nil)}
        @sentinel = NullPiece.new
    end

    def [](pos)
        x, y = pos
        board[x][y]
    end

    def []=(pos, val)
        x, y = pos
        board[x][y] = val
    end

    def valid_pos?(pos)
        
    end

    def move_piece (team_color, start_pos, end_pos)

    end

    def pieces

    end


    # private
    # attr_reader :sentinel

end
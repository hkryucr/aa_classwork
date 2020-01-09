require_relative "piece.rb"

class Pawn < Piece
    attr_reader :symbol
    def initialize(color, board, pos)
        super(color, board, pos)
        @symbol = :pawn
    end

    def at_start_row?
        (pos[0] == 1 && color == "black") || (pos[1] == 6 && color == "white")
    end

    def forward_dir
        if color == "black"
            return 1
        elsif color == "white"
            return -1
        end
    end

    def forward_steps
        if at_start_row?
            return forward_dir * 2
        else
            return forward_dir
        end
    end

    def side_attacks
        possible_moves = []
        row, col = pos
        if color == "black"
            new_pos = [[row + 1, col + 1],[row + 1, col - 1]]
            

            
        end

    end

end
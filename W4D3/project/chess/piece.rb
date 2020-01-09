class Piece
    attr_reader :color, :board, :pos
    def initialize (color, board, pos)
        @color = color
        @board= board
        @pos = pos
    end

    def to_s
    end

    def empty?
    end
end



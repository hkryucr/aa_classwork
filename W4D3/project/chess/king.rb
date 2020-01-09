require_relative "piece.rb"
require_relative "stepable.rb"

class King < Piece
    include Stepable
    attr_reader :symbol
    def initialize(color, board, pos)
        super(color, board, pos)
        @symbol = :king
    end
end
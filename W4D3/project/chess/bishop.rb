require_relative "piece.rb"
require_relative "slideable.rb"

class Bishop < Piece
    include Slideable
    attr_reader :symbol
    
    def initialize(color, board, pos)
        super(color, board, pos)
        @symbol = :bishop
    end
end
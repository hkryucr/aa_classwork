require_relative "piece.rb"
require "singleton"

class NullPiece < Piece

    include Singleton
    attr_reader :symbol
    
    def initialize 
        # super(color, board, pos) 
        @symbol = :null_piece 
    end
end
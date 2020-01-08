require_relative "piece.rb"

class NullPiece < Piece
    attr_reader :null_piece
    def initialize()
        super
        @null_piece = nil
    end
end
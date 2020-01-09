require_relative "king.rb"
require_relative "rook.rb"
require_relative "knight.rb"
require_relative "bishop.rb"
require_relative "queen.rb"
require_relative "pawn.rb"
require_relative "null_piece.rb"

class Board
    attr_reader :rows, :sentinel

    BLACK = {}
    WHITE = {}

    def self.start_board 
        black_dic = {"Pawn" => (0..7).to_a.map{|idx|[1]+[idx]}, "Rook" => [[0,0],[0,7]], "Knight" => [[0,1],[0,6]], "Bishop" => [[0,2],[0,5]], "King" => [[0,3]], "Queen" => [[0,4]]}
        black_dic.keys.each do |key|
            black_dic[key].each do |pos|
                BLACK[pos] = key
            end     
        end
        white_dic = {"Pawn" => (0..7).to_a.map{|idx|[6]+[idx]}, "Rook" => [[7,0],[7,7]], "Knight" => [[7,1],[7,6]], "Bishop" => [[7,2],[7,5]], "King" => [[7,3]], "Queen" => [[7,4]]}
         white_dic.keys.each do |key|
            white_dic[key].each do |pos|
                WHITE[pos] = key
            end     
        end
    end

    def initialize 
        @rows = Array.new(8){Array.new(8, nil)} 
        Board.start_board
        @rows.each_with_index do |row_el, row|
            row_el.each_with_index do |el, col|
                current_pos = [row, col]
                if BLACK.include?(current_pos)  
                    case BLACK[current_pos] 
                    when "Pawn" 
                        @rows[row][col] = Pawn.new("black", self, current_pos)
                    when "Rook"
                        @rows[row][col] = Rook.new("black", self, current_pos)
                    when "Bishop"
                        @rows[row][col] = Bishop.new("black", self, current_pos)
                    when "King"
                        @rows[row][col] = King.new("black", self, current_pos) 
                    when "Knight"
                        @rows[row][col] = Knight.new("black", self, current_pos) 
                    when "Queen"
                        @rows[row][col] = Queen.new("black", self, current_pos)
                    end
                elsif WHITE.include?(current_pos)
                    case WHITE[current_pos]
                    when "Pawn" 
                        @rows[row][col] = Pawn.new("white", self, current_pos)
                    when "Rook"
                        @rows[row][col] = Rook.new("white", self, current_pos)
                    when "Bishop"
                        @rows[row][col] = Bishop.new("white", self, current_pos)
                    when "King"
                        @rows[row][col] = King.new("white", self, current_pos) 
                    when "Knight"
                        @rows[row][col] = Knight.new("white", self, current_pos) 
                    when "Queen"
                        @rows[row][col] = Queen.new("white", self, current_pos)
                    end
                else
                    @rows[row][col] = NullPiece.instance
                end
            end
        end
        @sentinel = NullPiece.instance
    end

    def [](pos)
        x, y = pos
        @rows[x][y]
    end

    def []=(pos, val)
        x, y = pos
        @rows[x][y] = val
    end

    def valid_pos?(pos)
        # board(pos) == sentinel
        # self[pos] == sentinel
        pos.all? { |el| el.between?(0,7)}
    end

    def move_piece (start_pos, end_pos)
        raise "Invalid start move" if !valid_pos?(start_pos) || self[start_pos] == sentinel
        selected = self[start_pos]
        possible_moves = selected.moves
        non_in_check_moves = selected.valid_moves
        raise "Invalid end move" if !possible_moves.include?(end_pos)
        raise "You may not make any move that places or leaves your king in check" if !non_in_check_moves.include?(end_pos)

        self[end_pos] = selected
        self[start_pos] = sentinel
    end

    def pieces

    end
end

b1 = Board.new

# # b1.valid_pos?([3,3])
# # b1.valid_pos?([1,1])
# # b1.move_piece([1,1], [3,3])
# # # p b1[[1,1]]
# # # p b1[[3,3]]
# # p b1.[]([3,3])
# rook1 = Rook.new("black", b1,[0,3])
# p rook1.grow_unblocked_moves_in_dir(1, 1)
# b1[[3,3]] = Rook.new("black", b1, [3,3])
b1[[0,0]].moves
#  = Bishop.new("black", b1, [4,4])
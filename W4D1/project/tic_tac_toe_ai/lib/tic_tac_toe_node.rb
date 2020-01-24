require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos

  end

  def losing_node?(evaluator)
    return true if board.over? && board.winner != evaluator

    if evaluator != next_mover_mark
      return true if self.children.all? { |child| child.losing_node?(evaluator) }
    end

    if evaluator == @next_mover_mark
      return true if self.children.any? { |child| !child.losing_node?(evaluator) }
    end

    false
  end

  def winning_node?(evaluator)
    return true if board.over? && board.winner == evaluator

    if evaluator == next_mover_mark
      return true if self.children.any? { |child| child.winning_node?(evaluator) }
    end

    if evaluator != next_mover_mark
      return true if self.children.all? { |child| !child.winning_node?(evaluator) }
    end

    false
  end
  
  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    possible_states = []
    board_arr = board.rows
    board_arr.each_with_index do |row, idx1|
      row.each_with_index do |el, idx2|
        next if el != nil

        new_mark = (next_mover_mark == :o) ? :x : :o
        board_dup = board.dup
        board_dup[[idx1, idx2]] = next_mover_mark 
        prev_move_pos = [idx1, idx2]
        new_tictictac_node = TicTacToeNode.new(board_dup, new_mark, prev_move_pos)
        possible_states << new_tictictac_node 
      end
    end
    possible_states
  end

end

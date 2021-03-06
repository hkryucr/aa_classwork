require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    # new_mark = (mark == :o) ? :x : :o

    # t1 = TicTacToeNode.new(game.board, mark)
    # t1.children.each {|child| return child.prev_move_pos if child.winning_node?(mark)}
    # t1.children.each {|child| return child.prev_move_pos if child.losing_node?(mark) == false}
    # raise "TTT"
    node = TicTacToeNode.new(game.board, mark)

    possible_moves = node.children.shuffle

    # If any move results in a #winning_node? we want to choose that
    # one. Find picks the first of the winning moves in
    # `possible_moves`.
    node = possible_moves.find { |child| child.winning_node?(mark) }

    # Stop if we found a winner. `node` may be `nil` if there are no
    # winning moves to make.
    return node.prev_move_pos if node

    # Maybe there is no winning move. Then at least don't pick a
    # loser.
    node = possible_moves.find { |child| !child.losing_node?(mark) }

    return node.prev_move_pos if node

    # If the computer plays perfectly, we should never be able to
    # force it to lose. Let's raise an alarm in that case!
    raise "Wait, it looks like I'm going to lose?"
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end

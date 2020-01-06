require_relative "move-tree.rb"

class KPF    
    attr_reader :root_node, :considered_pos

    DELTAS = [[2,1],[2,-1],[-2,1],[-2,-1],[1,2],[1,-2],[-1,2],[-1,-2]]

    def initialize(pos)
        @root_node = pos
        @considered_pos = [pos]
    end

    def self.valid_moves(pos)
        pos_x, pos_y = pos
        arr = []
        DELTAS.each do |del_pos|
            del_x, del_y = del_pos
            cur_pos = [pos_x+del_x, pos_y+del_y]
            arr << cur_pos if cur_pos.all? {|x| x.between?(0, 8)}
        end
        arr
    end

    def new_move_positions(pos)
        candidates = KPF.valid_moves(pos)
        filtered = candidates.reject { |el| @considered_pos.include?(el) }
        @considered_pos += filtered
        filtered
    end

    def build_move_tree(pos)
        
        tree = Tree.new(pos)
        tree.children += self.new_move_positions(pos)
        # 0,0 (parent-> [1,2] [2,1](children)

        # 1,2 (parent-> [3,5] [2,4](children)


    end

end


# k2 = KnightPathFinder.valid_moves([0,0])
# k2 = KnightPathFinder.valid_moves([3,2])

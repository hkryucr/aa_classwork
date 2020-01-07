require_relative "move-tree.rb"
require "set"

class KPF    
    attr_reader :root_node, :considered_pos

    DELTAS = [[1,2],[2,-1],[-2,1],[-2,-1],[2,1],[1,-2],[-1,2],[-1,-2]]

    def initialize(pos)
        @root_node = pos
        @considered_pos = Set.new
    end

    def self.valid_moves(pos)
        pos_x, pos_y = pos
        arr = []
        DELTAS.each do |del_pos|
            del_x, del_y = del_pos
            cur_pos = [pos_x + del_x, pos_y + del_y]
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

    def build_move_tree
        
        curr_pos = Tree.new(@root_node)
        # curr_moves.children += self.new_move_positions(@root_node)
        # 0,0 (parent-> [1,2] [2,1](children)
        # 1,2 (parent-> [3,5] [2,4](children)

        # BFS
        queue = [curr_pos]

        while !queue.empty?
            curr_node = queue.shift
            # p curr_node.pos
            children = new_move_positions(curr_node.pos)
            children.each do |pos|
                child_node = Tree.new(pos)
                child_node.parent = curr_node
                curr_node.children << child_node
                queue << child_node
            end
        end
        curr_pos
    end

    # bfs
    def find_path(end_pos)
        # bfs [1,2]
        queue = [self.build_move_tree]

        while !queue.empty?
            curr_node = queue.shift
            if curr_node.pos == end_pos
                return curr_node
            else
                queue += curr_node.children  
            end
        end
        nil
    end
#  [1,2]

    # def find_path(end_pos, start_node = self.build_move_tree)
    #     if start_node.pos == end_pos
    #         return start_node
    #     else
    #         children = start_node.children
    #         children.each do |child|
    #             child_find_path = find_path(end_pos, child)
    #             return child_find_path if child_find_path != nil
    #         end
    #     end
    #     nil
    # end

    def trace_path_back(end_pos)
        last_node = self.find_path(end_pos)
        return "we can't find the end pos" if last_node == nil
        path_arr = [last_node.pos]

        until last_node.parent == nil
            path_arr << last_node.parent.pos
            last_node = last_node.parent
        end

        path_arr.reverse
    end

end
k2 = KPF.new([0,0])
# p k2.find_path([8,7])
p k2.trace_path_back([6,2])
# k2 = KnightPathFinder.valid_moves([3,2])

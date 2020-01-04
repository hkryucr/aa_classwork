class PolyTreeNode
    attr_reader :parent, :children, :value

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(node=nil)
        if node == nil
            @parent = nil
            return nil 
        end 
        self.parent.children.delete(self) if @parent != nil
    
        node.children << self if !node.children.include?(self) 

        @parent = node
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        raise if child_node.parent != self
        child_node.parent = nil
    end

    def dfs(target_value) # 6
        return self if self.value == target_value

        children.each do |child| # 3, 2
            child_dfs = child.dfs(target_value) # 3 
            return child_dfs if child_dfs != nil
        end

        return nil
    end

#     '''
#       1 <= level 1
#     /  \
#     3   2
#    / \ / \
#    4 5 6 7
#     ''' 
# queue = [1,3,2,4,5,6,7] 

    def bfs(target_value)

        queue = [self] # <= insert self 

        while !queue.empty? # <= every while loop, shift from queue
            cur_node = queue.shift
            return cur_node if cur_node.value == target_value
            if !cur_node.children.empty?
                queue += cur_node.children
            end
        end
        nil
    end

end
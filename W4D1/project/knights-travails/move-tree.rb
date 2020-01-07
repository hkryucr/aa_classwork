class Tree

    attr_accessor :pos, :parent, :children

    def initialize (pos)
        @pos = pos
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
end
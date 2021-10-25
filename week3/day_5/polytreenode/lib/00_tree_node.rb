require "byebug"
class PolyTreeNode
    attr_reader :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil  
        @children = []
    end

    def parent=(new_parent)
        unless self.parent == nil
            old_parent = self.parent
            old_parent.children.delete(self)
        end

        @parent = new_parent
        new_parent.children << self unless new_parent == nil || new_parent.children.include?(self)
    end

    def add_child(child)
        child.parent = self
    end

    def remove_child(child)
        raise 'node is not a child' if child.parent == nil
        child.parent = nil
    end

    def dfs(target)
        return self if self.value == target
        self.children.each do |child|
            result = child.dfs(target)
            return result unless result.nil?
        end
        nil
    end

    def bfs(target)
        arr = [self]
        until arr.empty?
            node = arr.shift
            return node if node.value == target
            arr.concat(node.children)
        end
    end
end
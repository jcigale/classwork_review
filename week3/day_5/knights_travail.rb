require_relative "./polytreenode/lib/00_tree_node.rb"

class KnightPathFinder
    attr_reader :root_node, :start_pos, :considered_positions

    MOVES = [
    [-2, -1],
    [-2,  1],
    [-1, -2],
    [-1,  2],
    [ 1, -2],
    [ 1,  2],
    [ 2, -1],
    [ 2,  1]
    ]

    def self.valid_pos?(pos)
        pos.all? {|coord| if coord.between?(0,7)}
    end

    def self.valid_moves(pos)
        valid_moves = []
        MOVES.each do |move|
            new_pos = [pos.first + move.first, pos.last + move.last]
            valid_moves << new_pos if self.valid_pos?(new_pos)
        end
        valid_moves
    end

    def initialize(start_pos)
        @start_pos = start_pos
        @considered_positions = [start_pos]
        @root_node = PolyTreeNode.new(star_pos)

        build_move_tree
    end

    def new_move_positions(pos)
        valid_moves = KnightPathFinder.valid_moves
        considered_positions.concat(valid_moves.select{|move| !considered_positions.include?(move)})
    end

    def build_move_tree
        

    end

end

# kpf = KnightPathFinder.new([0, 0])

# p kpf.find_path([2, 1]) # => [[0, 0], [2, 1]]
# p kpf.find_path([3, 3]) # => [[0, 0], [2, 1], [3, 3]]
require_relative 'polytreenode'
class KnightPathFinder
  KNIGHT_MOVES =[[-1, -2],
                 [-1,  2],
                 [ 1, -2],
                 [ 1,  2],
                 [-2, -1],
                 [-2,  1],
                 [ 2, -1],
                 [ 2,  1]]

  def initialize(start_pos)
    @visited_positions = [start_pos] # positions that exist as values in our tree
  end

  def new_move_positions(pos)
    new_moves = KnightPathFinder.valid_moves(pos)
    new_moves.select!{|pos| !@visited_positions.include?(pos)}
    @visited_positions += new_moves
    new_moves
  end

  def self.valid_moves(pos)
    results = KNIGHT_MOVES.map do |knight_move|
       xpos = knight_move[0] + pos[0]
       ypos = knight_move[1] + pos[1]
       [xpos, ypos]
    end

    results.select {|pos| pos.all?{|i| i.between?(0,7)}}
  end

  def build_move_tree
    root = PolyTreeNode.new(@visited_positions[0])
    queue = [root]
    until queue.empty?
      parent = queue.shift
      new_move_positions(parent.value).each do |pos|
        new_node = PolyTreeNode.new(pos)
        new_node.parent = parent
        queue << new_node
      end
    end

    root
  end

  def find_path(end_pos)
    @visited_positions = [@visited_positions.first]
    root = build_move_tree
    root.bfs(end_pos).trace_path_back
  end

end


kpf = KnightPathFinder.new([0,0])
#
p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]

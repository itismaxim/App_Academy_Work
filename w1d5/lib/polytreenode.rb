class PolyTreeNode
  attr_reader :parent
  attr_accessor :children, :value

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent= (parent_node)
    self.parent.children.delete(self) if has_parent?
    @parent = parent_node
    parent_node.children << self if has_parent?
  end

  def has_parent?
    @parent ? true : false
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child)
    children[children.index(child)].parent = nil
    # return nil if !children.include?(child)
  end

  def dfs(target_value)
    return self if @value == target_value
    self.children.each do |child|
      searched_child = child.dfs(target_value)
      return searched_child unless searched_child.nil?
    end
    nil
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      current_node = queue.shift
      if current_node.value == target_value
        return current_node
      else
        queue += current_node.children
      end
    end
    nil
  end

  def trace_path_back
    return [@value] if !has_parent?
    @parent.trace_path_back << @value
  end

end

# nodes = ('a'..'g').map { |value| PolyTreeNode.new(value) }
#
# parent_index = 0
# nodes.each_with_index do |child, index|
#   next if index.zero?
#   child.parent = nodes[parent_index]
#   parent_index += 1 if index.even?
# end

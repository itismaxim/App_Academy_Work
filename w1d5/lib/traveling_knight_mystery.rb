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
    @visited_positions = [start_pos]
  end

  def self.valid_moves(pos)
    p KNIGHT_MOVES
    # So here is KNIGHT_MOVES. Next we call #map on it. 
    # But #map returns a COPY of that array. It shouldn't mutate it.
    results = KNIGHT_MOVES.map do |knight_move|
       knight_move[0] += pos[0]
       knight_move[1] += pos[1]
       knight_move
    end
    p KNIGHT_MOVES #Here you will see that KNIGHT_MOVES has changed.
    # You would expect that if I ran new_move_positions again, it would change
    # each chess position by that, which would give really weird new moves.
    
    # NOPE. Instead it returns the same array it gave me last time.
    # It's just all mysteries man.
    results.select {|pos| pos.all?{|i| i.between?(0,7)}}
  end

  def new_move_positions(pos)
    new_moves = KnightPathFinder.valid_moves(pos)
    new_moves.select{|pos| !@visited_positions.include?(pos)}
    @visited_positions += new_moves
    new_moves
  end
end

blah = KnightPathFinder.new([0,0])

p KnightPathFinder.valid_moves([4,3])
puts "stuff"
p blah.new_move_positions([2,6])

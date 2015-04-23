class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(3) { Array.new(3) }
  end

  def [](row, col)
    @grid[row][col]
  end

  def []=(row, col, mark)
    @grid[row][col] = mark
  end
  
  def won?
    #if there's three in a row, return true
    #else false
    return true if #some code
    return false
  end
  
  def pos
    #this returns the array [x,y] or something like that.
    # do I need this?
  end
  
  def winner
    
  end
  
  def empty?(pos)
    #this accepts an array? or... I am tired.
    grid[*pos].empty?
  end
  
  def place_mark(pos, mark)
    
  end
end

class Game
  def initialize(player1, player2)
    @board = Board.new
    @player1 = player1
    @player2 = player2
    #maybe other things?
  end


  def play
    board = Board.new
    
    
  
  end

end

class HumanPlayer



end

class ComputerPlayer
  #I win if I can.
  #Other wise, I just make a random move.
end


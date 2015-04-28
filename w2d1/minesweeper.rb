module Minesweeper

  class Board
    attr_reader :grid

    def initialize(size = 9, bomb_count = 10)
      @grid = Array.new(size) { Array.new(size) { Tile.new } }
      @size = size
      @bomb_count = bomb_count

      existing_bombs = 0
      until existing_bombs == @bomb_count
        x = rand(@size)
        y = rand(@size)
        unless @grid[x][y].bomb
          @grid[x][y].make_bomb
          existing_bombs += 1
        end
      end

      @grid.each_with_index do |row, i|
        row.each_with_index do |tile, j|
          tile.set_neighbors(i, j, @grid)
          tile.neighbor_bomb_count(i, j, @grid) unless tile.bomb
        end
      end
    end

    def display
      @grid.each_with_index do |row, i|
        display_string = ""
        row.each {|tile| display_string += tile.display_state + " "}
        puts "#{display_string}\n"
      end
    end

    def reveal_bombs
      @grid.each do |row|
        row.each do |tile|
          tile.revealed = true if tile.bomb
        end
      end
    end

  end


  class Tile
    attr_reader :bomb_count, :bomb, :flagged
    attr_accessor :revealed
    def initialize
      @revealed = false
      @flagged = false
      @bomb = false
      @bomb_count = 0
      @neighbors = []
    end

    def display_state
      return 'F' if flagged
      return '*' if !revealed
      return '_' if @bomb_count == 0
      # This is the display version that shows you what it is for real
      return 'B' if @bomb
      return "#{@bomb_count}"
    end

    def make_bomb
      @bomb = true
      @bomb_count = nil
    end

    def set_neighbors(x, y, board)
      (x - 1..x + 1).each do |row|
        next if row < 0 || row >= board.size
        (y - 1..y + 1).each do |column|
          next if column < 0 || column >= board.size
          @neighbors << board[row][column] unless row == x && column == y
        end
      end
    end

    def neighbor_bomb_count(x, y, board)
      # is it stylistically correct to demand arguements just to pass to another method?
      @neighbors.each do |tile|
        @bomb_count += 1 if tile.bomb
      end
    end

    def reveal_tile
      if @flagged

      elsif @bomb_count > 0
        @revealed = true
      elsif !@revealed
        @revealed = true
        @neighbors.each { |tile| tile.reveal_tile }
      end

      nil
    end

    def toggle_flag
      @flagged = !@flagged
    end

  end

  class Game

    def initialize(size, bomb_num)
      @board = Board.new(size, bomb_num)
      @lost = false
    end

    def play
      until won? || @lost
        @board.display
        print "Type 'f' to flag, or 'r' to reveal (f/r). > "
        move_type = gets.chomp
        print "Enter row and column (x y). > "
        move_pos = gets.chomp.split.map { |str| str.to_i - 1 }
        p move_pos
        if move_type == 'f'
          @board.grid[move_pos[0]][move_pos[1]].toggle_flag
        elsif move_type == 'r'
          @lost = @board.grid[move_pos[0]][move_pos[1]].bomb
          @board.grid[move_pos[0]][move_pos[1]].reveal_tile if !@lost #if bomb is picked, game over
        else
          "Actually, I don't know what '#{move_type}' means..."
        end
        puts
      end
      @lost ? display_loss : display_win
    end

    def won?
      won = true
      @board.grid.each do |row|
        row.each do |tile|
            won = false if !tile.bomb && !tile.revealed
        end
      end
      won
    end

    def display_win
      @board.display
      puts "Congrats! You won."
    end

    def display_loss
      @board.reveal_bombs
      @board.display
      puts "BOOM! You lose."
    end

  end

end

if __FILE__ == $PROGRAM_NAME
  print "Please enter how large of a grid you would like. > "
  size = gets.chomp.to_i
  print "Please enter how many bombs you would like. > "
  bomb_num = gets.chomp.to_i
  game = Minesweeper::Game.new(size, bomb_num)
  game.play
end

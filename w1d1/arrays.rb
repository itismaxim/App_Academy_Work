class Array
  def my_uniq
    result = []
    self.each_with_index do |element, idx|
      if self.index(element) == idx
        result << element
      end
    end
    result
  end

  def two_sum
    result = []
    self.each_with_index do |first_element, first_idx|
      (first_idx + 1...self.length).each do |second_idx|
        #  self.each_with_index do |second_element, second_idx|
        if first_element + self[second_idx] == 0
          result << [first_idx, second_idx].sort
        end
      end
    end
    result.uniq
  end

  def my_transpose
    result = Array.new(self.first.length) { Array.new(self.length) }
    # p result
    self.each_with_index do |row, i|
      row.each_with_index do |el, j|
        result[j][i] = el
      end
    end
    result
  end

  # def my_transpose
  #   result = []
  #   #sub_array = []
  #   (0...self.length).each do |row|
  #     sub_array = []
  #     (0...self[row].length).each do |column|
  #       #print self[column]
  #       #puts self[column].class
  #       #puts
  #       sub_array << self[column]
  #     end
  #     result << sub_array
  #   end
  #   result
  # end
  # #
  # def my_transpose!
  #   result = []
  #   until self[0].empty?
  #     column = []
  #     self.each do |row|
  #       #column = []
  #       column << row.shift
  #     end
  #     result << column
  #   end
  #   result
  # end
end

#p [[0, 1, 2], [3, 4, 5], [6, 7, 8]].my_transpose


def stock_picker(days)
  high_score = 0
  profit_days = []
  days.each_with_index do |buy_price, buy_day|
    (buy_day + 1...days.length).each do |sell_day|
      score = days[sell_day] - buy_price
      if score > high_score
        high_score = score
        profit_days = [buy_day, sell_day]
      end
    end
  end
  profit_days
end


def towers_of_hanoi
  def valid_from_peg? (input)
    if @pegs[input].empty? || input == 0
      false
    else
      true
    end
  end

  def valid_to_peg? (input)
    if input == @from_peg || input == 0
      false
    elsif @pegs[input].empty?
      true
    elsif @pegs[@from_peg].last > @pegs[input].last
      false
    else
      true
    end
  end

  puts "Hello! Welcome to towers of Hanoi!"
  puts "How many disks would you like?"
  number_of_discs = gets.chomp.to_i
  puts "Oh, #{number_of_discs} discs it is!"
  @pegs = [[], [], [], []]
  number_of_discs.downto(1).each { |i| @pegs[1] << i}
  @pegs[0] = @pegs[1].dup
  # Peg Zero is the victory condition. IT SHOULD NEVER CHANGE.
  until @pegs[3] == @pegs[0]
    p @pegs
    @from_peg = 0
    until valid_from_peg?(@from_peg)
      puts "Which peg do you take the disc from?"
      @from_peg = gets.chomp.to_i
      puts "Invalid peg!" if !(valid_from_peg?(@from_peg))
    end

    to_peg = 0
    until valid_to_peg?(to_peg)
      puts "Which peg would you like to place the disc on?"
      to_peg = gets.chomp.to_i
      puts "Invalid peg!" if !(valid_to_peg?(to_peg))
    end

    @pegs[to_peg] << @pegs[@from_peg].pop

  end
  puts "Congrats"
end


towers_of_hanoi


# Test of two_sum
# print [-1, 0, 2, -2, 1].two_sum
# puts

# Test of my_transpose
# [[0, 1, 2], [3, 4, 5], [6, 7, 8]].my_transpose
#puts

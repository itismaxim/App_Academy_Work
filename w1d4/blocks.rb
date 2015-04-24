class Array
  def my_each (&block)
    (self.length).times { |index| yield self[index] }
    self
  end

  def my_map (&block)
    arr = []

    self.my_each do |el|
      arr << block.call(el)
    end

    arr
  end

  def my_select (&block)
    arr = []

    self.my_each do |el|
      arr << el  if block.call(el) == true
    end
    arr
  end

  def my_inject(&block)
    result = self[0]
    self.slice(1, self.length-1).my_each do |el|
      result = block.call(result, el)
    end
    result
  end

  def my_sort!(&block)
    self.length.times do
      (self.length - 1).times do |i|
        rocket_number = block.call(self[i], self[i+1])
        if rocket_number == 1
          self[i], self[i+1] = self[i+1], self[i]
        end
      end
    end
    self
  end

  def my_sort(&block)
    self.dup.my_sort!(&block)
  end
end

def eval_block(*arg_array, &block)
  if block.nil?
    puts "NO BLOCK GIVEN"
  else
    block.call(*arg_array)
  end
end



# Example calls to eval_block
eval_block("Kerry", "Washington", 23) do |fname, lname, score|
  puts "#{lname}, #{fname} won #{score} votes."
end
# Washington, Kerry won 23 votes.
# => nil

eval_block(1,2,3,4,5) do |*args|
  args.inject(:+)
end
# => 15

eval_block(1, 2, 3)
# => "NO BLOCK GIVEN"

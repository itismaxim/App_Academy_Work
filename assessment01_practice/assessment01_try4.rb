class Array
  def my_inject(accumulator = nil, &block)
    array = self
    accumulator = self.shift if accumulator.nil?
    array.each do |el|
      accumulator = block.call(accumulator, el)
    end
    
    accumulator
  end
end

def is_prime?(num)
  (2...num).none? {|div| num % div == 0}
end

def primes(count)
  results = []
  current_num = 2
  until results.length == count
    results << current_num if is_prime?(current_num)
    current_num += 1
  end
  
  results
end

# the "calls itself recursively" spec may say that there is no method
# named "and_call_original" if you are using an older version of
# rspec. You may ignore this failure.
# Also, be aware that the first factorial number is 0!, which is defined
# to equal 1. So the 2nd factorial is 1!, the 3rd factorial is 2!, etc.
def factorials_rec(num)
  return [1] if num == 1
  results = []
  num.times do 
    last_facs = factorials_rec(num - 1)
    results =  last_facs << (last_facs.last * (num - 1))
  end
  results
  
end

class Array
  def dups
    results = {}
    self.each_with_index do |el, i|
      results.has_key?(el) ? results[el] << i : results[el] = [i]
    end
    results.select {|k,v| v.length > 1}
  end
  
end

class String
  def symmetric_substrings
    results = []
    (0...length).each do |i|
      (i...length).each do |j|
        results << self[i..j]
      end
    end
    results.select {|string| string.reverse == string && string.length > 1}
  end
end

class Array
  def my_each(&prc)
    array = self
    array.length.times do |i|
      array [i] = prc.call(array[i])
    end
    array
  end
  
  def merge_sort(&prc)
    return self if length < 2
    prc ||= Proc.new {|x,y| x <=> y}
    middle = length/2
    left = self[0...middle].merge_sort(&prc)
    right = self[middle...length].merge_sort(&prc)
    Array.merge(left, right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    results = []
    until left.empty? || right.empty?
      prc.call(left[0], right[0]) < 1 ? results << left.shift : results << right.shift
    end
    results + left + right
  end
end



def bubble_sort(array)
  sorted = false
  until sorted
    sorted = true
    (0...array.length-1).each do |i|
        if array[i] > array[i + 1]
          array[i], array[i + 1] = array[i + 1], array[i]
          sorted = false
        end
    end
  end
  array
end

p bubble_sort([0,4,6,2,9,7,1])
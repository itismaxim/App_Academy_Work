class Array
  def my_inject(accumulator = nil, &block)
    if accumulator == nil
      accumulator = self[0]
      self.slice(1...self.length).each do |el|
        accumulator = block.call(accumulator, el)
      end
    else
      self.each do |el|
        accumulator = block.call(accumulator, el)
      end
    end
    accumulator
  end
end

def is_prime?(num)
  return false if num < 2
  return true if num == 2
  (2...num).each do |divisor|
    return false if (num % divisor) == 0
   end
end

def primes(count)
  results = []
  current_num = 2
  until results.length == count
    results << current_num if is_prime?(current_num)
    current_num +=1
  end
  results
  #return 4
end

# the "calls itself recursively" spec may say that there is no method
# named "and_call_original" if you are using an older version of
# rspec. You may ignore this failure.
# Also, be aware that the first factorial number is 0!, which is defined
# to equal 1. So the 2nd factorial is 1!, the 3rd factorial is 2!, etc.
def factorials_rec(num)
  return [1] if num == 1
  results = nil
  num.times do
    last_fac = factorials_rec(num - 1)
    next_fac = last_fac.last * last_fac.length
    # p next_fac
    results = last_fac + [next_fac]
  end
  results
end

def factorials_it(num)
  results = []
  current_num = 0
  fac = 1
  num.times do
    results << fac
    current_num += 1
    fac *= current_num
  end
  results
end

class Array
  def dups
    results = {}
    self.each_with_index do |el, i|
      results.has_key?(el) ? results[el] << i : results[el] = [i]
    end
    results.select{|k, v| v.length > 1}
  end
end

class String
  def symmetric_substrings
    results = []
    (0...length).each do |start_pos|
      (start_pos...length).each do |end_pos|
        sub = self[start_pos..end_pos]
        results << sub if sub.reverse == sub && sub.length > 1
      end
    end
    results
  end
end

class Array
  def merge_sort(&prc)
    prc ||= Proc.new { |x, y| x <=> y }
    
    return self if length < 2
    middle = length/2
    left = self.slice(0, middle).merge_sort(&prc)
    right = self.slice(middle,length).merge_sort(&prc)
    Array.merge(left, right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    results = []
    until left.empty? || right.empty?
      comp = prc.call(left[0], right[0])

      comp < 1 ? results << left.shift : results << right.shift
    end
    results + left + right
  end
end
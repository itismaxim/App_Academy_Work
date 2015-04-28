class Array
  def my_inject(accumulator = nil, &block)
    array = self
    accumulator ||= array.shift
    array.each do |el|
      accumulator = block.call(accumulator, el)
    end
    accumulator
  end
end

def is_prime?(num)
  (2...num).none? {|i| num % i == 0}
end

def primes(count)
  results = []
  current_num = 2
  until results.length == count do
    results << current_num if is_prime?(current_num)
    current_num += 1
  end
  results
end

def factorials_rec(num)
  return [1] if num == 1
  results = []
  num.times do |i|
    last_facs = factorials_rec(num - 1)
    results = last_facs + [i * last_facs.last]
  end
  results
end

class Array
  def dups
    results = {}
    self.each_with_index do |el, i|
      !results.keys.include?(el) ? results[el] = [i] : results[el] += [i]
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
  def merge_sort(&block)
    return self if length < 2
    block ||= Proc.new { |x, y| x <=> y }
    middle = length / 2
    left = self[0...middle].merge_sort(&block)
    right = self[middle...length].merge_sort(&block)
    Array.merge(left, right, &block)
  end

  private
  def self.merge(left, right, &block)
    results = []
    until left.empty? || right.empty?
      judgement = block.call(left[0], right[0])
      judgement < 1 ? results << left.shift : results << right.shift
    end
    results + left + right
  end
end
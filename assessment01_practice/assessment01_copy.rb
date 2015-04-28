class Array
  def my_inject(accumulator = nil, &prc)
    array = self
    accumulator ||= array.shift
    array.each do |el|
      accumulator = prc.call(accumulator, el)
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
  until results.length == count
    results << current_num if is_prime?(current_num)
    current_num += 1
  end
  results
end

def factorials_rec(num)
  return [1] if num == 1
  results = []
  num.times do |i|
    prev_facs = factorials_rec(num - 1)
    results = prev_facs << prev_facs.last * i
  end
  results
end

class Array
  def dups
    results = {}
    self.each_with_index do |el, i|
      results.has_key?(el) ? results[el] << i : results[el] = [i]
    end
    results.select {|k, v| v.length > 1}
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
    results.select {|el| el.reverse == el && el.length > 1}
  end
end

class Array
  def merge_sort(&prc)
    return self if self.length < 2
    
    prc ||= Proc.new{|x, y| x <=> y}
    middle = length/2
    left = self[0...middle].merge_sort(&prc)
    right = self[middle...length].merge_sort(&prc)
    Array.merge(left, right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    results = []
    until left.empty? || right.empty?
      prc.call(left, right) < 1 ? results << left.shift : results << right.shift
    end
    results + left + right
  end
end
class Array
  def my_inject(accumulator = nil)
  end
end

def is_prime?(num)
    (2...num).none? {|factor| num % factor == 0}
end


def primes(count)
  found_primes = []
  current_num = 2
	until found_primes.length == count
    found_primes << current_num if is_prime?(current_num)
    current_num += 1
	end
  found_primes
end

# the "calls itself recursively" spec may say that there is no method
# named "and_call_original" if you are using an older version of
# rspec. You may ignore this failure.
# Also, be aware that the first factorial number is 0!, which is defined
# to equal 1. So the 2nd factorial is 1!, the 3rd factorial is 2!, etc.
def factorials_rec(num)
  return [1] if num == 0
  num.times do |num|
    facs = factorials_rec(num-1)
    facs << num * facs.last
    facs
  end
end

def factorial(num)
  return 1 if num == 0
  num * factorial(num - 1)
end

class Array
  def dups
  results = {}
  
  end
end

class String
  def symmetric_substrings
  end
end

class Array
  def merge_sort(&prc)
  end

  private
  def self.merge(left, right, &prc)
  end
end

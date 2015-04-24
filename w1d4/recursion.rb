require 'pry'

def range_r(first_num, last_num)
  if first_num == last_num
    [first_num]
  else
    (range(first_num, last_num - 1)) << last_num
  end
end

def range_i(first_num, last_num)
  result = []
  (last_num - first_num + 1).times do |i|
    result << (i + first_num)
  end
  result
end

def exp1 (b, e)
  if e == 0
    1
  else
    b * exp(b, e - 1)
  end
end

def exp2(b,n)
  if n == 0
    1
  elsif n == 1
    b
  elsif n.even?
    even_case = exp2(b, (n / 2))
    even_case * even_case
  else
    odd_case = (exp2(b, (n - 1)) / 2)
    b * odd_case * odd_case
  end
end

def deep_dup(array)
  copy = []
  array.length.times do |i|
    if array[i].class == Array
      copy << deep_dup(array[i])
    else
      copy << array[i]
    end
  end
  copy
end

def fibonacci (n)
  if n == 1
    [1]
  elsif n == 2
    [1, 1]
  else
    past_numbers = fibonacci(n-1)
    past_numbers << past_numbers[-1] + past_numbers[-2]
  end
end

def binary_search(array, target)
  if array.length == 0
    return nil
  end

  middle = array.length / 2

  if array[middle] == target
    middle
  elsif array[middle] > target
    left_array = array.slice(0...middle)
    binary_search(left_array, target)
  else
    right_array = array.slice((middle + 1)...array.length)
    result = binary_search(right_array, target)
    return nil if result.nil?
    middle + 1 + result
  end
end

def make_change(target_num, coins_array)
  return [] if target_num == 0
  best_purse_so_far = []
  coins_array.each do |coin|
    next if coin > target_num
    new_purse = make_change(target_num - coin, coins_array)
    new_purse << coin
    best_purse_so_far = new_purse if best_purshjfghjkl.khjb e_so_far.empty?
    best_purse_so_far = new_purse if new_purse.length < best_purse_so_far.length
  end
  best_purse_so_far
end

def merge_sort(array)
  sorted_array = []
  if array.empty? || array.length == 1
    return array
  else
    middle = array.length/2
    p array_a = merge_sort(array.slice(0...middle))
    p array_b = merge_sort(array.slice(middle...array.length))
    puts
    until array_a.empty? || array_b.empty?
      if array_a[0] < array_b[0]
        sorted_array << array_a.shift
      else
        sorted_array << array_b.shift
      end
    end
    sorted_array + array_a + array_b
  end
end

p merge_sort([7,2])
p merge_sort([14, 10, 7, 2])
p merge_sort([14, 10, 7, 1, 2, 5, 7, 4, 1, 1, 5])

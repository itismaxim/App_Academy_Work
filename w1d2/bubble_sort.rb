

require 'byebug'
# debugger

def bubble_sort(array)
  fully_sorted = false
  until fully_sorted
    fully_sorted = sort(array)
  end
  array
end

def sort(array)
  fully_sorted = true

  (0...array.length - 1).each do |i|
    if array[i] > array[i + 1]
      array[i], array[i+1] = array[i+1], array[i]
      fully_sorted = false
    end
  end

  fully_sorted
end
p bubble_sort([5,1,2,3,4])

def greatest_power(num, base) # greatest power of base less then number
  power = 0
  until base**power > num
    power += 1
  end
  power - 1
end

def convert_hexish(digit)
  hexish_hash = {
    0 => '0',
    1 => '1',
    2 => '2',
    3 => '3',
    4 => '4',
    5 => '5',
    6 => '6',
    7 => '7',
    8 => '8',
    9 => '9',
    10 => 'A',
    11 => 'B',
    12 => 'C',
    13 => 'D',
    14 => 'E',
    15 => 'F'
    }
    hexish_hash[digit]
end

def num_to_s(num, base)
  greatest_power = greatest_power(num, base)
  result = ""

  until greatest_power == -1
    digit = 0
    until num < base**greatest_power
      # puts "num: #{num} base: #{base} digit: #{digit} greatest: #{greatest_power}"
      num -= base**greatest_power
      digit += 1
      #puts digit
    end
    greatest_power -= 1
    result << convert_hexish(digit)
    #puts digit
  end
  result
end


# puts num_to_s(5, 2)
# puts num_to_s(5, 16)
# puts num_to_s(234, 10)
# puts num_to_s(234, 2)
# puts num_to_s(234, 16)
#
# puts num_to_s(100, 10)

def caesar (string, num)
  result = ""
  string = string.downcase
  (0...string.length).each do |loc|
    if string[loc].ord < 97
      result << string[loc]
    elsif string[loc].ord + num > 122
      result << (string[loc].ord + num - 26).chr
    else
      result << (string[loc].ord + num).chr
    end
  end
  result
end

p caesar("zany", 2) # => "bcpa"

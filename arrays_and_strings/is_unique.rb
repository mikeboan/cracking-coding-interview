# return true if string contains all unique characters
# O(n) time, O(n) memory using frequency hash
def is_unique?(str)
  freq = Hash.new(0)
  str.each_char { |char| freq[char] > 0 ? (return false) : freq[char] += 1}
  true
end

puts is_unique?('abcdefg') == true
puts is_unique?('abcdeafg') == false
puts is_unique?('abcdefga') == false
puts is_unique?('abcdefbg') == false


# return true if string contains all unique characters
# O(n^2) time, O(1) memory using no additional data structures
def is_unique_no_hash?(str)
  str.each_char.with_index do |char1, i1|
    str.each_char.with_index do |char2, i2|
      next if i2 <= i1 # micro-optimization, halve runtime.
      return false if char1 == char2
    end
  end
  true
end

puts is_unique_no_hash?('abcdefg') == true
puts is_unique_no_hash?('abcdeafg') == false
puts is_unique_no_hash?('abcdefga') == false
puts is_unique_no_hash?('abcdefbg') == false

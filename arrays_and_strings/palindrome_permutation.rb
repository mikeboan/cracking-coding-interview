# check if str is a permutation of a palindrome
# O(n) time, O(n) memory
def palindrome_permutation(str)
  freq = Hash.new(0)

  str.each_char { |char| freq[char] += 1 }

  freq.values.count { |f| !f.even? } < 2
end

puts palindrome_permutation('aabbccddeeff'.split.shuffle.join('')) == true
puts palindrome_permutation('aabbccddeeffg'.split.shuffle.join('')) == true
puts palindrome_permutation('aabbcdeeffg'.split.shuffle.join('')) == false

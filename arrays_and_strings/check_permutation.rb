# O(n) time, O(n) mem
def check_permutation?(str1, str2)
  return false if str1.length != str2.length

  freq = Hash.new(0)
  i = 0
  while i < str1.length do
    freq[str1[i]] += 1
    freq[str2[i]] -= 1
    i += 1
  end

  return freq.values.all? { |f| f == 0 }
end

puts check_permutation?('abcdefgh', 'abcdefgh'.split.shuffle.join('')) == true
puts check_permutation?('abcdefgh', 'aacdefgh'.split.shuffle.join('')) == false
puts check_permutation?('abccdefgh', 'abcdefgh'.split.shuffle.join('')) == false

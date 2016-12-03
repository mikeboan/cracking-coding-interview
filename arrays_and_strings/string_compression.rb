# Implement a method to perform basic string compression using the counts
# of repeated characters. For example, the string aabcccccaaa would become
# a2b1c5a3. If the "compressed" string would not become smaller than the
# original string, your method should return the original string. You can
# assume the string has only uppercase and lowercase letters (a - z).
#
def compress_string(str)
  compressed = ""
  curr_char = str[0]
  count = 1
  (str.length - 1).times do |i|
    if str[i + 1] == curr_char
      count += 1
    else
      compressed += "#{curr_char}#{count}"
      curr_char = str[i + 1]
      count = 1
    end
  end
  compressed += "#{curr_char}#{count}"
  compressed.length < str.length ? (return compressed) : (return str)
end

puts compress_string('aabcccccaaa') == 'a2b1c5a3'
puts compress_string('abcdefgh') == 'abcdefgh'

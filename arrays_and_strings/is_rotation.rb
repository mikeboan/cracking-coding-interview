# true if str2 is a rotation of string1
def is_rotation?(string, rotated)
  is_substring?(rotated + rotated, string)
end


# true if str1 is substring of str2
def is_substring?(search_text, substr)
  first_char_locations = []

  search_text.each_char.with_index do |char1, idx|
    first_char_locations << idx if char1 == substr[0]
  end

  first_char_locations.each do |i|
    j = 0
    while search_text[i] == substr[j] do
      i += 1
      j += 1
      return true if j == substr.length
    end
  end

  false
end


puts is_substring?(('a'..'z').to_a.join, 'lmnop')
puts is_rotation?('abcdefg', 'efgabcd')
puts is_rotation?('abcdefg', 'efgbacd') == false

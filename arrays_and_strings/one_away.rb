require 'byebug'
# One Away: There are three types of edits that can be performed on
# strings: insert a character, remove a character, or replace a character.
# Given two strings, write a function to check if they are one edit
# (or zero edits) away.

def one_away?(str1, str2)
  if str1.length == str2.length # check for replacement
    count = 0

    str1.length.times do |i|
      count += 1 if str1[i] != str2[i]
      return false if count > 1
    end

    return true
  elsif (str1.length - str2.length).abs == 1 # check for addition/deletion
    i = 0
    j = 0
    count = 0
    while i < str1.length && j < str2.length
      if str1[i] != str2[j]
        return false if (count += 1) > 1
        if str1[i] == str2[j + 1]
          j += 1
        elsif str1[i + 1] == str2[j]
          i += 1
        else
          return false
        end
      end
      i += 1
      j += 1
    end
    return true
  end
  false
end

puts one_away?('pale', 'ple') == true
puts one_away?('pales', 'pale') == true
puts one_away?('pale', 'bale') == true
puts one_away?('pale', 'bake') == false

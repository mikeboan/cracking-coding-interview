# replace spaces with %20
#
def urlify(str, url_length)
  str.gsub(' ', '%20')
end

puts urlify("Mr John Smith", 13) == "Mr%20John%20Smith"

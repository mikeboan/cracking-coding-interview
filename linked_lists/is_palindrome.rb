require_relative './node.rb'

# O(2n) time, O(n/2) memory
def is_palindrome?(node)
  stack = []
  length = get_length(node)

  ((length / 2.0).ceil).times do
    stack.push(node.val)
    node = node.next
  end

  stack.pop if length.odd? # discard middle element

  while node
    return false unless node.val == stack.pop
    node = node.next
  end

  true
end

def get_length(node)
  length = 0
  while node
    length += 1
    node = node.next
  end
  length
end

list = Node.new('a')
list.append('a')
list.append('a')
list.append('a')
list.append('b')
list.append('a')
list.append('a')
list.append('a')

puts is_palindrome?(list) == false

list.append('a')

puts is_palindrome?(list) == true

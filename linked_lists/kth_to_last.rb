require_relative './node.rb'
# return kth to last value in linked list
# O(n) time, O(1) memory
def kth_to_last(node, k)
  kth_node = node
  count = 0
  while count < k do
    return nil if node == nil
    node = node.next
    count += 1
  end

  while node.next do
    node = node.next
    kth_node = kth_node.next
  end

  kth_node.val
end

list = Node.new(-5)
list.append(-4)
list.append(-3)
list.append(-2)
list.append(-1)
list.append(0)
list.append(1)
list.append(2)
list.append(3)
list.append(4)
list.append(5)
list.append(6)
list.append(7)


puts kth_to_last(list, 7) == 0

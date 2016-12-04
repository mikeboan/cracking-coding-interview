require_relative './node.rb'

def remove_dups(node)
  freq = { node.val => true }

  while node.next
    if freq[node.next.val]
      node.next = node.next.next
    else
      freq[node.next.val] = true
      node = node.next
    end
  end
end

list = Node.new(5)
list.append(3)
list.append(2)
list.append(5)
list.append(3)
list.append(3)
list.append(1)

remove_dups(list)

list.render

class Node
  attr_accessor :val, :next

  def initialize(val)
    @val = val
    @next = nil
  end

  # O(n) to append element to end oflist
  def append(val)
    new_node = Node.new(val)
    curr_node = self
    curr_node = curr_node.next while curr_node.next
    curr_node.next = new_node
  end

  def render
    node = self
    while node
      puts node.val
      node = node.next
    end
  end
end

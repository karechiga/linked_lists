class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

class Stack
  attr_reader :data

  def initialize
      @data = nil
  end

  # Push a value onto the stack
  def push(value)
    new_node = LinkedListNode.new(value, nil)
    if @data == nil
      @data = new_node
      return
    end
    temp_node = @data
    
    while @data.next_node
      @data = @data.next_node
    end
    @data.next_node = new_node
    @data = temp_node
  end

  # Pop an item off the stack.
  # Remove the last item that was pushed onto the
  # stack and return the value to the user
  def pop
    list_node = @data
    if list_node == nil
      return nil
    end
    while @data.next_node
      if @data.next_node.next_node == nil
        val = @data.next_node.value
        @data.next_node = nil
        @data = list_node
        return val
      end
      @data = @data.next_node
    end
    val = @data.value
    @data = nil
    return val
  end

end

def print_values(list_node)
  if list_node
    print "#{list_node.value} --> "
    print_values(list_node.next_node)
  else
    print "nil\n"
    return
  end
end

def reverse_list(list)
  stack = Stack.new
  rev_stack = Stack.new
  i = 0
  while list
    stack.push(list.value)
    list = list.next_node
    i = i + 1
  end
  j = 0
  while j < i
    rev_stack.push(stack.pop)
    j = j + 1
  end
  return rev_stack.data
end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)
node4 = LinkedListNode.new(17, node3)
node5 = LinkedListNode.new(102, node4)

print_values(node5)

puts "----------------------------------------------------------"

revlist = reverse_list(node5)

print_values(revlist)
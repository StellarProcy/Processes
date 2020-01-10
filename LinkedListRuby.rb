class Node
  attr_accessor :next
  attr_reader :value

  def initialize(value)
    @value = value
    @next = nil
  end

  def to_s
    "Element with value #{@value}"
  end
end

class LinkedList
  def initialize
    @head = nil
  end

  def append(value)
    if @head
      find_tail.next = Node.new(value)
    else
      @head = Node.new(value)
    end
  end

  def find_tail
    node = @head

    return node if !node.next
    return node if !node.next while (node = node.next)
  end

  def append_after(target, value)
    node           = find(target)

    return unless node

    old_next       = node.next
    node.next      = Node.new(value)
    node.next.next = old_next
  end

  def find(value)
    node = @head

    return false if !node.next
    return node  if node.value == value

    while (node = node.next)
      return node if node.value == value
    end
  end

  def delete(value)
    if @head.value == value
      @head = @head.next
      return
    end

    node = find_before(value)
    node.next = node.next.next
  end

  def find_before(value)
    node = @head

    return false if !node.next
    return node if node.next.value == value

    while (node = node.next)
      return node if node.next && node.next.value == value
    end
  end

  def print
    node = @head
    puts node

    while (node = node.next)
      puts node
    end
  end
end

new_list = LinkedList.new

new_list.append(5)
new_list.append(10)
new_list.append(15)
new_list.append(20)
new_list.append(25)

new_list.append_after(5,7)
new_list.append_after(15,17)
new_list.append_after(20,23)

new_list.print
puts ""
new_list.delete(15)
new_list.delete(20)

new_list.print
puts ""
new_list.delete(5)
new_list.print
puts ""

class SngLinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil # head of the list
    @tail = nil # last node of the list
  end

  # Singly linked list Node inner class
  class Node
    attr_accessor :value, :next

    def initialize(value)
      @value = value  # node value
      @next = nil   # address of next node
    end
  end

  # combine all nodes into array
  def to_a
    array = Array.new
    n = self.head
    while (n != nil)
      array << n
      n = n.next
    end
    return array
  end

  # combine all node values into string, separated by comma
  def to_s
    str = ""
    n = self.head
    while (n != nil)
      str += n.value.to_s
      n = n.next
      if n
        str+=","
      end
    end
    return str
  end

  # insert multiple nodes at a time
  def insert(data)
    data.chomp.split(",").each do |element|
      append(element)
    end
  end

  # insert only one node at a time
  def append(data)
    new_node = Node.new(data)
    if @head
      @tail.next = new_node
    else
      @head = new_node
    end
    @tail = new_node
  end

=begin
To remove node from the list - method assigns pointer of the previous node to the next one after the middle
        previous        middle              next
            |                |                  |
            |                |                  |
        +----+------+     +----+------+     +----+------+
        | 1  |  o-------->| 2  | o--------->|  3 | null |
        +----+------+     +----+------+     +----+------+
            |                |                  |
            |                |                  |
        +----+------+     +----+------+     +----+------+
        | 1  |  o-------------------------->|  3 | null |
        +----+------+     +----+------+     +----+------+
=end
  def remove_next(index)
    element = self.head
    prev_element = element
    (index).times do
      prev_element = element
      element = element.next
    end
    prev_element.next = element.next
  end

  def clear
    @head = nil
    @tail = nil
  end
end
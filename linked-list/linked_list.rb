class LinkedList

  def is_empty?
    @head == nil
  end

  def push(data)
    if self.is_empty?
      @head = Node.new(data)
    else
      current_node = @head
      new_node = Node.new(data)
      while current_node.next != nil
        current_node = current_node.next
      end
      current_node.next = new_node
    end
  end

   def pop
    return "This list is currently empty" if self.is_empty?

    current_node = @head
    while current_node.next != nil
      current_node = current_node.next
    end

    last_node = current_node.next
    current_node.next = nil
    last_node
  end

  def shift
    return "This list is currently empty" if self.is_empty?

    curr_head = @head
    new_head = @head.next
    @head.next = nil
    @head = new_head
    curr_head
  end

  def unshift(data)
    if self.is_empty?
      @head = Node.new(data)
    else
      curr_head = Node.new(data)
      curr_head.next = @head
      @head = curr_head
    end
  end

  def size
    return 0 if self.is_empty?

    count = 1
    current_node = @head
    while current_node.next != nil
      current_node = current_node.next
      count += 1
    end

    count
  end

  def pretty_print
    array = []
    current_node = @head

    return array if self.is_empty?

    while current_node.next != nil
      array << current_node.data
      current_node = current_node.next
    end

    array << current_node.data
  end

  def clear
    @head = nil
  end
end

# some test
l = LinkedList.new
p l
p l.push(3)
p l.pretty_print
p l.size
p l.push(9)
p l.unshift(4)
p l.pretty_print
p l.size
p l
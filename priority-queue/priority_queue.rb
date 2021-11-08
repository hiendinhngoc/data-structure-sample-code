class PriorityQueue
  def initialize
    @queue = [nil]
  end

  def insert(value)
    @queue << value
    bubble_up(@queue.length - 1)
    
    self
  end

  def next
    min = @queue[1]
    swap(1, @queue.length - 1)

    @queue.pop
    bubble_down(1)
    min
  end

  private

  def bubble_up(index)
    parent_index = index / 2

    return if parent_index.zero?

    if @queue[parent_index] > @queue[index]
      swap(index, parent_index)
      bubble_up(parent_index)
    end
  end

  def bubble_down(index)
    left_child_index = index * 2
    right_child_index = index * 2 + 1

    return if left_child_index >= @queue.length - 1

    if @queue[left_child_index] < @queue[index]
      swap(index, left_child_index)
      bubble_down(left_child_index)
    elsif right_child_index < @queue.length - 1 && @queue[right_child_index] < @queue[index]
      swap(index, right_child_index)
      bubble_down(right_child_index)
    end
  end

  def swap(index1, index2)
    @queue[index1], @queue[index2] = @queue[index2], @queue[index1]
  end
end

p pq = PriorityQueue.new

p pq.insert(100)

p pq.insert(1)

p pq.insert(50)

p pq.next # => [1]

p pq.next # => [50]

p pq.next # => [100]

class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    self.prev.next = self.next
    self.next.prev = self.prev
  end
end

class LinkedList
  attr_reader :head, :tail
  def initialize
    @head = Node.new(nil, nil)
    @tail = Node.new(nil, nil)
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    return nil unless include?(key)
    cur_node = @head.next
    while cur_node.key != key
      cur_node = cur_node.next
    end
    cur_node.val
  end

  def include?(key)
    cur_node = @head.next
    while cur_node != @tail
      if cur_node.key == key
        return true
      end
      cur_node = cur_node.next
    end
    false
  end

  def append(key, val)
    node = Node.new(key, val)
    last.next = node
    node.prev = last
    node.next = @tail
    @tail.prev = node
  end

  def update(key, val)
    
  end

  def remove(key)
  end

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end

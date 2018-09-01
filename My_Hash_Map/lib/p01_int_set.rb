class MaxIntSet
  attr_reader :store

  def initialize(max)
    @store = Array.new(max) { false }
  end

  def insert(num)
    is_valid?(num)
    unless include?(num)
      @store[num] = true
      return true
    end
    false
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    raise "Out of bounds" if num > @store.length || num < 0
  end

  def validate!(num)
  end
end


class IntSet
  attr_reader :store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }

  end

  def insert(num)
    i = num % num_buckets
    unless include?(num)
      @store[i] << num
    end
  end

  def remove(num)
    i = num % num_buckets
    @store[i].delete(num)
  end

  def include?(num)
    i = num % num_buckets
    @store[i].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless include?(num)
      if num_buckets == @count
        resize!
      end
      self[num] << num
      @count += 1
    end
  end

  def remove(num)
    if include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_arr = Array.new(num_buckets*2) { Array.new }
    @store.each do |bucket|
      bucket.each do |el|
        new_arr[el % new_arr.length] << el
      end
    end
    @store = new_arr
  end
end

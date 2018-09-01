class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    res = 0
    tmp = 0

    (0...self.length).each do |idx|
      tmp = (tmp + 11) % 21
      r
      es ^= (self[idx]+1024) << tmp
    end
    res

  end
end

class String
  def hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end

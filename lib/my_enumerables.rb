module Enumerable
  # Your code goes here
  def my_all?
    self.my_each do |elem|
      return false unless yield(elem)
    end

    true
  end

  def my_any?
    self.my_each do |elem|
      return yield(elem) if yield(elem)
    end

    false
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_count
    count = 0

    self.my_each do |elem|
      count += 1 if !block_given? || yield(elem)
    end

    count
  end

  def my_each
    for elem in self
      yield(elem)
    end
  end
end

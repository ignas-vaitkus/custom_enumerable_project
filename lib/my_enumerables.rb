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

  def my_count
    count = 0

    self.my_each do |elem|
      count += 1 if !block_given? || yield(elem)
    end

    count
  end


  def my_each_with_index
    for index in 0..(self.length-1)
      yield(self[index], index)
    end
    self
  end

  def my_inject(acc)
    self.my_each do |elem|
      acc = yield(acc, elem)
    end
    acc
  end

  def my_map
    arr = []
    self.my_each { |elem| arr.push(yield(elem)) }
    arr
  end

  def my_none?
    self.my_each { |elem| return false if yield(elem) }

    true
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    for elem in self
      yield(elem)
    end
  end
end

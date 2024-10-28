module Enumerable
  # Your code goes here
  def my_all?
    self.each do |elem|
      return false unless yield(elem)
    end

    true
  end

  def my_any?
    self.each do |elem|
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
  # Define my_each here
end

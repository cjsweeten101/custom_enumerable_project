module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for i in 0..self.length - 1 do
      yield(self[i])
    end

    self
  end

  def my_select
    result = []
    self.my_each do |elem|
      result << elem if yield(elem)
    end

    result
  end

  def my_all?
    bool = true
    self.my_each do |elem|
      bool = false unless yield(elem)
    end

    bool
  end
end

module Enumerable
  # Your code goes here
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

  def my_any?
    bool = false
    self.my_each do |elem|
      bool = true if yield(elem)
    end

    bool
  end

  def my_none?    
    !self.my_any? {|elem| yield(elem)}
  end

  def my_count
    result = 0
    if block_given?
      self.my_each do |elem|
        result += 1 if yield(elem)
      end        
    else
      result = self.size
    end

    result
  end

  def my_map
    result = []
    self.my_each do |elem|
       result << yield(elem)
    end

    result
  end

  def my_inject(initial_value=0)
    accumulator = initial_value
    self.my_each do |elem|
      accumulator = yield(accumulator, elem)
    end

    accumulator
  end
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
end

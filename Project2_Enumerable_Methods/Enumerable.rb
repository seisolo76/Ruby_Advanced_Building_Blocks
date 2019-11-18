module Enumerable
  def my_each
      for i in self do
     yield(i)
      end
      self
  end

  def my_each_with_index
      for i in 0...self.size do
     yield(self[i],i)
      end
      self
  end

  def my_select
    new_enum = []
    self.my_each do |i|
      if yield(i)
        new_enum.push(i)
      end
    end
    new_enum
  end

  def my_all?
    self.my_each do |i|
      return false unless yield(i)
    end
    true
  end

  def my_none?
    self.my_each do |i|
      return false if yield(i)
    end
    true
  end

  def my_count
    new_enum = self.my_select { |i| yield(i)}
    return new_enum.length
  end

  def my_map
    new_enum = []
    for i in self do
     new_enum.push(i)
    end
    new_enum
  end

 def my_map(&block)
    new_enum = []
    each do |element|
    new_enum << block.call(element)
    end
    new_enum
  end

 def my_map
    new_enum = []
    self.each do |i|
    new_enum << yield(i)
    end
    new_enum
  end

def my_inject(initial=nil)
      	if initial
      		result_memo = initial
      		start = 0
      	else
      		result_memo = self.to_a[0]
      		start = 1
      	end
      	if block_given?
      		self.to_a[start..-1].my_each { |element| result_memo = yield(result_memo, element)}
      	end
      	result_memo
      end
  def multiply_els(array)
    array.my_inject(1) { |element, multiply| multiply * element}
  end
end

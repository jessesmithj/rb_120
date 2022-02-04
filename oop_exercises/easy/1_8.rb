# Write a class called Square that inherits from Rectangle, and is used like this:

class Rectangle
  def initialize(height, width= height)
    @height = height
    @width = width
  end

  def area
    @height * @width
  end
end

class Square < Rectangle 
end


# # Expected 
square = Square.new(5)
puts "area of square = #{square.area}"


class Rectangle
  attr_reader :height, :width

  def initialize(height, width)
    @height = height
    @width = width
  end

  def area
    @height * @width
  end
end

class Square < Rectangle 
  def initialize(length_of_side)
    super(length_of_side, length_of_side)
  end
end


# # Expected 
square = Square.new(5)
puts "area of square = #{square.area}"
puts square.height 
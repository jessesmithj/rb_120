class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "I want to turn on the light with a brightness level of super high and a color of green"
  end

end


# What is used in this class but doesn't add any value?

# Both instance variables brightness & color do not add any value, nor do their getter or setter methods via attr_accessor 
# The return is also redundant in the class method #information 

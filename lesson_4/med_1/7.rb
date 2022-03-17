# How could you change the method name below so that the method name is more clear and less repetitive?

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def light_status
    "I have a brightness level of #{brightness} and a color of #{color}"
  end
end

# change def light_status to just status, because oftentimes we 
# may have an instance of a class that looks like light1 = Light.new(5, 'yellow')
# and it looks redundnat to call a method #light_status like light1.light_status
# and much better to call it like light1.status 


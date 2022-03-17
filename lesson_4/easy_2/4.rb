# What could you add to this class to simplify it and remove two methods from the class 
# definition while still maintaining the same functionality?


# add one line of code: attr_accessor :type 
# and you can remove the type and type=(t) getter and setter methods 

class BeesWax
  def initialize(type)
    @type = type
  end

  def type
    @type
  end

  def type=(t)
    @type = t
  end

  def describe_type
    puts "I am a #{@type} of Bees Wax"
  end
end
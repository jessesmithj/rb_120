# You can see in the make_one_year_older method we have used self. What does self refer to here?

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

# self on line 12 refers to instance of the object (not the class) 
# so what we are really doing is invoking the setter method for the age instance variable 
# and reassigning it to its current value plus 1 for that particular instance 
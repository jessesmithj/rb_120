# The following code is flawed. It currently allows @name to be modified from outside the method 
# via a destructive method call. Fix the code so that it returns a copy of @name instead of a reference to it.

class Person
  # attr_reader :name #getter method 

  def initialize(name) #constructor that runs each time we instantiate a new object of this class 
    @name = name 
  end

  def name # getter method, which is also attr_reader method longform
    @name.dup
  end
end

person1 = Person.new('James')
person1.name.reverse!
puts person1.name

# When objects are created they are a separate realization of a particular class.
# Given the class below, how do we create two different instances of this class with separate names and ages?

class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

# We instantiate two seperate objects using the keyword new on the AngryCat class
# and pass in two arguments, age and name to each, like so 

jasper = AngryCat.new(5, "Jasper")
ruppie = AngryCat.new(2, "Ruppie")



# When we create the AngryCat objects, we pass the constructor two values -- 
# an age and a name. These values are assigned to the new object's instance variables, 
# and each object ends up with different information.


class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

# Explain what the @@cats_count variable does and how it works. 
# What code would you need to write to test your theory?

# The @@cats_count variable is a class variable that is initlaized to 0 on line 2 
# Every time we instantiant a new instance of the class (a new object), this class variable is incremented by 1 
# This can be seen on line 7, inside of the constructor method, initialize 
# We then call the #self.cats_count method on the class to find out how many cat objects have been initialzied 

kitty = Cat.new("spooky")
cat = Cat.new("ghost")
p Cat.cats_count
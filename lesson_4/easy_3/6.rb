class Cat
  attr_accessor :type

  def age 
    @age
  end

  def age=(age)
    @age = age 
  end 

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    @age += 1
  end
end


# In the make_one_year_older method we have used self. 
# What is another way we could write this method so we don't have to use the self prefix?


tabs = Cat.new("tabby")
p tabs.make_one_year_older
p tabs.age


# Answer

# def make_one_year_older
#   @age += 1
# end


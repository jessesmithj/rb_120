class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

# The Pizza class has an instance variable, and we know because of the @ before name (@name)
# You can double check with by calling the method: .instance_variables on instances of the class
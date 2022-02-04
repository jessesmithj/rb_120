
# Exercise 1

# class Person
#   def initialize(name) # constructor (runs anytime we instantiate a new instance of the class (aka, a new object))
#     @name = name
#   end

#   def name     # getter method
#     @name
#   end

#   def name=(name)    # setter method 
#     @name = name 
#   end
# end

# bob = Person.new("bob")
# p bob.name
# bob.name = "Robert"
# p bob.name


# class Person
#   attr_accessor :name #automatically creates a getter/setter method for the name instance variable 

#   def initialize(name) # constructor (runs anytime we instantiate a new instance of the class (aka, a new object))
#     @name = name
#   end
# end

# bob = Person.new("bob")
# p bob.name
# bob.name = "Robert"
# p bob.name


#Exercise 2 

# class Person
#   attr_accessor :first_name, :last_name

#   def initialize(first_name, last_name = "")
#     @first_name = first_name
#     @last_name = last_name
#   end

#   def name
#     if @last_name.empty? 
#       self.first_name
#     else       
#       "#{first_name} #{last_name}"
#     end
#   end
# end


# class Person
#   attr_accessor :first_name, :last_name

#   def initialize(full_name)
#     parts = full_name.split
#     @first_name = parts.first
#     @last_name = parts.size > 1 ? parts.last : ''
#   end

#   def name
#     "#{first_name} #{last_name}".strip #strip removes trailing whitespaces 
#   end
# end

# bob = Person.new("Robert")
# p bob.name
# p bob.first_name
# p bob.last_name
# bob.last_name = 'Smith'
# p bob.last_name
# p bob.name


#Exercise 3
# Now create a smart name= method that can take just a first name or a full name, 
# and knows how to set the first_name and last_name appropriately.

# class Person
#   attr_accessor :first_name, :last_name

#   def initialize(first_name, last_name = "")
#     @first_name = first_name
#     @last_name = last_name
#   end

#   def name
#     if @last_name.empty? 
#       "#{first_name}"
#     else       
#       "#{first_name} #{last_name}"
#     end
#   end

#   def name=(name)
#     first_name, last_name = name.split
#     @first_name = first_name
#     @last_name = last_name == nil ? '' : last_name
#   end

  #LS change name method 
  # def name=(full_name)
  #   parts = full_name.split
  #   self.first_name = parts[0]
  #   self.last_name = parts.size > 1 ? parts[1] : ''
  # end
# end


# DRY up the code 

# class Person 
#   attr_accessor :first_name, :last_name
  
#   def initialize(full_name)
#     parse_full_name(full_name)
#   end

#   def name
#     "#{first_name} #{last_name}".strip
#   end

#   def name=(full_name)
#     parse_full_name(full_name)
#   end

#   private 

#   def parse_full_name(full_name)
#     first_name, last_name = full_name.split
#     @first_name = first_name
#     @last_name = last_name == nil ? '' : last_name
#   end
# end


# bob = Person.new('Robert')
# p bob.name                  # => 'Robert'
# p bob.first_name            # => 'Robert'
# p bob.last_name             # => ''
# p bob.last_name = 'Smith'
# p bob.name                  # => 'Robert Smith'

# p bob.name = "John Adams"
# p bob.first_name            # => 'John'
# p bob.last_name             # => 'Adams'


### Exercise 4 

class Person 
  attr_accessor :first_name, :last_name
  
  def initialize(full_name)
    parse_full_name(full_name)
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(full_name)
    parse_full_name(full_name)
  end

  def to_s
    name
  end

  private 

  def parse_full_name(full_name)
    first_name, last_name = full_name.split
    @first_name = first_name
    @last_name = last_name == nil ? '' : last_name
  end
end

# bob = Person.new('Robert Smith')
# rob = Person.new('Robert Smith')

# p bob.name == rob.name

#Exercise 5 
bob = Person.new("Robert Smith")
p bob
puts "The person's name is: #{bob}"
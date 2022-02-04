# What output does this code print? Fix this class so that there are no 
# surprises waiting in store for the unsuspecting developer.

# class Pet
#   attr_reader :name

#   def initialize(name)
#     @name = name.to_s
#   end

#   def to_s
#     @name.upcase!
#     "My name is #{@name}."
#   end
# end

# name = 'Fluffy'
# fluffy = Pet.new(name)
# puts fluffy.name   # => 'Fluffy'
# puts fluffy # 'My name is FLUFFY'
# puts fluffy.name # 'FLUFFY'
# puts name # 'FLUFFY'


###

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

# name = 'Fluffy'
# fluffy = Pet.new(name)
# puts fluffy.name   # => 'Fluffy'
# puts fluffy # 'My name is FLUFFY'
# puts fluffy.name # 'Fluffy'
# puts name # 'Fluffy'

name = 42
fluffy = Pet.new(name)
name += 1
puts fluffy.name #42
puts fluffy #my name is 42
puts fluffy.name #42
puts name #43
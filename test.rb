
# module Speak 
#   def speak(sound)
#     puts sound 
#   end
# end

# class GoodDog
#   include Speak
# end

# class HumanBeing
#   include Speak
# end

# # Jesse = HumanBeing.new
# # Jesse.speak("My boy is Wiley") 

# # Wiley = GoodDog.new
# # Wiley.speak("ruff!")

# puts "---GoodDog ancestors---"
# puts GoodDog.ancestors
# puts ''
# puts "---HumanBeing ancestors---"
# puts HumanBeing.ancestors


# Exercise 1: 

# To create an object in Ruby, we first create a class using the keyword class. 
# Now that we have a class, we can create an object from it 
# We can store that in a local variable (my_object/sparky)
# And then to create an object, we write class name + the class method .new 
# This will create or instantiate a new object of the ExampleClass 

#Example 1
# class ExampleClass
# end

# my_object = ExampleClass.new
# p my_object.class

# #Example2
# class GoodDog
# end

# sparky = GoodDog.new
# p sparky.class


# Exercise 2: Create a Module

# module ExampleModuleWords
#   def write(words)
#     puts words
#   end
# end

# class ExampleClass
#   include ExampleModuleWords
# end

# my_object = ExampleClass.new

# my_object.write("This is an example of using a module (mixin) with an object")



########
########

# Objects & Classes 1

########
########

# class GoodDog
#   def initialize 
#     puts "This object was initialized"
#   end
# end

# wiley = GoodDog.new #=> This object was initialized 
# p wiley.class #=> class GoodDog


########

# class GoodDog
#   def initialize(name)
#     @name = name
#   end

  # def get_name
  #   @name 
  # end

  #Rubyist preferred naming structure 
  # def name
  #   @name
  # end

  # def set_name=(name)
  #   @name = name 
  # end

  #Rubyist preferred naming structure 
#   def name=(n)
#     @name = n
#   end

#   def speak
#     "#{@name} says Arf!"
#   end
# end

# wiley = GoodDog.new("Wiley")
# p wiley.name
# p wiley.speak

# bruno = GoodDog.new("Bruno")
# p bruno.speak
# p bruno.name
# bruno.name = "Juno"
# p bruno.name
# p bruno.speak


######
######

# class MyCar
#   attr_accessor :year, :color, :model 
#   # attr_reader :year, :color
#   # attr_writer :color

#   def initialize(year, color, model)
#     @year = year
#     @color = color
#     @model = model
#     @current_speed = 0
#   end

  # def change_color(color)
  #   self.color = color 
  # end

#   def spray_paint
#     puts "Let's make like the wind and change the color of this car...but to what?"
#     self.color = gets.chomp 
#     puts "Great chioce. The color #{color} is perfect."
#   end

#   def speed_up(num)
#     @current_speed += num
#     puts "You push the gas and accelerate #{num} mph."
#   end 

#   def brake(num)
#     @current_speed -= num
#     puts "You push the brake and decelerate #{num} mph."
#   end 

#   def current_speed
#     puts "You are now going #{@current_speed} mph." 
#   end

#   def shut_down
#     @current_speed = 0 
#     puts "Let's park this bad boy."
#   end 
# end

#Exercise 1
# subaru = MyCar.new("2015", "Green", "Subaru Outback")
# subaru.speed_up(20)
# subaru.current_speed
# subaru.speed_up(20)
# subaru.current_speed
# subaru.brake(10)
# subaru.current_speed
# subaru.shut_down
# subaru.current_speed


#Exercise 2
# subaru = MyCar.new(2015, "Green", "Subaru Outback")
# p subaru.color
# subaru.change_color("Black")
# p subaru.color
# p subaru.year

# Exercise 3
# subaru = MyCar.new(2015, "Green", "Subaru Outback")
# p subaru.color
# subaru.spray_paint
# p subaru.color


#########


# class GoodDog
#   attr_accessor :name 

#   def initialize(name)
#     @name = name
#   end

#   def speak
#     "#{@name} says Arf!"
#   end

#   def self.what_am_i
#     "I am a GoodDog class."
#   end
# end

# wiley = GoodDog.new("Wiley")
# p GoodDog.what_am_i


#########

# class GoodDog
#   @@number_of_dogs = 0 

#   def initialize 
#     @@number_of_dogs += 1 
#   end

#   def self.total_number_of_dogs
#     @@number_of_dogs
#   end
# end

# puts GoodDog.total_number_of_dogs

# dog_1 = GoodDog.new
# dog_2 = GoodDog.new

# puts GoodDog.total_number_of_dogs

##############

# class GoodDog
#   DOG_YEARS = 7 

#   attr_accessor :name, :age

#   def initialize(n, a)
#     self.name = n
#     @age = a * DOG_YEARS
#   end

#   def to_s
#     "This dog's name is #{name}, and he is #{age} years old." 
#   end

# end

# wiley = GoodDog.new("Wiley", 1)
# p wiley.age
# puts wiley
# p wiley
# puts wiley.inspect 

###########

# class GoodDog
#   attr_accessor :name, :height, :weight 

#   def initialize(n, h, w)
#     self.name   = n
#     self.weight = w
#     self.height = h 
#   end 

#   def change_info(n, h, w)
#     self.name   = n
#     self.weight = w
#     self.height = h 
#   end

#   def info
#     "#{self.name} weighs #{self.weight} and is #{self.height} tall."
#   end

#   def what_is_self
#     self
#   end
# end

# wiley = GoodDog.new("Wiley", "52 inches", "56 lbs.")
# p wiley.what_is_self


#####


# Exercise 1/2

# class MyCar
  # attr_accessor :year, :color, :model 
#   attr_reader :year, :color, :model 

#   def initialize(year, color, model)
#     @year = year
#     @color = color
#     @model = model
#     @current_speed = 0
#   end

#   def change_color(color)
#     self.color = color 
#   end

#   def spray_paint
#     puts "Let's make like the wind and change the color of this car...but to what?"
#     self.color = gets.chomp 
#     puts "Great chioce. The color #{color} is perfect."
#   end

#   def speed_up(num)
#     @current_speed += num
#     puts "You push the gas and accelerate #{num} mph."
#   end 

#   def brake(num)
#     @current_speed -= num
#     puts "You push the brake and decelerate #{num} mph."
#   end 

#   def current_speed
#     puts "You are now going #{@current_speed} mph." 
#   end

#   def shut_down
#     @current_speed = 0 
#     puts "Let's park this bad boy."
#   end 

#   def self.gas_mileage(gallons, miles)  
#     puts "#{miles / gallons} miles per gallon of gas"
#   end

#   def to_s
#     "You are driving a #{year} #{model} in the color #{color}."
#   end
# end

# MyCar.gas_mileage(15, 255)
# subaru = MyCar.new(2022, "green", "Subaru Outback")
# puts subaru

# Exercise 3

# class Person
#   attr_reader :name
#   attr_writer :name

#   def initialize(name)
#     @name = name
#   end
# end

# bob = Person.new("Steve")
# We created a new bob object that is in the Person class. 

# bob.name = "Bob"
# puts bob.name
# We are trying to set the name of the bob object to "Bob", but attr_reader only creates a getter method. 
# We must use the attr_writer setter method or attr_accessor setter method to be able to change this instance variable, name. 


### Inheritence 

# class Animal
#   def speak
#     "Hello"
#   end
# end

# class Dog < Animal 
#   attr_accessor :name 

#   def initialize(name)
#     self.name = name 
#   end

#   def speak 
#     "#{self.name} says Arf!"
#   end
# end

# class Cat < Animal
# end

# wiley = Dog.new("Wiley")
# puts wiley.speak 

# kitty = Cat.new
# puts kitty.speak


## Super

# class Animal
#   def speak
#     "Hello"
#   end

#   def initialize(name)
#     @name = name
#   end
# end

# class Dog < Animal 
#   attr_accessor :name 

#   def initialize(color)
#     super 
#     @color = color
#   end

  # def speak 
  #   super + ", my name is Mr. #{self.name}."
  # end
# end

# p wiley = Dog.new("golden")
# puts wiley.speak 

# class Animal
#   def speak
#     "arf!"
#   end

#   def initialize(name)
#     @name = name
#   end
# end

# class Dog < Animal 
#   attr_accessor :name 

#   def speak
#     "#{self.name} says " + super
#   end

#   def initialize(name, color)
#     super(name)
#     @color = color
#   end

#   def change_name(name)
#     self.name = name 
#   end
# end

# p wiley = Dog.new("Wiley", "golden")
# p wiley.speak
# puts wiley.name
# wiley.change_name("bad boy")
# puts wiley.name


###

# class Animal
#   def initialize
#   end
# end

# class Bear < Animal
#   def initialize(color)
#     super ## raises an error so our color argument is automatically passed in, but 0 arguments are expected 
#     @color = color
#   end
# end

# bear = Bear.new("black")      


#### Mixin Modules 

# module Swimmable 
#   def swim 
#     "I'm swimming"
#   end
# end

# class Animal; end

# class Mammal < Animal 
# end 

# class Fish < Animal
#   include Swimmable  
# end

# class Dog < Mammal 
#   include Swimmable 
# end

# class Cat < Mammal 
# end 

# wiley = Dog.new 
# kitty = Cat.new 
# nemo = Fish.new 

# p wiley.swim
# p nemo.swim 


## Method Lookup Path

# module Walkable
#   def walk
#     "I'm walking."
#   end
# end

# module Swimmable
#   def swim
#     "I'm swimming."
#   end
# end

# module Climbable
#   def climb
#     "I'm climbing."
#   end
# end

# class Animal
#   include Walkable

#   def speak
#     "I'm an animal, and I speak!"
#   end
# end

# puts "---Animal method lookup---"
# puts Animal.ancestors


# class GoodDog < Animal
#   include Swimmable
#   include Climbable
# end

# puts "---GoodDog method lookup---"
# puts GoodDog.ancestors

# wiley = GoodDog.new 
# p wiley.walk
# p wiley.swim
# p wiley.climb


### More Modules - Namespacing

# module Mammal
#   class Dog
#     def speak(sound)
#       p "#{sound}"
#     end
#   end

#   class Cat
#     def say_name(name)
#       p "#{name}"
#     end
#   end
# end

# buddy = Mammal::Dog.new 
# kitty = Mammal::Cat.new 
# buddy.speak("arf!")
# kitty.say_name("kitty")


#####


# module Mammal
#   def self.some_out_of_place_method(num)
#     num ** 2
#   end
# end

# p Mammal.some_out_of_place_method(2)
# p Mammal::some_out_of_place_method(2)


######


# class GoodDog
#   DOG_YEARS = 7

#   attr_accessor :name, :age

#   def initialize(n, a)
#     self.name = n
#     self.age = a
#   end

#   def public_disclosure
#     "#{self.name} in human years is #{human_years}"
#   end

#   private

#   def human_years
#     age * DOG_YEARS
#   end
# end

# sparky = GoodDog.new("Sparky", 4)
# p sparky.public_disclosure  ## runs because it can access the private method within the class 
# # p sparky.human_years #will not run because it is a private method


####
####

# class Klass
#   def hello(*args)
#     "Hello " + args.join(' ')
#   end
# end
# k = Klass.new
# p k.send :hello, "gentle", "readers"   #=> "Hello gentle readers"
# p k.hello("gentle", "readers")

####
####

#Exercise 1 
# Create a superclass called Vehicle for your MyCar class to inherit from 
# and move the behavior that isn't specific to the MyCar class to the superclass. 
# Create a constant in your MyCar class that stores information about the vehicle 
# that makes it different from other types of Vehicles.

# Then create a new class called MyTruck that inherits from your superclass that 
# also has a constant defined that separates it from the MyCar class in some way.

#Exercise 2 
# Add a class variable to your superclass that can keep track of 
# the number of objects created that inherit from the superclass. 
# Create a method to print out the value of this class variable as well.

#Exercise 3 
# Create a module that you can mix in to ONE of your subclasses that 
# describes a behavior unique to that subclass

#Exercise 4 
# Print to the screen your method lookup for the classes that you have created.

#Exercise 5
# Move all of the methods from the MyCar class that also pertain to the MyTruck class into the Vehicle class.
# Make sure that all of your previous method calls are working when you are finished.

#Exercise 6
# Write a method called age that calls a private method to calculate the age of the vehicle. 
# Make sure the private method is not available from outside of the class. 
# You'll need to use Ruby's built-in Time class to help.

# module Bed
#   def bed_size(length)
#     feet, inches = (length).divmod(12)
#     "Your truck's bedsize is #{feet} ft. & #{inches} inches."
#   end
# end

# class Vehicle
#   attr_accessor :year, :color, :model  
#   @@number_of_vehicles = 0

#   def self.gas_mileage(gallons, miles)  
#     puts "#{miles / gallons} miles per gallon of gas"
#   end

#   def self.number_of_vehicles 
#     puts @@number_of_vehicles 
#   end 

#   def initialize(year, color, model)
#     @year = year
#     @color = color
#     @model = model
#     @current_speed = 0
#     @@number_of_vehicles += 1
#   end

#   def age
#     years_old = calculate_age
#     years_old > 20 ? "Your vehicle is #{years_old} years old. Time for a new one..." : "Your vehicle is #{years_old} years old."
#   end

#   def speed_up(number)
#     @current_speed += number
#     puts "You push the gas and accelerate #{number} mph."
#   end

#   def brake(number)
#     @current_speed -= number
#     puts "You push the brake and decelerate #{number} mph."
#   end

#   def current_speed
#     puts "You are now going #{@current_speed} mph."
#   end

#   def shut_down
#     @current_speed = 0
#     puts "Let's park this bad boy!"
#   end

#   def spray_paint
#     puts "Let's make like the wind and change the color of this vehicle...but to what?"
#     self.color = gets.chomp 
#     puts "Great choice. The color #{color} is perfect."
#   end

#   private 

#   def calculate_age
#     Time.new.year - self.year
#   end
# end

# class MyCar < Vehicle
#   OUT_OF_PRODUCTION = true 

#   def to_s
#     "You car is a #{year} #{model} in the color #{color}."
#   end
# end

# class MyTruck < Vehicle
#   include Bed
#   LIFT = "12 inches"

#   def lift_size
#     puts LIFT 
#   end

#   def to_s
#     "Your truck is a #{year} #{model} in the color #{color}."
#   end
# end

# focus = MyCar.new(2005, 'red', 'ford focus')
# fordf250 = MyTruck.new(2022, 'blue', 'ford f250')
# fordf150 = MyTruck.new(1988, 'black', 'ford f150')
# Vehicle.number_of_vehicles 
# p fordf250.bed_size(78)
# puts "---#{fordf250.class} method lookup---"
# puts fordf250.class.ancestors
# puts MyCar.ancestors 
# puts Vehicle.ancestors 
# fordf250.spray_paint
# p fordf250.color  
# fordf250.current_speed
# fordf250.speed_up(20)
# fordf250.current_speed
# fordf250.brake(5)
# fordf250.current_speed
# fordf250.shut_down
# fordf250.current_speed
# MyTruck.gas_mileage(14, 210)
# puts fordf250
# puts fordf150.age
# puts fordf250.age


#Exercise 7
# Create a class 'Student' with attributes name and grade. 
# Do NOT make the grade getter public, so joe.grade will raise an error. 
# Create a better_grade_than? method, that you can call like so...
# puts "Well done!" if joe.better_grade_than?(bob)

# class Student
#   attr_accessor :name

#   def initialize(name, grade)
#     @name = name 
#     @grade = grade 
#   end

#   def better_grade_than?(student)
#     self.grade > student.grade
#   end

#   protected

#   def grade
#     @grade 
#   end
# end 

# joe = Student.new('joe', 85)
# bob = Student.new('bob', 76)

# p joe
# p bob
# puts "Well done!" if joe.better_grade_than?(bob)


#Exercise 8 
# Given this code, and this error message, What is the problem and how would you go about fixing it?

# bob = Person.new
# bob.hi

# NoMethodError: private method `hi' called for #<Person:0x007ff61dbb79f0>
# from (irb):8
# from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'

## The method `hi` in the person class is private and inaccessible from outside of the class. 
## We can either move this method to be public OR we can make this method protected and use another method internally and call it's return value


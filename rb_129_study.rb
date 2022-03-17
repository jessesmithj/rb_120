# class Dog
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def to_s
#     "#{@name.capitalize} is my best friend."
#   end
# end

# sparky = Dog.new("sparky")
# p "#{sparky}"

# class Vehicle 
#   attr_accessor :make, :model, :mileage 

#   def initialize(make, model, mileage)
#     @make = make
#     @model = model
#     @mileage = format_miles(mileage) 
#   end

#   def format_miles(miles)
#     num_groups = miles.to_s.chars.reverse.each_slice(3)
#     num_groups = num_groups.map(&:join).join(',').reverse
#     @mileage = num_groups
#   end

#   def compile
#     "#{self.make}, #{self.model}, #{mileage} miles"
#   end
# end 

# j_vehicle = Vehicle.new("Toyota", "Highlander", 220_000) 
# p j_vehicle.compile


# Self, a Lesson

# p self # main

# class Albums 
#   p self  #class

#   def self.collection 
#     p self #class
#   end

#   def favorites
#     puts self #refers to calling object, an instance of the Albums object
#   end

#   def to_s
#     "My favorite albums are Yeezus & Donuts."
#   end
# end

# Albums.collection
# Albums.new.favorites


###

# Colloborator Objects

# class Pokedex 
#   attr_reader :pokemons

#   def initialize(owner)
#     @owner = owner
#     @pokemons = []
#   end

#   def add_pokemon(pokemon) 
#     @pokemons << pokemon
#   end 
# end

# class Pokemon 
#   def initialize(name, level)
#     @name = name
#     @level = level
#   end
# end

# ash_pokedex = Pokedex.new("Ash")

# pikachu = Pokemon.new("Pikachu", 35)
# mewtwo = Pokemon.new("Mewtwo", 99)

# ash_pokedex.add_pokemon(pikachu)
# ash_pokedex.add_pokemon(mewtwo)

# p ash_pokedex.pokemons


###


# Method Access Pass 
# Polymorphism 

# module Swimable 
#   def swim 
#     puts "#{name} can swim!"
#   end
# end

# module Nameable 
#   def name
#     puts "My name is..."
#   end
# end

# class Animal 
#   attr_accessor :name, :breed 

#   def initialize(name, breed)
#     @name = name
#     @breed= breed 
#   end
# end

# class Dog < Animal
#   include Swimable

#   def speak
#     puts "bark!"
#   end
# end 

# class Bulldog < Dog
#   def swim 
#     puts "#{name} cannot swim."
#   end
# end

# class Cat < Animal
#   include Swimable 
#   include Nameable #overrides getter/setter method 

#   def speak
#     puts "meow!"
#   end
# end 


# wiley = Dog.new("Wiley", "Golden")
# french_fry = Bulldog.new("French Fry", "French Bulldog")
# mittens = Cat.new("Mittens", "Siamese")

# p wiley.name
# p french_fry.name
# p mittens.name

# p wiley.breed
# p french_fry.breed
# p mittens.breed

# wiley.swim
# french_fry.swim
# mittens.swim

# p Dog.ancestors
# p Bulldog.ancestors
# p Cat.ancestors # modules are checked in reverse order to how they are added
#                 # [Cat, Nameable, Swimable, Animal, Object, Kernel, BasicObject]


####

# instance variable scope 
# class variable scope
# constant varaible scope

# class Computer 
#   attr_reader :type, :model
#   BRAND = "Apple" # lexical scope, constants are avaiable within class and instance methods 

#   @@processor = "M1"

#   def initialize(type)
#     @type = type
#   end

#   def self.processor
#     @@processor
#   end

#   def what_year(year) # a setter method for the instance variable year, which, after invoked with an argument, is accessible in an object's instance methods 
#     @year = year
#   end

#   def predict_need_a_new_computer
#     add = (1..10).to_a.sample
#     puts "You will need a new computer in the year #{@year + add}."
#   end
# end

# class Tablet < Computer
#   BRAND = "AppleApple"
#   @@processor = 'intel'
# end

# class Phone
#   def computer_constant
#     puts Computer::BRAND
#   end
# end 

# macbook = Computer.new("Macbook")
# macbook.what_year(2003)
# # p macbook.year # method does not exist, as there is no getter method for year defined 
# macbook.predict_need_a_new_computer
# # p macbook.model #uninitialized instance variable returns nil  

# ipad = Tablet.new("iPad")
# p Tablet.processor

# p Computer.processor # class variable was changed in Tablet class and this changed reflected in Computer class
#                     # all objects share one copy of the class variable which makes them accessible within instance methods 
#                     # ONLY one copy -- this should be avoided

# p Tablet::BRAND # looks for constant within it's own class first and finds it
# p Computer::BRAND # constant was not changed like the class variable was 

# iphone = Phone.new 
# iphone.computer_constant # can call a constant from another class by using OtherClass::CONSTANT

####

# Colloborator Objects

# class VinylCollection
#   def initialize
#     @albums = []
#   end

#   def add_album(album)
#     @albums << album
#   end

#   def to_s
#     @albums.each { |album| puts album }
#   end

# end

# class Album
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   def to_s
#     @name
#   end
# end

# my_albums = VinylCollection.new
# my_albums # => #<VinylCollection:0x00007f859c956c70 @albums=[]>

# album_yeezus = Album.new("Yeezus")
# album_yoshimi = Album.new("Yoshimi Battles the Pink Robots")

# my_albums.add_album(album_yeezus)
# my_albums.add_album(album_yoshimi)
# my_albums    # => #<VinylCollection:0x00007fba9814aa28 @albums=[#<Album:0x00007fba9814a2d0 @name="Yeezus">, #<Album:0x00007fba9814a208 @name="Yoshimi Battles the Pink Robots">]>

# my_albums.to_s # => Yeezus, Yoshimi Battles the Pink Robots

##

# Duck Typing 

# class ProjectManager 
# end

# class 



# class Tacos
#   def prepare_recipe(recipe)

# end

# class Nachos
# end

# class Enchillads 
# end 


####

# Class Method

# class Album
#   def self.name
#     "I am the #{self} class"
#   end
# end

# p Album.name
# p Album.new.name 


####


# class Person
#   def initialize(name, job)
#       @name = name
#       @job = job
#   end 

#   def to_s; "My name is #{@name} and I am a #{@job}."; end
# end

# roger = Person.new("Roger", "Carpenter")
# puts roger

# Add 1 line of code for the person class
# and 1 line of code in the initalize method. 


#Other than that don't change Person.

# Output:
# "My name is Roger and I am a Carpenter"

###

# protected vs private

# class SocialSecurityNumber
#   attr_writer :ssn

#   def last_four_digits
#     puts ssn.digits.reverse[-4..-1].join
#   end

#   def ==(other)
#     ssn == other.ssn
#   end

#   protected

#   attr_reader :ssn
# end

# ssn1 = SocialSecurityNumber.new
# ssn2 = SocialSecurityNumber.new
# ssn1.ssn = 543212345
# ssn2.ssn = 543212345

# p ssn1 == ssn2 # true
# ssn2.ssn # NoMethodError protected method 'ssn' called (similar to private method outside of the class)


###
###

#SPIKE Practice 

# Design a Sports Team (Author Unknown...thank you!)

# - Include 4 players (attacker, midfielder, defender, goalkeeper)
# - All the players’ jersey is blue, except the goalkeeper, his jersey is white with blue stripes
# - All players can run and shoot the ball.
# - Attacker should be able to lob the ball
# - Midfielder should be able to pass the ball
# - Defender should be able to block the ball
# - The referee has a whistle. He wears black and is able to run and whistle.


# 4 Players: attacker, midfielder, defender, goalkeeper
#   - all jerseys blue
#     - goalkeeer jersey is white with blue stripes (polymorphism)
#   - all can run & shoot ball 

# Unique 
#   - Attacker can lob ball 
#   - Midfielder can pass ball
#   - Defender can block ball 

# Referee 
#   - @whistle = true 
#   - wears black 
#   - can run 
#   - can whistle 

# module Runable 

#   def run
#     puts "I can run!"
#   end
# end

# class Player 
#   attr_reader :jersey
#   include Runable
  
#   def initialize
#     @jersey = 'blue' 
#   end

#   def shoot
#     puts "I can shoot!"
#   end

#   def to_s
#     jersey
#   end 
# end 

# class Attacker < Player 

#   def lob
#     puts "I can lob!"
#   end
# end

# class Midfielder < Player

#   def pass
#    puts "I can pass!"
#   end
# end

# class Defender < Player
  
#   def block
#     puts "I can block the ball"
#   end
# end 

# class Goalkeeper < Player
#   attr_reader :jersey

#   def initialize
#     @jersey = 'white with blue stripes'
#   end
# end

# class Referee
#   attr_reader :uniform 
#   include Runable

#   def initialize
#     @whistle = true
#     @uniform = 'black'
#   end

#   def whistle 
#     puts "#{self.class} blows the whistle!"
#   end
# end

# attacker = Attacker.new 
# goalie = Goalkeeper.new 

# puts attacker # blue
# puts goalie  # black

# defender = Defender.new 
# puts defender # blue
# defender.run  # i can run

# ref = Referee.new 
# ref.run # i can run
# p ref.whistle # whistle
# p ref.uniform # black


##Encapsulation

# class Album
#   attr_reader :name  
  
#   def initialize(name)
#     @name = name
#   end
# end

# yeezus = Album.new("Yeezus")
# yoshimi = Album.new("Yoshimi Battles the Pink Robots")


##

# # Method Access Control

# class Student  
#   def initialize(name, age)
#     @name = name
#     @age = age
#   end  
  
#   def get_age
#     puts age
#   end 

#   def ==(other)
#     age == other.age
#   end

#   private
#   attr_reader :age
# end

# jesse = Student.new("Jesse", 35)
# joseph = Student.new("Joseph", 35)

# #jesse.age #inacessible, because this is a private method & only avaiable inside of the class definition 
# jesse.get_age #accessible from outside of the class, because this is a public method 
# p jesse == joseph #only works if we change private to protected, because private methods cannot have explicit callers 


####


# Without adding any methods below, implement a solution

# class ClassA    
#   attr_reader :field1, :field2  
    
#   def initialize(num)     
#     @field1 = "xyz"     
#     @field2 = num   
#   end 
# end 

# class ClassB    
#   attr_reader :field1, :field2
 
#   def initialize     
#     @field1 = "abc"   
#     @field2 = 10
#   end 
# end   

# obj1 = ClassA.new(50).field2
# obj2 = ClassA.new(25).field2
# obj3 = ClassB.new.field2

# p obj1 > obj2 
# p obj2 > obj3


####

# Inheritance 

# class Animal
#   attr_accessor :name, :weight
  
#   def initialize(name, weight)
#       @name = name
#       @weight = weight
#     end
# end

# class Dog < Animal

#   def speaks
#     puts "Woof"
#   end
# end
  
# class Cat < Animal

#   def speaks
#     puts "Meow"
#   end
# end

##

# getter/setter

# class Dog  
#   def name #getter method
#     @name
#   end  
  
#   def name=(new_name) #setter method
#     @name = new_name
#   end
# end

# wiley = Dog.new
# wiley.name = "Wiley"
# p wiley.name #outputs "Wiley"

###

# class Dog
#   attr_accessor :name
# end

# wiley = Dog.new
# wiley.name = "Wiley"
# p wiley.name #outputs "Wiley"


####

# class Dog
#   attr_accessor :name, :weight
  
#   def initialize(name, weight)
#     @name = name
#     @weight = weight
#   end
  
#   def gain_five
#     self.weight += 5
#   end

#   def self.self_class
#     self
#   end

#   def self_instance
#     self
#   end
# end
  
# wiley = Dog.new("Wiley", 60)
# bruno = Dog.new("Bruno", 60)
# wiley.gain_five

# p wiley.weight # wiley's instance varaible `weight` is now 65
# p bruno.weight # bruno's instance varaible `weight` is still 60

# p wiley.self_instance #returns the specific object we're calling the self instance method on
# p Dog.self_class #returns the class 'Dog'

##

# # module example

# class Animal  

#   def initialize(name, weight)
#   @name = name
#   @weight = weight
#   end
# end

# class Dog < Animal
# end

# class Cat < Animal
# end

# class Platypus < Animal
# end


# # module namespacing example

# Practice: 

require 'set' # Deals with a collection of unordered values with no duplicates

# Include this module to make your class taggable. The names of the
# instance variable and the setup method are prefixed with "taggable_"
# to reduce the risk of namespace collision. You must call
# taggable_setup before you can use any of this module's methods.

# module Taggable
#   attr_accessor :tags

#   def taggable_setup
#     @tags = Set.new
#   end

#   def add_tag(tag)
#     @tags << tag
#   end

#   def remove_tag(tag)
#     @tags.delete(tag)
#   end
# end

# class TaggableString < String
#   include Taggable

#   def initialize(*args)
#     super
#     taggable_setup
#   end
# end

# s = TaggableString.new('It was the best of times, it was the worst of times.')
# p s
# p s.tags

# s.add_tag 'dickens'
# s.add_tag 'quotation'
# p s.tags # =>                       #<Set: {"dickens", "quotation"}>


# Duck Typing/Polymorphism Example

# class Dog
  
#   def speak
#     puts "Woof!"
#   end
# end

# class Cat
  
#   def speak
#     puts "Meow!"
#   end
# end

# animals = [Dog.new, Cat.new]
# animals.each { |animal| animal.speak}

# class SubArray < Array; end
# p SubArray.ancestors

# p Array.included_modules # to find all the modules a class includes
# p Array.ancestors # returns the entire method lookup path (as an array)



###  Practice Spike 2

# Inside a school there are students, teachers, assistants, a principle, janitors, and cafeteria workers. 

# Both teachers and assistants can help a student with schoolwork and monitor classrooms 

# A teacher teaches and an assistant helps students with homework

# Students themselves can learn and play. 

# A teacher and principle can supervise a class. 

# Only the principle has the ability to expel a students. 

# Janitors have the ability to clean. 

# Cafeteria workers have the ability to serve food. 

# Students, teachers, assistants, principles, janitors and cafeteria workers all have the ability to eat lunch.

# module Supervisable 
#   def supervise_a_class
#     "supervises a class"
#   end
# end

# module Teachable 
#   def help_with_schoolwork
#     "helps with schoolwork"
#   end

#   def monitor_classroom
#     "monitors classroom"
#   end
# end

# class FacultyAndStudents
#   def eat_lunch
#     "eats lunch"
#   end 
# end 

# class Student < FacultyAndStudents
#   def learn
#     "learns"
#   end

#   def play
#     "plays"
#   end
# end

# class Teacher < FacultyAndStudents
#   include Supervisable
#   include Teachable
  
#   def teach_assisstant
#     "teaches assisstant"
#   end
# end

# class Assistant < FacultyAndStudents
#   include Teachable

#   def help_with_homework
#     "helps with homework"
#   end
# end

# class Principle < FacultyAndStudents
#   include Supervisable
  
#   def expel_a_student
#     "expels a student"
#   end
# end

# class Janitors < FacultyAndStudents
#   def cleans
#     "cleans"
#   end
# end

# class CafeteriaWorker < FacultyAndStudents
#   def serve_food
#     "serves food"
#   end
# end

# p Teacher.new.eat_lunch


#####


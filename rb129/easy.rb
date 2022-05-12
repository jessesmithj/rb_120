# Easy 1.1

# class Banner
#   def initialize(message)
#     @message = message
#   end

#   def to_s
#     [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
#   end

#   private

#   def horizontal_rule
#     "+#{"-" * (@message.size + 2)}+"
#   end

#   def empty_line
#     "|#{" " * (@message.size + 2)}|"
#   end

#   def message_line
#     "| #{@message} |"
#   end
# end

# banner = Banner.new('To boldly go where no one has gone before.')
# puts banner

# banner = Banner.new('')
# puts banner


####

# Easy 1.2

# class Pet
#   attr_reader :name

#   def initialize(name)
#     @name = name.to_s
#   end

#   def to_s
#     "My name is #{@name.upcase}."
#   end
# end

# name = 'Fluffy'
# fluffy = Pet.new(name)

# puts fluffy.name # "Fluffy"
# puts fluffy #"My name is FLUFFY"
# puts fluffy.name #"FLUFFY"
# puts name #"FLUFFY"


# What output does this code print? 
# Fix this class so that there are no surprises waiting in store for the unsuspecting developer.

# class  Pet
#   attr_reader :name

#   def initialize(name)
#     @name = name.to_s #converts 42 integer to a string
#   end

#   def to_s
#     "My name is #{@name.upcase}." #upcase on an integer as a string returns the integer as a string
#   end
# end

# name = 42
# fluffy = Pet.new(name)
# name += 1 # name is now reassigned to name + 1, which equals 43, which is output when we call the puts method on the local var name

# puts fluffy.name # 42
# puts fluffy # My name is 42 
# puts fluffy.name # 42
# puts name # 43

####

# Easy 1.3

# Complete this program so that it produces the expected output:
# The author of "Snow Crash" is Neil Stephenson.
# book = "Snow Crash", by Neil Stephenson.


# class Book
#   attr_reader :title, :author

#   def initialize(author, title)
#     @author = author
#     @title = title
#   end

#   def to_s
#     %("#{title}", by #{author})
#   end
# end

# book = Book.new("Neil Stephenson", "Snow Crash")

# puts %(The author of "#{book.title}" is #{book.author}.)

# puts %(book = #{book}.)

####

# Easy 1.4

# Complete this program so that it produces the expected output:
# The author of "Snow Crash" is Neil Stephenson.
# book = "Snow Crash", by Neil Stephenson.

# class Book
#   attr_accessor :author, :title

#   def to_s
#     %("#{title}", by #{author})
#   end
# end

# book = Book.new
# book.author = "Neil Stephenson"
# book.title = "Snow Crash"
# puts %(The author of "#{book.title}" is #{book.author}.)
# puts %(book = #{book}.)


####

# Easy 1.5

# Complete this program so that it produces the expected output:
# John Doe
# Jane Smith

# class Person

#   def initialize(first_name, last_name)
#     @first_name = first_name.capitalize
#     @last_name = last_name.capitalize
#   end
  
#   def first_name=(value)
#     @first_name = value.capitalize
#   end

#   def last_name=(value)
#     @last_name = value.capitalize
#   end

#   def to_s
#     "#{@first_name} #{@last_name}"
#   end
# end

# person = Person.new('john', 'doe')
# puts person

# person.first_name = 'jane'
# person.last_name = 'smith'
# puts person

# Easy 1.7

# There is nothing technically incorrect about this class, but the definition may lead to problems in the future. 
# How can this class be fixed to be resistant to future problems?

# class Car
#   attr_accessor :mileage

#   def initialize
#     @mileage = 0
#   end

#   def increment_mileage(miles)
#     total = mileage + miles
#     self.mileage = total
#   end

#   def print_mileage
#     puts mileage
#   end
# end

# car = Car.new
# car.mileage = 5000
# car.increment_mileage(678)
# car.print_mileage  # should print 5678

###

# Easy 1.8
# Write a class called Square that inherits from Rectangle, and is used like this:

# class Rectangle
#   def initialize(height, width)
#     @height = height
#     @width = width
#   end

#   def area
#     @height * @width
#   end
# end

# class Square < Rectangle 
#   def initialize(length_of_side)
#     super(length_of_side, length_of_side)
#   end
# end

# square = Square.new(5)
# puts "area of square = #{square.area}"


#####

# Easy 1.9

# class Pet
#   def initialize(name, age)
#     @name = name
#     @age = age
#   end

#   def to_s
#     "My cat #{@name} is #{@age} years old"
#   end
# end

# class Cat < Pet
#   def initialize(name, age, fur_color)
#     super(name, age)
#     @fur_color = fur_color
#   end

#   def to_s
#     super + " and has #{@fur_color} fur."
#   end
# end

# pudding = Cat.new('Pudding', 7, 'black and white')
# butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
# puts pudding, butterscotch


####

# Easy 1.10

# class Vehicle
#   attr_reader :make, :model

#   def initialize(make, model)
#     @make = make
#     @model = model
#   end

#   def wheels
#     4
#   end

#   def to_s
#     "#{make} #{model}"
#   end
# end

# class Car < Vehicle; end

# class Motorcycle < Vehicle
#   def wheels; 2; end
# end

# class Truck < Vehicle
#   attr_reader :payload

#   def initialize(make, model, payload)
#     super(make, model)
#     @payload = payload
#   end

#   def wheels; 6; end
# end

# truck = Truck.new("Toyota", "Tundra", "1000lbs.")
# p truck
# p truck.wheels


####

# Easy 2.1

# Correct the following program so it will work properly. Assume that the Customer and Employee 
# classes have complete implementations; just make the smallest possible change to ensure that 
# objects of both types have access to the print_address method.

# module Mailable
#   def print_address
#     puts "#{name}"
#     puts "#{address}"
#     puts "#{city}, #{state} #{zipcode}"
#   end
# end

# class Customer
#   include Mailable
#   attr_reader :name, :address, :city, :state, :zipcode
# end

# class Employee
#   include Mailable
#   attr_reader :name, :address, :city, :state, :zipcode
# end

# betty = Customer.new 
# bob = Employee.new
# betty.print_address
# bob.print_address

###

# Easy 2.3

# Modify the House class so that the above program will work. 
# You are permitted to define only one new method in House.

# class House
#   include Comparable
#   attr_reader :price

#   def initialize(price)
#     @price = price
#   end

#   def <=>(other)
#     price <=> other.price
#   end
# end

# home1 = House.new(100_000)
# home2 = House.new(150_000)
# puts "Home 1 is cheaper" if home1 < home2
# puts "Home 2 is more expensive" if home2 > home1


###

# Easy 2.4

# ABC
# xyz

# class Transform
#   attr_reader :data

#   def initialize(data)
#     @data = data
#   end

#   def uppercase
#     data.upcase
#   end

#   def self.lowercase(str)
#     str.downcase 
#   end
# end

# my_data = Transform.new('abc')
# puts my_data.uppercase
# puts Transform.lowercase('XYZ')


###

# class Something
#   def initialize
#     @data = 'Hello'
#   end

#   def dupdata
#     @data + @data
#   end

#   def self.dupdata
#     'ByeBye'
#   end
# end

# thing = Something.new # @data = 'Hello'
# puts Something.dupdata # "ByeBye"
# puts thing.dupdata # "HelloHello"


####

# Modify this code so it works. Do not make the amount in the wallet accessible 
# to any method that isn't part of the Wallet class.

# class Wallet
#   include Comparable

#   def initialize(amount)
#     @amount = amount
#   end

#   def <=>(other_wallet)
#     amount <=> other_wallet.amount
#   end

#   protected

#   attr_reader :amount
# end

# bills_wallet = Wallet.new(500)
# pennys_wallet = Wallet.new(465)

# if bills_wallet > pennys_wallet
#   puts 'Bill has more money than Penny'
# elsif bills_wallet < pennys_wallet
#   puts 'Penny has more money than Bill'
# else
#   puts 'Bill and Penny have the same amount of money.'
# end


###

# Easy 2.7

# Write the classes and methods that will be necessary to make this code run, and print the following output:

# P Hanson has adopted the following pets:
# a cat named Butterscotch
# a cat named Pudding
# a bearded dragon named Darwin

# B Holmes has adopted the following pets:
# a dog named Molly
# a parakeet named Sweetie Pie
# a dog named Kennedy
# a fish named Chester

# P Hanson has 3 adopted pets.
# B Holmes has 4 adopted pets.

# class Shelter
#   attr_accessor :adoptions

#   def initialize
#     @adoptions = {}
#   end
  
#   def adopt(owner, animal)
#     owner.pets << animal
    
#     if @adoptions[owner.name].nil?
#       @adoptions[owner.name] = [animal]
#     else 
#       @adoptions[owner.name] << animal
#     end
#   end

#   def print_adoptions
#     @adoptions.each do |owner, animal|
#       puts owner + " has adopted the following:"
#       puts animal 
#       puts " "
#     end
#   end
# end

# class Pet
#   def initialize(type, name)
#     @type = type
#     @name = name 
#   end 

#   def to_s
#     "a #{@type} named #{@name}"
#   end
# end

# class Owner
#   attr_reader :name, :pets

#   def initialize(name)
#     @name = name 
#     @pets = []
#   end

#   def number_of_pets
#     pets.size
#   end

#   def to_s 
#     name
#   end
# end


# butterscotch = Pet.new('cat', 'Butterscotch')
# pudding      = Pet.new('cat', 'Pudding')
# darwin       = Pet.new('bearded dragon', 'Darwin')
# kennedy      = Pet.new('dog', 'Kennedy')
# sweetie      = Pet.new('parakeet', 'Sweetie Pie')
# molly        = Pet.new('dog', 'Molly')
# chester      = Pet.new('fish', 'Chester')

# phanson = Owner.new('P Hanson')
# bholmes = Owner.new('B Holmes')

# shelter = Shelter.new
# shelter.adopt(phanson, butterscotch)
# shelter.adopt(phanson, pudding)
# shelter.adopt(phanson, darwin)
# shelter.adopt(bholmes, kennedy)
# shelter.adopt(bholmes, sweetie)
# shelter.adopt(bholmes, molly)
# shelter.adopt(bholmes, chester)

# shelter.print_adoptions
# puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
# puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."


## Easy 2.8

# What is wrong with the following code? What fix(es) would you make?
# we are modifying the code in the to_s method, rather than just outputting the code like a to_s method is meant to
# instead of functioning, this way, the interface 

# class Expander
#   def initialize(string)
#     @string = string
#   end

#   def to_s
#     self.expand(3) #self is not necessary
#   end

#   private

#   def expand(n)
#     @string * n
#   end
# end

# expander = Expander.new('xyz')
# puts expander


## Easy 2.9 & 2.10

# You need to modify the code so that this works:
# You are only allowed to write one new method to do this.

# module Walkable
#   def walk
#     "#{self} #{gait} forward"
#   end
#   #   if self.class == Noble
#   #     "#{title} #{name} #{gait} forward"
#   #   else
#   #     puts "#{name} #{gait} forward"
#   #   end
#   # end
# end

# class Person
#   include Walkable
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   def to_s
#     name
#   end

#   private

#   def gait
#     "strolls"
#   end
# end

# class Cat
#   include Walkable
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   def to_s
#     name
#   end

#   private

#   def gait
#     "saunters"
#   end
# end

# class Cheetah
#   include Walkable
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   def to_s
#     name
#   end

#   private

#   def gait
#     "runs"
#   end
# end

# class Noble
#   include Walkable
#   attr_reader :name, :title

#   def initialize(name, title)
#     @name = name
#     @title = title
#   end

#   def to_s
#     "#{title} #{name}"
#   end

#   private

#   def gait
#     "struts"
#   end
# end

# mike = Person.new("Mike")
# p mike.walk
# # => "Mike strolls forward"

# kitty = Cat.new("Kitty")
# p kitty.walk
# # => "Kitty saunters forward"

# flash = Cheetah.new("Flash")
# p flash.walk
# # => "Flash runs forward"

# byron = Noble.new("Byron", "Lord")
# p byron.walk
# # => "Lord Byron struts forward"





RB129 STUDY Session #1

abstraction helps programmers simplify things because once a method is implemented 
we no longer have to think about that each time we run it, so it allows us to create 
more compelx programs, etc. 

classes are molds 
method lookup 
attr_accessor creates 2 methods in the background (abstraction)
developing mental models and understand what abstractiosn represent 
class/object relationship

  explain writing for written (shorter)
  practice explaining concepts outloud for interview 

If you run this code, what will happen and why 
Ammend code so it produces a specific output
What  is inheritence and how does it work in Ruby? Use code examples 


Self
is a keywrod in ruby that can represent either a class or an isntance of the class, depending on the context
within an instnace method (calling object)
outside of an instance method, will always be the class
self. prepending on a method refers to the class

a method is always called on an object in ruby
# what object is this method being called on
# what object is it returning? 

Method Overriding
super keyword 
Method Lookup Path 
what object is this method being called on
what object is it returning? 



# Amend this code so we get true for both questions

class Rectangle
  include Comparable
  attr_reader :width, :height

  def initialize(width, height)
    @width = width
    @height = height
  end

  def area
    width * height
  end

  def <=>(other)

  end
end

rect1 = Rectangle.new(6, 4)
rect2 = Rectangle.new(5, 5)

p rect2 > rect1 # true
p rect1 < rect2 # true


###



class Parent
  def hello(subject="World")
    puts "Hello, #{subject}"
  end
end

class Child < Parent
  def hello(subject)
    puts "How are you today?"
  end
end

child = Child.new
child.hello('Bob')



p self 

class Person
  p self

  def self_class
    p self
  end

  def self_instance_method
    p self 
  end
end

jesse = Person.new 

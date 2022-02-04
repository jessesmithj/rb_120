# Exercise 1 
# Create a sub-class from Dog called Bulldog overriding the swim method to return "can't swim!"

# class Dog
#   def speak
#     'bark!'
#   end

#   def swim
#     'swimming!'
#   end
# end

# class Bulldog < Dog
#   def swim
#     "can't swim!"
#   end
# end


# teddy = Dog.new
# puts teddy.speak           # => "bark!"
# puts teddy.swim           # => "swimming!"
# larry = Bulldog.new 
# puts teddy.speak  
# puts larry.swim

#Exercise2
# Create a new class called Cat, which can do everything a dog can, except swim or fetch. 
# Assume the methods do the exact same thing. Hint: don't just copy and paste all methods 
# in Dog into Cat; try to come up with some class hierarchy.

# class Animal
#   def run
#     'running!'
#   end

#   def jump
#     'jumping!'
#   end
# end


# class Dog < Animal
#   def speak
#     'bark!'
#   end

#   def swim
#     'swimming!'
#   end

#   def fetch
#     'fetching!'
#   end
# end

# class Cat < Animal 
#   def speak
#     'meow!'
#   end
# end

# kitty = Cat.new 
# p kitty.speak
# p kitty.run 


# rover = Dog.new
# p rover.speak
# p rover.run 
# p rover.swim


#3

        #                     Animal (run, jump)
        #                   /          \
        #                  /            \
        #  Dog (speak, swim fetch)      Cat (speak)
        #                 /
        #          Bulldog (swim)


#4 
# the method lookup path is a hierarchal path that ruby uses to search for whether or not a behavior 
# can be called on that object/ckass. 

# The method lookup path is the order in which Ruby will traverse the class hierarchy 
# to look for methods to invoke. 

# For example, say you have a Bulldog object called bud 
# and you call: bud.swim. Ruby will first look for a method called swim in the Bulldog 
# class, then traverse up the chain of super-classes; it will invoke the first method 
# called swim and stop its traversal.

# Bulldog.ancestors       # => [Bulldog, Dog, Pet, Object, Kernel, BasicObject]
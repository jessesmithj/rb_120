class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end


# Case 1 
# hello = Hello.new
# hello.hi

# "Hello" is output to the console 

#Case 2 
# hello = Hello.new
# hello.bye

# We will get an undefined method error, since the instance bye method does not exist in the sub or superclass 

#Case 3 
# hello = Hello.new
# hello.greet

# We will get an ArgumentError, expecting 1 received 0 

#Case 4 
# hello = Hello.new
# hello.greet("Goodbye")

# "Goodbye" is output to the console 

#Case 5
# Hello.hi

# A NoMethodError, because we do not have a class method #hi
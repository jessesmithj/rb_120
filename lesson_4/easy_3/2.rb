class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end

  def self.hi 
    greeting = Greeting.new
    greeting.greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# If we call Hello.hi we get an error message. How would you fix this?

Hello.hi

# in either the greeting or hello class, we can add the following: 

#   def self.hi 
#     puts "hi"
#   end 

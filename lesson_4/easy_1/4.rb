# If we have a class AngryCat how do we create a new instance of this class?
# The AngryCat class might look something like this:

class AngryCat
  def hiss
    puts "Hisssss!!!"
  end
end

# We create a new instance of the class by using the class method #new 
# and it invoking it on the new class that we created => AngryCat.new
# Using the .new after the class name will tell Ruby this new object is an instance of AngryCat. 
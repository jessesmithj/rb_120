module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end



# How do you find where Ruby will look for a method when that method is called? 
# How can you find an object's ancestors?
# What is the lookup chain for Orange and HotSauce?


# To find a method look up path, you do the below 
# To find an object's ancestors, call the ancestors method on the object -
# The method lookup path is the order in which classes are inspected when 
# you call a method. Use the method `ancestor` to see the lookup path.  


p Orange.ancestors 
# Orange
# Taste 
# Object 
# Kernel
# BasicObject
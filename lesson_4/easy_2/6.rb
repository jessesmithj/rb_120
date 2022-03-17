class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

Which one of these is a class method (if any) and how do you know? How would you call a class method?

# self.manufacturer is a class method, becausze it is prepended with self 
# we can call this on the class directly like so: Television.manufacturer 
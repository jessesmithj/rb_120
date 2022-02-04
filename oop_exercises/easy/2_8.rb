# What is wrong with the following code? What fix(es) would you make?

class Expander
  def initialize(string)
    @string = string
  end

  def to_s
    self.expand(3)
  end

  private

  def expand(n)
    @string * n
  end
end

expander = Expander.new('xyz')
puts expander


# change string to have a getter method 
# change expand to a method call that is not private 
# remove to_s converting any input to an expanded word (it does not make logical sense it would do this)
#What will the following code print?


class Something
  def initialize
    @data = 'Hello'
  end

  def dupdata
    @data + @data
  end

  def self.dupdata
    'ByeBye'
  end
end

thing = Something.new #creating a new Something object 
puts Something.dupdata # 'ByeBye'
puts thing.dupdata # "Hello Hello"

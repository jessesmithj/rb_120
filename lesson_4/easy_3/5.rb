class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end


# What would happen if I called the methods like shown below?


tv = Television.new
tv.manufacturer # would get a no method error because it does not exist at the instance level 
tv.model

Television.manufacturer
Television.model #would get a no method error because it does not exist at the class level 

# 1) 
class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end

# 2) 
class Computer
  attr_accessor :template

  def create_template
    self.template = "template 14231"
  end

  def show_template
    self.template
  end
end


# What is the difference in the way the code works?

# In the first example, the instance method #create_template is setting an instance variable directly to "template 14231"
# In the instance method #show_template, we are calling the template getter method which returns the @template instance variable, 
# which is the return value of #show_template 

# In the second example, we are using the setter method to set the instance variable @template to "template 14231"
# and when we call the instance method #show_template, the self.template is the same as calling the getter method template on the instance of the class
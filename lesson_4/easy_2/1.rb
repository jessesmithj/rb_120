class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end


oracle = Oracle.new # creating a new oracle object 
oracle.predict_the_future # will print "You will" + one of the three strings from the choices array at random



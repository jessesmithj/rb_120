class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

# What would happen if we added a play method to the Bingo class, 
# keeping in mind that there is already a method of this name in 
# the Game class that the Bingo class inherits from.

# The first place Ruby would look for the method is within the class 
# we are invoking the method from, so it would invoke the new play 
# method that we created inside of the Bingo class 
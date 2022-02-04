# There is nothing technically incorrect about this class, but the definition may lead to problems in the future. 
# How can this class be fixed to be resistant to future problems?

class Flight
  attr_accessor :database_handle # remove this 

  def initialize(flight_number)
    @flight_number = flight_number
    @database_handle = Database.init
  end
end

# Consider what might happen if you leave this class defined as it is, and later 
# decide to alter the implementation so that a database is not used.
# Ben and Alyssa are working on a vehicle management system. So far, they have created 
# classes called Auto and Motorcycle to represent automobiles and motorcycles. 
# After having noticed common information and calculations they were performing 
# for each type of vehicle, they decided to break out the commonality into a 
# separate class called WheeledVehicle. This is what their code looks like so far:

class Vehicle
  attr_accessor :speed, :heading

  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    @fuel_efficiency = km_traveled_per_liter
    @fuel_capacity = liters_of_fuel_capacity
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class Auto < Vehicle
  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    super(km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = [30,30,32,32]
  end
end

class Motorcycle < Vehicle
  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    super(km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = [20,20]
  end
end


# Now Alan has asked them to incorporate a new type of vehicle into their system - a Catamaran defined as follows:

class Catamaran < Vehicle
  attr_reader :propeller_count, :hull_count
  attr_accessor :speed, :heading

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    super(km_traveled_per_liter, liters_of_fuel_capacity)
    @num_propellers = num_propellers
    @num_hulls = num_hulls
  end
end

# This new class does not fit well with the object hierarchy defined so far. 
# Catamarans don't have tires. But we still want common code to track fuel 
# efficiency and range. Modify the class definitions and move code into a 
# Module, as necessary, to share code among the Catamaran and the wheeled vehicles.




catamaran = Catamaran.new(2, 2, 50, 25.0)
p catamaran.range



# Vehicle (Top Hierarchy)
# WheeledVehicles 
# Auto
# Motorcycle
# Catamaran # watercraft (no tires)



# # modules cannot instantiate instances OR instance variables 
# # could create a module with defintions for range

###
###
###


# LS 
module Moveable
  attr_accessor :speed, :heading
  attr_writer :fuel_capacity, :fuel_efficiency

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class WheeledVehicle
  include Moveable

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end
end

class Catamaran
  include Moveable

  attr_reader :propeller_count, :hull_count

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity

    # ... other code to track catamaran-specific data omitted ...
  end
end






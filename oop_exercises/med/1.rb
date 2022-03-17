# Modify this class so both flip_switch and the setter method switch= are private methods.



class Machine
  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  def current_switch_state
    puts "Currently the switch is '#{switch}'"
  end

  private

  attr_accessor :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

machine = Machine.new
p machine.start
machine.current_switch_state
p machine.stop
machine.current_switch_state
# 1.1
# Modify this class so both flip_switch and the setter method switch= are private methods.

# class Machine
#   def start
#     flip_switch(:on)
#   end

#   def stop
#     flip_switch(:off)
#   end

#   def get_switch
#     switch
#   end

#   private

#   attr_accessor :switch

#   def flip_switch(desired_state)
#     self.switch = desired_state #you need self because it's a setter method, this is allowed in ruby version 2.7 and later 
#   end
# end

# machine1 = Machine.new
# p machine1.start
# # p machine1
# # p machine1.stop
# p machine1
# p machine1.get_switch


####

# 1.2

# A fixed-length array is an array that always has a fixed number of elements. 
# Write a class that implements a fixed-length array, and provides the necessary 
# methods to support the following code:

# class FixedArray
#   def initialize(arr_size)
#     @array = Array.new(arr_size)
#   end

#   def [](index)
#     @array.fetch(index)
#   end

#   def []=(index, value)
#     self[index] # raises an error if the index is invalid becayse this: *p fixed_array[7]# = 3 raises an IndexError)
#     @array[index] = value
#   end

#   def to_a
#     @array.clone
#   end

#   def to_s
#     "#{@array}"
#   end
# end

# fixed_array = FixedArray.new(5)
# puts fixed_array[3] == nil
# puts fixed_array.to_a == [nil] * 5

# fixed_array[3] = 'a'
# puts fixed_array[3] == 'a' 
# p fixed_array.to_a == [nil, nil, nil, 'a', nil]

# fixed_array[1] = 'b'
# puts fixed_array[1] == 'b'
# puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

# fixed_array[1] = 'c'
# puts fixed_array[1] == 'c'
# puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

# fixed_array[4] = 'd'
# puts fixed_array[4] == 'd'
# puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
# puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

# puts fixed_array[-1] == 'd'
# puts fixed_array[-4] == 'c'

# begin
#   fixed_array[6]
#   puts false
# rescue IndexError
#   puts true
# end

# begin
#   fixed_array[-7] = 3
#   puts false
# rescue IndexError
#   puts true
# end

# begin
#   fixed_array[7] = 3
#   puts false
# rescue IndexError
#   puts true
# end


# 2.3

# Below we have 3 classes: Student, Graduate, and Undergraduate. 
# The implementation details for the #initialize methods in Graduate and Undergraduate are missing. 
# Fill in those missing details so that the following requirements are fulfilled:

# Graduate students have the option to use on-campus parking, while Undergraduate students do not.

# Graduate and Undergraduate students both have a name and year associated with them.

# Note, you can do this by adding or altering no more than 5 lines of code.
#   1 2 3 4 


# class Student
#   def initialize(name, year)
#     @name = name
#     @year = year
#   end
# end

# class Graduate < Student
#   def initialize(name, year, parking)
#     super(name, year)
#     @parking = parking
#   end
# end

# class Undergraduate < Student; end


# 2.4 

# Your task is to write a CircularQueue class that implements a circular queue for arbitrary objects. 
# The class should obtain the buffer size with an argument provided to CircularQueue::new, and should provide the following methods:

#     enqueue to add an object to the queue
#     dequeue to remove (and return) the oldest object in the queue. It should return nil if the queue is empty.

# You may assume that none of the values stored in the queue are nil (however, nil may be used to designate empty spots in the buffer).

# class CircularQueue
#   attr_reader :array

#   def initialize(size) 
#     @size = size
#     @array = []
#   end

#   def dequeue
#     @array.shift
#   end

#   def enqueue(num)
#     dequeue if @array.size >= @size
#     @array.push(num)
#   end
# end


# class CircularQueue
#   def initialize(size)
#     @buffer = [nil] * size # an array of nil the size of our buffer 
#     @next_position = 0 # next position to add something in queue
#     @oldest_position = 0 # position to remove from queue if full
#   end

#   def enqueue(object)
#     unless @buffer[@next_position].nil?
#       @oldest_position = increment(@next_position)
#     end

#     @buffer[@next_position] = object # if buffer's next position is nil (will be initially & when we set oldest position to 'nil' ) do this 
#     @next_position = increment(@next_position) # increments buffer size by 1 AND/OR uses modulo to ensure if it's over the buffer size it circles back to 0
#   end

#   def dequeue
#     value = @buffer[@oldest_position] # find the object's value at oldest position and assign to local variable 
#     @buffer[@oldest_position] = nil # change the value at buffer's oldest postion to nil
#     @oldest_position = increment(@oldest_position) unless value.nil? # increment oldest position unless the value is nil
#     value # return the local variable value that was initialized to the value at buffer's oldest position 
#   end

#   private

#   def increment(position)
#     (position + 1) % @buffer.size
#   end
# end


# queue = CircularQueue.new(3)
# puts queue.dequeue == nil

# queue.enqueue(1)
# queue.enqueue(2)
# puts queue.dequeue == 1 

# queue.enqueue(3)
# queue.enqueue(4)
# puts queue.dequeue == 2

# queue.enqueue(5)
# queue.enqueue(6)
# queue.enqueue(7)
# puts queue.dequeue == 5
# puts queue.dequeue == 6
# puts queue.dequeue == 7
# puts queue.dequeue == nil

# queue = CircularQueue.new(4)
# puts queue.dequeue == nil

# queue.enqueue(1)
# queue.enqueue(2)
# puts queue.dequeue == 1

# queue.enqueue(3)
# queue.enqueue(4)
# puts queue.dequeue == 2

# queue.enqueue(5)
# queue.enqueue(6)
# queue.enqueue(7)
# puts queue.dequeue == 4
# puts queue.dequeue == 5
# puts queue.dequeue == 6
# puts queue.dequeue == 7
# puts queue.dequeue == nil


# 2.5 

# Write a class that implements a miniature stack-and-register-based programming language that has the following commands:

#     n Place a value n in the "register". Do not modify the stack.
#     PUSH Push the register value on to the stack. Leave the value in the register.
#     ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
#     SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
#     MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
#     DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
#     MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
#     POP Remove the topmost item from the stack and place in register
#     PRINT Print the register value

# All operations are integer operations (which is only important with DIV and MOD).

# Programs will be supplied to your language method via a string passed in as an argument. Your program should produce an error if an unexpected item is present in the string, or if a required stack value is not on the stack when it should be (the stack is empty). In all error cases, no further processing should be performed on the program.

# You should initialize the register to 0.



#Original Solution 
# def minilang(program)
#   stack = []
#   register = 0
#   program.split.each do |token|
#     case token
#     when 'ADD'   then register += stack.pop
#     when 'DIV'   then register /= stack.pop
#     when 'MULT'  then register *= stack.pop
#     when 'MOD'   then register %= stack.pop
#     when 'SUB'   then register -= stack.pop
#     when 'PUSH'  then stack.push(register)
#     when 'POP'   then register = stack.pop
#     when 'PRINT' then puts register
#     else              register = token.to_i
#     end
#   end
# end

require 'set'
class MinilangError < StandardError; end 
class BadTokenError < MinilangError; end
class EmptyStackError < MinilangError; end

class Minilang
  ACTIONS = Set.new %w(PUSH ADD SUB MULT DIV MOD POP PRINT)

  def initialize(command)
    @program = command
    @stack = []
    @register = 0
  end


  def eval
    @program.split.each { |token| eval_token(token) }
  rescue MinilangError => error
    puts error.message
  end

  private

  def eval_token(token)
    if ACTIONS.include?(token)
      send(token.downcase)
    elsif token =~ /\A[-+]?\d+\z/
      @register = token.to_i
    else
      raise BadTokenError, "Invalid token: #{token}"
    end
  end

  def print 
    puts @register
  end

  def add
    @register += pop
  end

  def div
    @register /= pop 
  end

  def mult
    @register *= pop 
  end

  def mod
    @register %= pop 
  end

  def sub
    @register -= pop 
  end

  def push
    @stack << @register
  end

  def pop
    raise EmptyStackError, "Empty stack!" if @stack.empty?
    @register = @stack.pop
  end
end



Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP')
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# # # Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# # 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# # 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# # # Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# # 8

Minilang.new('6 PUSH').eval
# # # (nothing printed; no PRINT commands)



###   
  # def eval
  #   @program.split.each do |token|
  #     case token
  #     when 'ADD'   then add 
  #     when 'SUB'   then sub
  #     when 'DIV'   then div 
  #     when 'MULT'  then mult 
  #     when 'MOD'   then mod
  #     when 'PUSH'  then push
  #     when 'POP'   then pop
  #     when 'PRINT' then print
  #     else         @register = token.to_i
  #     end
  #   end
  # end 
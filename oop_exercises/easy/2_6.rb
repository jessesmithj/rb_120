# Modify this code so it works. Do not make the amount in the wallet accessible 
# to any method that isn't part of the Wallet class.

# class Wallet
#   include Comparable

#   def initialize(amount)
#     @amount = amount
#   end

#   def <=>(other_wallet)
#     amount <=> other_wallet.amount
#   end

#   protected 

#   attr_reader :amount 
# end

# bills_wallet = Wallet.new(500)
# pennys_wallet = Wallet.new(465)

# if bills_wallet > pennys_wallet
#   puts 'Bill has more money than Penny'
# elsif bills_wallet < pennys_wallet
#   puts 'Penny has more money than Bill'
# else
#   puts 'Bill and Penny have the same amount of money.'
# end

class Wallet
  include Comparable

  def initialize(amount)
    @amount = amount
  end

  def <=>(other_wallet)
    @amount <=> other_wallet.amount
  end

  protected  

  attr_reader :amount
end

class Hacker
  def self.checkit(wallet)
    wallet.amount
  end
end

bills_wallet = Wallet.new(500)
p Hacker.checkit(bills_wallet)















# creating 'new' methods via classes

# class Array
#   def average 
#     (self.sum / self.size.to_f) 
#   end 
# end

# an_array = [1, 5, 10]
# p an_array.average 


# class Integer
#   include Math 
  
#   def prime?
#     return false if self < 2
#     (2..sqrt(self)).none? { |divisor| self % divisor == 0 }
#   end
# end

# p 1.prime? 
# p 11.prime? 
# p 23.prime? 
# p 18.prime? 
# p 25.prime? 
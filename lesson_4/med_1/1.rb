class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

# Ben asked Alyssa to review this code.
# Alyssa glanced over the code quickly and said - 
# "It looks fine, except that you forgot to put the @ before balance 
# when you refer to the balance instance variable in the body of the positive_balance? method."

# "Not so fast", Ben replied. "What I'm doing here is valid - I'm not missing an @!"
# Who is right, Ben or Alyssa, and why?


al = BankAccount.new(100)
p al.positive_balance?

# The preferred Rubyist way is what Ben has done.
# balance in the positive_balance? method refers to the getter method balance 
# whose return value is the instance variable balance.
# Technically, either would work, but Ben's method is more Rubyist 
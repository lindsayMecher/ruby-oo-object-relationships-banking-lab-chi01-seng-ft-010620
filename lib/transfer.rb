
require_relative 'bank_account'

class Transfer
  attr_accessor :sender, :receiver, :amount, :status, :executed
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
    
  end
  def valid?
    self.sender.valid? && self.receiver.valid?
  end
  def execute_transaction
    if self.sender.balance < self.amount || !self.valid?
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    else
      if !self.executed
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
      self.executed = true
      end
    end
  end
  def reverse_transfer
      if self.executed
        self.sender.balance += self.amount
        self.receiver.balance -= self.amount
        self.status = "reversed"
     end
  end
end








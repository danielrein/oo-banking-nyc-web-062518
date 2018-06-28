require 'pry'

class Transfer
 # your code here
 attr_accessor :status, :sender, :receiver, :amount
 attr_reader

 def initialize(sender, receiver, amount, status = "pending")
   @sender = sender
   @receiver = receiver
   @status = status
   @amount = amount
 end

 def valid?
   self.sender.valid? && self.receiver.valid?
 end

 def execute_transaction
   if self.sender.valid? && self.sender.balance >= @amount && @status == "pending"
     self.sender.balance -= self.amount
     self.receiver.balance += self.amount
     @status = "complete"
   else
     @status = "rejected"
     "Transaction rejected. Please check your account balance."
   end
 end

 def reverse_transfer
   if @status == "complete"
     self.sender.balance += @amount
     self.receiver.balance -= @amount
     @status = "reversed"
   end
 end
end

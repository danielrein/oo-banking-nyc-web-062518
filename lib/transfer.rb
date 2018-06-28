class Transfer
 # your code here
 attr_accessor :status
 attr_reader :sender, :receiver, :amount

 def initialize(sender, receiver, status = "pending", amount)
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
     self.sender.balance -= @amount
     self.receiver.balance += @amount
     @status = "complete"
   else
     @status = "rejected"
     "Transaction rejected. Please check your account balance."
   end
 end
end

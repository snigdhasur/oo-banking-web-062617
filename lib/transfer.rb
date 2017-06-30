require 'pry'

class Transfer

  attr_accessor :amount, :status 
  attr_reader :sender, :receiver


  def initialize(sender, receiver, amount)
  	@sender = sender
  	@receiver = receiver
  	@amount = amount
  	@status = "pending"
  end 

  def valid?
  	if @sender.valid? && @receiver.valid?
  		true 
  	else 
  		false 
  	end 
  end 

  def execute_transaction 
  	if sender.balance < @amount  
  		@status = "rejected"
  		return "Transaction rejected. Please check your account balance."
  	elsif self.valid? && @status == "pending"
  			@sender.withdraw(@amount) 
	  		@receiver.deposit(@amount)
  			@status = "complete" 
  	else 
  		nil
  	end 

  end 

  def reverse_transfer
  	if @status == "complete"
	  	@sender.deposit(@amount) 
		@receiver.withdraw(@amount)
	  	@status = "reversed"
	end   
  end 


end

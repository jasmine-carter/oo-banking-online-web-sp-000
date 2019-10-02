class Transfer
attr_reader :sender, :receiver, :amount
attr_accessor :status

  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if sender.valid? && receiver.valid?
     true
    else
     false
    end
  end

  def execute_transaction
    if @status != "complete"
      if @sender.valid? == false
        "Transaction rejected. Please check your account balance"
        @sender.withdrawel(amount)
        @receiver.deposit(amount)
        @status = "complete"
      else
        @sender.withdrawel(amount)
        @receiver.deposit(amount)
        @status = "complete"
      end
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.deposit(amount)
      @receiver.withdrawel(amount)
      @status = "reversed"
    end
  end

end

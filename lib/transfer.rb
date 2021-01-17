require "bank_account.rb"
require 'pry'

class Transfer
  def initialize sender, receiver, amount
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end


  attr_accessor :sender, :receiver, :status, :amount

  def valid?
    return true if sender.valid? == true && receiver.valid? == true
    false
  end

  def transfer_status
    @status="complete"
  end

  def execute_transaction
    if sender.balance <= @amount || sender.valid? != true || receiver.valid? != true
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
    if @status == "pending"
        @receiver.deposit(@amount)
        @sender.withdrawal(@amount)
        @status = "complete"
    end
  end

  def reverse_transfer
    if @status == "complete"
      @receiver.withdrawal(@amount)
      @sender.deposit(@amount)
      @status = "reversed"
    end
  end
end
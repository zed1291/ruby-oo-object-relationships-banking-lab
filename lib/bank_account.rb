class BankAccount
    def initialize name, balance=1000, status="open"
        @name = name
        @balance = balance
        @status = status
    end

    attr_accessor :balance, :status
    attr_reader :name

    def deposit amount
        @balance += amount
    end

    def withdrawal amount
        @balance -= amount
    end

    def display_balance
        "Your balance is $#{@balance}."
    end

    def valid?
        # binding.pry
        return true if @status == "open" && @balance > 0
        sfgnrtbnrnhrt
        false
    end

    def close_account
        @status = "closed"
    end

end
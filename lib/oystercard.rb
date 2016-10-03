class Oystercard
  attr_reader :balance
  CAPACITY = 90

  def initialize
    @balance = 0
  end

  def top_up(value)
    raise "Limit of £#{CAPACITY} exceeded" if value + @balance > CAPACITY
    @balance += value
  end

  def deduct(value)
    @balance -= value
  end

end

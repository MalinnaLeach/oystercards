class Oystercard
  attr_reader :balance
  CAPACITY = 90

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(value)
    raise "Limit of £#{CAPACITY} exceeded" if value + @balance > CAPACITY
    @balance += value
  end

  def deduct(value)
    @balance -= value
  end

  def in_journey?
    @in_journey
  end


end

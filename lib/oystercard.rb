class Oystercard
  attr_reader :balance, :entry_station
  CAPACITY = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @entry_station = nil
  end

  def top_up(value)
    raise "Limit of £#{CAPACITY} exceeded" if value + @balance > CAPACITY
    @balance += value
  end

  def in_journey?
    !@entry_station.nil?
  end

  def touch_in(station)
    raise "insufficient funds to complete journey" if @balance < MINIMUM_FARE
    @entry_station = station
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @entry_station = nil
  end

  private

  def deduct(value)
    @balance -= value
  end

end

class Oystercard
  attr_reader :balance, :journey_history, :current_journey
  CAPACITY = 90
  MINIMUM_AMOUNT = Journey::MINIMUM_FARE

  def initialize
    @balance = 0
    @journey_history = []
  end

  def top_up(value)
    raise "Limit of £#{CAPACITY} exceeded" if value + @balance > CAPACITY
    @balance += value
  end

  def touch_in(station)
    raise "insufficient funds to complete journey" if @balance < MINIMUM_AMOUNT
    @current_journey = Journey.new(station)
  end

  def touch_out(station)
    @current_journey = Journey.new(nil) if @current_journey.nil?
    deduct(@current_journey.finish(station))
    @journey_history << @current_journey
  end

  private

  def deduct(value)
    @balance -= value
  end

end

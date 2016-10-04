class Oystercard
  attr_reader :balance, :journey_history, :current_journey
  CAPACITY = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @journey_history = []
    reset_current_journey
  end

  def top_up(value)
    raise "Limit of £#{CAPACITY} exceeded" if value + @balance > CAPACITY
    @balance += value
  end

  def touch_in(station)
    raise "insufficient funds to complete journey" if @balance < MINIMUM_FARE
    @current_journey = Journey.new(station)
  end

  def touch_out(station)
    @current_journey.exit_station(station)
    deduct(MINIMUM_FARE)
    @journey_history << @current_journey
  end

  private

  def deduct(value)
    @balance -= value
  end

  def reset_current_journey
    @current_journey = {}
  end

end

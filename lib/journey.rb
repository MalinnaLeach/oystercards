class Journey
  attr_reader :entry_station, :exit_station
    MINIMUM_FARE = 1
    PENALTY_FARE = 6

  def initialize(entry_station)
    @entry_station = entry_station
  end

  def set_entry_station(station)
    @entry_station = station
  end

  def set_exit_station(station)
    @exit_station = station
  end

  def complete?
    !entry_station.nil? && !exit_station.nil?
  end

  def calculate_fare
    complete? ? 1 : 6
  end

  def finish(station)
    set_exit_station(station)
    calculate_fare
  end
end

require 'journey'
describe Journey do
  let(:station) {double("Station")}
  subject(:journey) {described_class.new(station)}


  it "is created with an entry station" do
    expect(journey.entry_station).to eq station
  end

  it "has an exit station" do
    expect(journey).to respond_to(:exit_station)
  end

  xit "is able to finish a journey" do
    expect(journey).to respond_to(:finish)
  end

  it "return the fare for itself" do
    journey.set_entry_station("Earls Court")
    journey.set_exit_station("Bakerloo")
    expect(journey.calculate_fare).to eq Journey::MINIMUM_FARE
  end

  it "applies penalty fare for incomplete journey" do
    journey.set_entry_station(nil)
    journey.set_exit_station("Bakerloo")
    expect(journey.calculate_fare).to eq Journey::PENALTY_FARE
  end

  it "journey is not complete if exit station is nil" do
    journey.set_exit_station(nil)
    expect(journey.complete?).to be false
  end

  it "journey is not complete if entry station is nil" do
    journey.set_entry_station(nil)
    expect(journey.complete?).to be false
  end

  xit "penalises incomplete journeys" do
    journey.exit_station(nil)
    expect(journey.calculate_fare).to eq(fare + penalty)
  end

end

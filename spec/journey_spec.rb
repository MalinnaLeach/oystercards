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

  it "is able to finish a journey" do
    expect(journey).to respond_to(:finish)
  end

  it "calculates the fare for itself" do
    expect(journey).to respond_to(:calculate_fare)
  end

  it "checks if journey is complete" do
    expect(journey).to respond_to(:complete?)
  end
end

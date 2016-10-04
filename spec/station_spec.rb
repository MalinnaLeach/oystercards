require 'station'

describe Station do

  subject(:station) {described_class.new("Kings Cross", 1)}

  it 'should accept name on creation' do
    expect(station.name).to eq "Kings Cross"
  end

  it 'should accept zone on creation' do
    expect(station.zone).to eq 1
  end
end

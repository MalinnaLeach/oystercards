require 'oystercard'

describe Oystercard do


  it {expect(subject.is_a?(Oystercard)).to eq true}

  it "Expect new card to have a 0 balance" do
    expect(subject.balance).to eq 0
  end

end

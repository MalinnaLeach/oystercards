require 'oystercard'

describe Oystercard do

  before do
    @top_up_value = 5
  end

  it "Expect new card to have a 0 balance" do
    expect(subject.balance).to eq 0
  end

  it "Should reflect top-up value in balance" do
    subject.top_up(@top_up_value)
    expect(subject.balance).to eq @top_up_value
  end

  it "Should raise Error if top-up will cause balance to exceed limit" do
    expect {subject.top_up(Oystercard::CAPACITY+1)}.to raise_error "Limit of £#{Oystercard::CAPACITY} exceeded"
  end

end

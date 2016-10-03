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

end

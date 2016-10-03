require 'oystercard'

describe Oystercard do

  before do
    @top_up_value = 10
    @deduct_value = 5
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

  it "Should reflect deducted value in balance" do
    subject.top_up(@top_up_value)
    subject.deduct(@deduct_value)
    expect(subject.balance).to eq @top_up_value - @deduct_value
  end

  it "Should return in_journey status" do
    subject.in_journey?.should be false
  end

  it "Should change in_journey status on touch in" do
    subject.touch_in
    subject.in_journey?.should be true
  end

  it "should change in_journey status on touch out" do
    subject.touch_in
    subject.touch_out
    subject.in_journey?.should be false
  end

end

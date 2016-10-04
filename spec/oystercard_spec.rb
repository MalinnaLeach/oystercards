require 'oystercard'

describe Oystercard do

  subject(:new_card) {described_class.new}
  subject(:topped_up_card) {described_class.new}

  let (:station) {double "Station"}
  let (:station2) {double "Station"}

  before do
    @top_up_value = 10
    @deduct_value = 5
    topped_up_card.top_up(@top_up_value)
  end

  context "before use" do
    it "expect new card to have a 0 balance" do
      expect(new_card.balance).to eq 0
    end

    it "should reflect top-up value in balance" do
      new_card.top_up(@top_up_value)
      expect(new_card.balance).to eq @top_up_value
    end

    it "should raise an error if top-up will cause balance to exceed limit" do
      expect {new_card.top_up(Oystercard::CAPACITY+1)}.to raise_error "Limit of £#{Oystercard::CAPACITY} exceeded"
    end

    it "has a an empty journey list by default" do
      expect(new_card.journey_history).to eq []
    end
  end

  context "when touching in" do
    it "should raise an error if minimum value is not met" do
      expect {new_card.touch_in(station)}.to raise_error "insufficient funds to complete journey"
    end

    it "should change in_journey status on touch in" do
      topped_up_card.touch_in(station)
      expect(topped_up_card.current_journey.entry_station).to eq station
    end
  end

  context "when touching out" do
    before do
      topped_up_card.touch_in(station)
      topped_up_card.touch_out(station2)
    end

    it 'should deduct the minimum fare from the balance on touch out' do
      topped_up_card.touch_in(station)
      expect {topped_up_card.touch_out(station)}.to change{topped_up_card.balance}.by(0 - Oystercard::MINIMUM_AMOUNT)
    end

    it "stores the journey" do
      expect(topped_up_card.journey_history[0]).to be_a Journey
    end

  end

end

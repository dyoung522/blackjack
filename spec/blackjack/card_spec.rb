# frozen_string_literal: true

RSpec.describe Blackjack::Card do
  let(:suit) { "♦" }
  let(:value) { "A" }
  let(:card) { Blackjack::Card.new suit, value }

  describe "#new" do
    it "creates a new instance" do
      expect(card).to be_a(Blackjack::Card)
    end
  end

  describe "#suit" do
    it "has a suit" do
      expect(card.suit).to eq(suit)
    end
  end

  describe "#value" do
    it "has a value" do
      expect(card.value).to eq(value)
    end
  end

  describe "#show" do
    it "shows the card" do
      expect(card.show).to eq("#{value} of #{suit}")
    end
  end
end

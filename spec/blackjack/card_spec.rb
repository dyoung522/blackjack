# frozen_string_literal: true

RSpec.describe Blackjack::Card do
  let(:suit) { "♦" }
  let(:face) { "A" }
  let(:card) { Blackjack::Card.new suit, face }

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

  describe "#face" do
    it "has a face" do
      expect(card.face).to eq(face)
    end
  end

  describe "#to_s" do
    it "shows the card" do
      expect(card.to_s).to eq("#{face} of #{suit}")
    end
  end

  describe "#to_i" do
    context "with an ace" do
      it "shows the value of the card" do
        expect(card.to_i).to eq(1)
      end
    end

    context "with a face card" do
      let(:card) { Blackjack::Card.new suit, "J" }

      it "shows the value of the card" do
        expect(card.to_i).to eq(10)
      end
    end
  end
end

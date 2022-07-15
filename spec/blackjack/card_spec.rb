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

  describe "#ace?" do
    context "with an Ace" do
      it "returns true" do
        expect(card.ace?).to be_truthy
      end
    end

    context "with a non-Ace" do
      let(:value) { "K" }

      it "returns false" do
        expect(card.ace?).to be_falsey
      end
    end
  end

  describe "#facecard?" do
    context "with a face card" do
      let(:value) { "J" }

      it "returns true if the value is a face card" do
        expect(card.facecard?).to be_truthy
      end
    end

    context "with a non-face card" do
      let(:value) { "A" }

      it "returns false if the value is not a face card" do
        expect(card.facecard?).to be_falsey
      end
    end
  end

  describe "#to_s" do
    it "shows the card" do
      expect(card.to_s).to eq("#{value} of #{suit}")
    end
  end

  describe "#to_i" do
    context "with an ace" do
      it "shows the value of the card" do
        expect(card.to_i).to eq(1)
      end
    end

    context "with a face card" do
      let(:value) { "J" }

      it "shows the value of the card" do
        expect(card.to_i).to eq(10)
      end
    end
  end
end

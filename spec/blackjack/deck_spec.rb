# frozen_string_literal: true

RSpec.describe Blackjack::Deck do
  let(:deck) { Blackjack::Deck.new }

  describe "#new" do
    it "creates a new instance" do
      expect(deck).to be_a(Blackjack::Deck)
    end

    context "it has 52 cards" do
      it "has 52 cards" do
        expect(deck.cards).to be_a(Array)
        expect(deck.cards.length).to eq(52)
      end
    end

    context "it has 13 cards of each suit" do
      it "has 13 cards of each suit" do
        expect(deck.cards.group_by(&:suit).length).to eq(4)
        expect(deck.cards.group_by(&:face).length).to eq(13)
      end
    end

    context "cards are in order" do
      it "cards are in order" do
        expect(deck.cards.map(&:suit).join).to eq(["♠" * 13, "♣" * 13, "♥" * 13, "♦" * 13].join)
        expect(deck.cards.map(&:face)).to eq(%w[A 2 3 4 5 6 7 8 9 10 J Q K] * 4)
      end
    end
  end

  describe "#shuffle" do
    before { deck.shuffle! }

    it "randomly shuffles the cards" do
      expect(deck.cards.map(&:suit).join).not_to eq(["♠" * 13, "♣" * 13, "♥" * 13, "♦" * 13].join)
      expect(deck.cards.map(&:face)).not_to eq(%w[A 2 3 4 5 6 7 8 9 10 J Q K] * 4)
    end
  end
end

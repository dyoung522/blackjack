# frozen_string_literal: true

RSpec.describe Blackjack::Game do
  let(:game) { Blackjack::Game.new }

  describe "#new" do
    it "creates a new instance" do
      expect(game).to be_a(Blackjack::Game)
    end

    it "has a dealer" do
      expect(game.dealer).to be_a(Blackjack::Player)
    end
  end

  describe "#play" do
    context "without players" do
      it "raises an error" do
        expect { game.play }.to raise_error(Blackjack::Error)
      end
    end

    context "with players" do
      before do
        game.players << Blackjack::Player.new("Player 1")
        game.play
      end

      it "deals each player a card" do
        expect(game.players.first.cards.count).to eq(2)
      end

      it "deals the dealer a card" do
        expect(game.dealer.cards.count).to eq(2)
      end
    end
  end
end

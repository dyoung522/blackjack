# frozen_string_literal: true

RSpec.describe Blackjack::Player do
  let(:player) { Blackjack::Player.new }

  describe "#new" do
    it "creates a new instance" do
      expect(player).to be_a(Blackjack::Player)
    end
  end

  describe "#cards" do
    it "has a cards array" do
      expect(player.cards).to be_a(Array)
    end
  end

  describe "#name" do
    it "has a name" do
      expect(player.name).to eq("Player")
    end

    it "assigns a name" do
      expect(Blackjack::Player.new("Fred").name).to eq("Fred")
    end

    it "can change the name" do
      player.name = "John"
      expect(player.name).to eq("John")
    end
  end

  describe "#total" do
    it "returns the total value of the cards" do
      player.cards << Blackjack::Card.new("♦", "A")
      player.cards << Blackjack::Card.new("♦", "A")
      expect(player.total).to eq(12)
    end
  end

  describe "#status" do
    context "with no status" do
      it "returns 'playing'" do
        expect(player.status).to eq("playing")
      end
    end

    context "with a win" do
      it "returns 'won'" do
        player.wins
        expect(player.status).to eq("won")
      end
    end

    context "with a loss" do
      it "returns 'lost'" do
        player.loses
        expect(player.status).to eq("lost")
      end
    end
  end

  describe "#playing?" do
    context "when status is 'playing'" do
      it "returns true" do
        expect(player.playing?).to be_truthy
      end
    end

    context "when status is not 'playing'" do
      it "returns false" do
        player.loses
        expect(player.playing?).to be_falsey
      end
    end
  end
end

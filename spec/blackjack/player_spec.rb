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
    context "with no cards" do
      it "returns 0" do
        expect(player.total).to eq(0)
      end
    end

    context "with number cards" do
      it "returns the value of the cards" do
        [Blackjack::Card.new("♦", "2"), Blackjack::Card.new("♦", "3")].each { |card| player.cards << card }
        expect(player.total).to eq(5)
      end
    end

    context "with two Aces" do
      it "returns 12" do
        player.cards << Blackjack::Card.new("♦", "A")
        player.cards << Blackjack::Card.new("♣", "A")
        expect(player.total).to eq(12)
      end
    end

    context "with two face cards" do
      it "returns 20" do
        player.cards << Blackjack::Card.new("♦", "J")
        player.cards << Blackjack::Card.new("♦", "Q")
        expect(player.total).to eq(20)
      end
    end

    context "with two aces and a face card" do
      it "returns 12" do
        [Blackjack::Card.new("♦", "A"), Blackjack::Card.new("♦", "K"), Blackjack::Card.new("♦", "A")].each { |card| player.cards << card }
        expect(player.total).to eq(12)
      end
    end


    context "with Blackjack" do
      it "returns 21" do
        [Blackjack::Card.new("♦", "K"), Blackjack::Card.new("♦", "A")].each { |card| player.cards << card }
        expect(player.total).to eq(21)
      end
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

  describe "#blackjack?" do
    context "when total is 21" do
      before do
        [Blackjack::Card.new("♦", "A"), Blackjack::Card.new("♦", "8"), Blackjack::Card.new("♦", "2")].each { |card| player.cards << card }
      end

      it "returns true" do
        expect(player.blackjack?).to be_truthy
      end
    end
  end

  describe "#bust?" do
    context "when total is greater than 21" do
      before do
        [Blackjack::Card.new("♦", "K"), Blackjack::Card.new("♦", "K"), Blackjack::Card.new("♦", "2")].each { |card| player.cards << card }
      end

      it "returns true" do
        expect(player.bust?).to be_truthy
      end
    end
  end

end

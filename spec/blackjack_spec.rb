# frozen_string_literal: true

RSpec.describe Blackjack do
  let(:blackjack) { Blackjack::Game.new}

  it "has a version number" do
    expect(Blackjack::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(blackjack).to be_a(Blackjack::Game)
  end
end

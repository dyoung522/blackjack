# frozen_string_literal: true

module Blackjack
  # A Standard Deck of Cards
  class Deck
    attr_reader :cards

    def initialize
      @cards = []
      @suits = ["♠", "♣", "♥", "♦"]
      @values = %w[A 2 3 4 5 6 7 8 9 10 J Q K]

      create_deck
    end

    def shuffle!
      @cards.shuffle!
      self
    end

    private

    def create_deck
      @suits.each do |suit|
        @values.each do |value|
          @cards << Card.new(suit, value)
        end
      end
    end
  end
end

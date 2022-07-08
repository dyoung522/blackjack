# frozen_string_literal: true

module Blackjack
  # A Standard Playing Card
  class Card
    attr_reader :suit, :value

    def initialize(suit, value)
      @suit = suit
      @value = value
    end

    def show
      "#{value} of #{suit}"
    end
  end
end

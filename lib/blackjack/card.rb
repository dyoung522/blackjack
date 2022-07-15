# frozen_string_literal: true

module Blackjack
  # A Standard Playing Card
  class Card
    attr_reader :suit, :value

    def initialize(suit, value)
      @suit = suit
      @value = value
    end

    def ace?
      value == "A"
    end

    def facecard?
      %w[J Q K].include?(value)
    end

    def to_s
      "#{value} of #{suit}"
    end

    def to_i
      return 1 if ace?
      return 10 if facecard?

      value.to_i
    end
  end
end

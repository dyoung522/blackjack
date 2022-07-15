# frozen_string_literal: true

module Blackjack
  # A Standard Playing Card
  class Card
    attr_reader :suit, :face

    def initialize(suit, face)
      @suit = suit
      @face = face
    end

    def to_s
      "#{face} of #{suit}"
    end

    def to_i
      return 1 if face == "A"
      return 10 if %w[J Q K].include?(face)

      face.to_i
    end
  end
end

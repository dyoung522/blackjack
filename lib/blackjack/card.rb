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
  end
end

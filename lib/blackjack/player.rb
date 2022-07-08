# frozen_string_literal: true

module Blackjack
  # A Standard Playing Card
  class Player
    attr_reader :cards, :status
    attr_accessor :name

    def initialize(name = "Player")
      @cards = []
      @name = name
      @status = "playing"
    end

    def total
      return 0 if cards.empty?

      total = 0

      @cards.each do |card|
        total += if card.value == "A"
                   (total + 11) < 21 ? 11 : 1
                 else
                   %w[J Q K].include?(card.value) ? 10 : card.value.to_i
                 end
      end

      total
    end

    def wins
      @status = "won"
    end

    def loses
      @status = "lost"
    end

    def playing?
      @status == "playing"
    end
  end
end

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
      total = @cards.sum(&:to_i)

      @cards.select { |card| card.face == "A" }.each { total += 10 if total + 10 <= 21 }

      total
    end

    def blackjack?
      total == 21
    end

    def bust?
      total > 21
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

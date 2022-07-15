# frozen_string_literal: true

module Blackjack
  # The game of Blackjack
  class Game
    attr_accessor :players
    attr_reader :dealer

    def initialize
      @deck = Deck.new.shuffle!
      @dealer = Player.new("Dealer")
      @players = []
      @status = "new"
    end

    def play
      raise Blackjack::Error, "No players" if players.empty?

      start_game unless @status == "playing"

      end_game if players_playing.empty?

      show_cards

      # get player input and deal next round here
    end

    private

    def deal_cards
      dealer.cards << @deck.cards.pop
      players_playing.each do |player|
        player.cards << @deck.cards.pop
      end
    end

    def start_game
      2.times { deal_cards }
      @status = "playing"
    end

    def end_game
      @status = "ended"
    end

    def show_cards
      dealer.cards[1..].each do |card|
        puts "Dealer shows #{card}"
      end

      if dealer.blackjack?
        puts "Dealer wins with BlackJack!"
        end_game
      end

      if dealer.bust?
        puts "Dealer busts!"
        end_game
      end

      players_playing.each do |player|
        puts "#{player.name} has #{player.cards.map(&:to_s).join(", ")} for a total of #{player.total}"
        win_or_lose?(player)
      end
    end

    def players_playing
      players.filter(&:playing?)
    end

    def win_or_lose?(player)
      if player.blackjack?
        puts "#{player.name} wins with BlackJack!"
        player.wins
        return
      end

      return unless player.bust?

      puts "#{player.name} has busted!"
      player.loses
    end
  end
end

# frozen_string_literal: true

require_relative "blackjack/version"
require_relative "blackjack/card"
require_relative "blackjack/deck"
require_relative "blackjack/game"
require_relative "blackjack/player"

module Blackjack
  class Error < StandardError; end
end

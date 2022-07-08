# Blackjack

Scooby Doobie Doo! Here's a blackjack game just for you!

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add blackjack

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install blackjack

## Status

At this point, the following features exist:

1. `Blackjack::Game.new.play` starts a new game
1. Dealer only shows the player-visible cards (i.e. not the first card)
1. Game is over if the Dealer wins by BlackJack
1. All players display their hands and their current card value
1. Any winning or losing hands are displayed as such

After each round, any remaining players would be dealt a new card and the round would continue as above until all players (or the dealer) is out.

### ToDo

- Only the core game has currently been implemented, and no CLI command has been created. However, I plan on using `Thor` to add a CLI tool in the future.

- Only one round plays currently. It should be each to add the game-loop in as (I believe) all the relative parts are there for it, just not the loop itself.

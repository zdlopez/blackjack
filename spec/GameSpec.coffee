assert = chai.assert

describe 'Game rules', ->
  deck = null
  hand = null
  app = null


  beforeEach ->
    app = new App()
    deck = new Deck()
    hand = deck.dealPlayer()
    dealer = deck.dealDealer();

  # TODO
  # Testing the dealer hitting (automatic) Keep on hitting until score 17.

  # TODO
  # Non automatic decision situation by comparison. Both with valid hands
    # Tied
    # Dealer wins
    # Player wins

  # TODO
  # Automatic decision situation
    # Busting
    # Blackjack

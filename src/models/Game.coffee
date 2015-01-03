class window.Game extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    # TODO: Extra Credit
    # Add discard deck

    @on('blackjack', (hand)=>
      winner = 'Player'
      if hand.isDealer
        winner = 'Dealer'
      alert("#{winner} is the winner")
    )

    @on('busted', (hand)=>
      winner = 'Dealer'
      if hand.isDealer
        winner = 'Player'
      alert("#{winner} is the winner")
    )



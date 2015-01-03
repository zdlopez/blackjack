class window.Game extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    # TODO: Extra Credit
    # Add discard deck

    @get('playerHand').on('blackjack', (hand)=>
      console.log('how about now')
      winner = 'Player'
      if hand.isDealer
        winner = 'Dealer'
      alert("#{winner} is the winner")
    )

    @get('playerHand').on('busted', (hand)=>
      winner = 'Dealer'
      if hand.isDealer
        winner = 'Player'
      alert("#{winner} is the winner")
    )



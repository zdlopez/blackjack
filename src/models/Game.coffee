class window.Game extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @set 'decision', false

    # TODO: Extra Credit
    # Add discard deck

    # @get('playerHand').on('blackjack', (hand)=>
    #   winner = 'Player'
    #   @set 'decision', true
    #   console.log("#{winner} is the winner")
    # )

    @get('playerHand').on('busted', (hand)=>
      winner = 'Dealer'
      console.log("#{winner} is the winner")
    )

    # @get('dealerHand').on('blackjack', (hand)=>
    #   winner = 'Dealer'
    #   @set 'decision', true
    #   console.log("#{winner} is the winner")
    # )

    @get('dealerHand').on('busted', (hand)=>
      winner = 'Player'
      console.log("#{winner} is the winner")
    )

    @get('playerHand').on('stand', (hand)=>
      dealer = @get('dealerHand')
      dealer.first().flip()

      while(dealer.getScore() < 17)
        dealer.hit()

      if dealer.getScore() < 22
        dealer.stand()
    )

    # @get('dealerHand').on('stand', (hand)=>
    #   dealerScore = @get('dealerHand').getScore()
    #   playerScore = @get('playerHand').getScore()

    #   if dealerScore == playerScore
    #     console.log("Push!")
    #   else if dealerScore > playerScore
    #     console.log("Dealer is the winner")
    #   else
    #     console.log("Player is winner")

    # )

class window.Game extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @set 'winner', null

    # TODO: Extra Credit
    # Add discard deck

    @get('playerHand').on('blackjack', (hand)=>
      @set 'winner', 'Player'
    )

    @get('playerHand').on('busted', (hand)=>
      @set 'winner', 'Dealer'
    )

    @get('dealerHand').on('blackjack', (hand)=>
      hand.first().set 'revealed', true
      @set 'winner', 'Dealer'
    )

    @get('dealerHand').on('busted', (hand)=>
      @set 'winner', 'Player'
    )

    @get('playerHand').on('stand', (hand)=>
      dealer = @get('dealerHand')
      dealer.first().flip()

      while(dealer.getScore() < 17)
        dealer.hit()

      if dealer.getScore() < 22
        dealer.stand()
    )

    @get('dealerHand').on('stand', (hand)=>
      dealerScore = @get('dealerHand').getScore()
      playerScore = @get('playerHand').getScore()

      if dealerScore == playerScore
        @set 'winner', 'Push'
      else if dealerScore > playerScore
        @set 'winner', 'Dealer'
      else
        @set 'winner', 'Player'

    )

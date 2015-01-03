class window.GameView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button> <button class="next-game">Next Game</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .next-game': ->
      @model.initialize()
      @initialize()
    'click .stand-button': ->
      @model.get('playerHand').stand()
      @gameStop()

  initialize: ->
    @model.get('playerHand').on('blackjack', (hand)=>
      console.log('Player blackjack')
      @gameStop()
    )
    @model.get('dealerHand').on('blackjack', (hand)=>
      console.log('Dealer blackjack')
      @gameStop()
    )
    @model.get('playerHand').on('busted', (hand)=>
      @gameStop()
    )
    @model.get('dealerHand').on('busted', (hand)=>
      @gameStop()
    )
    @render()


    # @model.on('change:decision', =>
    #   @gameStop()
    # )

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.next-game').hide()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

  gameStop: ->
    @$('.hit-button').hide()
    @$('.stand-button').hide()
    @$('.next-game').show()

    dealerScore = @model.get('dealerHand').getScore()
    playerScore = @model.get('playerHand').getScore()


    result = if dealerScore == playerScore
      "Push!"
    else if dealerScore > playerScore
      "Dealer is the winner"
    else
      "Player is winner"

    @$el.append("<div class=\"result\">#{result}</div>")







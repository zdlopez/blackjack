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
      @render()
    'click .stand-button': ->
      @model.get('playerHand').stand()
      @gameStop()

  initialize: ->
    @render()
    @model.get('playerHand').on('busted', (hand)=>
      @gameStop()
    )
    @model.get('dealerHand').on('busted', (hand)=>
      @gameStop()
    )
    @model.get('playerHand').on('blackjack', (hand)=>
      @gameStop()
    )
    @model.get('dealerHand').on('blackjack', (hand)=>
      @gameStop()
    )

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

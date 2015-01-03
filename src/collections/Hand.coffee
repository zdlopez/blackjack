class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->
    # @on('add', =>
    #   @score()
    #   )

  hit: ->
    @add(@deck.pop())

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  getScore: ->
    scoreWithAce = @minScore() + 10 * @hasAce()
    myScore = if scoreWithAce < 22
      scoreWithAce
    else
      @minScore()
    myScore

  score: ->
    myScore = @getScore()
    if @length is 2 and myScore is 21
      @blackjack()

    if myScore > 21
      @busted()

    myScore


  blackjack: ->
    @trigger('blackjack', @)

  busted: ->
    @trigger('busted', @)

  stand: ->
    @trigger('stand', @)




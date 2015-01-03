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

  score: ->
    # We take the scores element that is Largest and lower than 22.
    scoreWithAce = @minScore() + 10 * @hasAce()
    myscore = if scoreWithAce < 22
      scoreWithAce
    else
      @minScore()

    if @length is 2 and myscore is 21
      @blackjack()

    if myscore > 21
      @busted()

    myscore

  blackjack: ->
    @trigger('blackjack', @)

  busted: ->
    console.log('We are here')
    @trigger('busted', @)




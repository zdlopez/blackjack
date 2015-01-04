class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->
    # @on('add', =>
    #   @score()
    #   )

  hit: ->
    @add(@deck.pop())

  hasAce: -> @reduce (memo, card) ->
    memo or (card.get('value') is 1 and card.get 'revealed')
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

    # Evaluate when not 'revealed' and consealed is a 10.

  score: ->
    myScore = @getScore()
    if @length is 2 and @hasAce() and myScore + 11 is 21 and @isDealer
      @blackjack()


    if @length is 2 and myScore is 21 and not @isDealer
      @blackjack()

    if myScore > 21
      @busted()

    myScore


  blackjack: ->
    @trigger('blackjack', @)


  busted: ->
    console.log('Have i Busted?')
    @trigger('busted', @)

  stand: ->
    @trigger('stand', @)




class window.Deck extends Backbone.Collection
  model: Card

  initialize: ->
    @add _([0...52]).shuffle().map (card) ->
      new Card
        rank: card % 13
        suit: Math.floor(card / 13)

  dealPlayer: -> new Hand [@pop(), @pop()], @

  dealDealer: -> new Hand [new Card('rank': 1,'suit': 1 ).flip(), new Card('rank': 0,'suit': 2)], @, true

  #[@pop().flip(), @pop()], @, true


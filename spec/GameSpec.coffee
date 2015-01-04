assert = chai.assert
expect = chai.expect

describe 'Game rules', ->
  deck = null
  hand = null
  app = null


  beforeEach ->
    app = new App()
    deck = new Deck()
    hand = deck.dealPlayer()
    dealer = deck.dealDealer();

  # TODO
  # Testing the dealer hitting (automatic) Keep on hitting until score 17.
  it 'should see if the dealer is hits after player stands', ->
    game = new Game()
    player = game.get('playerHand')
    dealer = game.get('dealerHand')

    spy = sinon.spy(dealer, 'hit')
    player.stand()
    expect(spy.called).to.equal(true)

  xit 'should see if the dealer hits until score is 17', ->


  # TODO
  # Non automatic decision situation by comparison. Both with valid hands
    # Tied
    # Dealer wins
    # Player wins

  xit 'should select winner as Push when tied', ->


  # TODO
  # Automatic decision situation
    # Busting
    # Blackjack

  it 'player should bust if score over 21', ->
    app = new App()
    view = new AppView(model: app)
    player = app.get('game').get('playerHand')

    spy = sinon.spy(player, 'busted')
    player.hit()
    player.hit()
    player.hit()
    player.hit()
    player.hit()
    player.hit()

    expect(spy.called).to.equal(true)



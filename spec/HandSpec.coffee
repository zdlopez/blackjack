assert = chai.assert
expect = chai.expect
#sinon = require('sinon')

describe 'Hands', ->
  deck = null
  hand = null

  describe 'Scores', ->
    it 'Scores 12 for 2 aces in a hand', ->
      console.log(king1)
      ace1 = new Card('rank': 1,'suit': 1 )
      ace2 = new Card('rank': 1,'suit': 2)
      #Setup 1 hand with 2 aces and check if score is 2.
      testHand = new Hand [ace1, ace2], deck
      assert.strictEqual testHand.score(), 12

    it 'Scores 21 for 1 ace and 1 king', ->
      king1 = new Card('rank': 0,'suit': 1 )
      ace1 = new Card('rank': 1,'suit': 1 )
      testHand = new Hand [ace1, king1], deck
      assert.strictEqual testHand.score(), 21

    # TODO
    # should detect bust signal
    it 'Should bust for 2 kings and 1 five', ->
      king1 = new Card('rank': 0,'suit': 1 )
      king2 = new Card('rank': 0,'suit': 2)
      five1 = new Card('rank': 5,'suit': 1 )
      testHand = new Hand [king1, king2 , five1], deck
      assert.strictEqual testHand.score(), 25

    # TODO
    # Should detect blackjack in Player's hand
    it 'Should detect blackjack in Player\'s hand', ->
      king1 = new Card('rank': 0,'suit': 1)
      ace1 = new Card('rank': 1,'suit': 1)
      hand = new Hand [ace1], deck
      spy = sinon.spy(hand, 'trigger')

      handview = new HandView collection: hand

      expect(spy.called).to.equal(false)
      hand.add(king1)
      expect(spy.called).to.equal(true)


    it 'Should detect blackjack in Dealer\'s hand', ->
      king1 = new Card('rank': 0,'suit': 1)
      ace1 = new Card('rank': 1,'suit': 1)
      hand = new Hand [ace1], deck, true
      spy = sinon.spy(hand, 'trigger')

      handview = new HandView collection: hand

      expect(spy.called).to.equal(false)
      hand.add(king1)
      expect(spy.called).to.equal(true)

    # Game controls the Dealer logic
    #



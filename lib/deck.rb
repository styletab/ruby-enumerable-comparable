require_relative 'card'

# A simple represenation of a deck of playing cards
class Deck
  # attr_reader returns instance variables
  attr_reader :storage
  # private disallows storage to be accessed outside the class
  private :storage

  def initialize
    @storage = Card::SUITS.map do |suit|
      # creating a card for each combo of suit/rank
      Card::RANKS.map { |rank| Card.new(rank, suit) }
    end.flatten
  end

  # swap front and back somewhere in the middle third.
  def cut
    # accessing directly through instances is an anti-pattern
    # that's why we don't use @store below
    count = storage.length
    random = Random.rand(count / 3)
    cut_point = (count / 3 + random)
    # last line will always be returned in ruby you don't have to type 'return'
    storage.replace storage.slice(cut_point, count - cut_point) +
                 storage.slice(0, cut_point)
  end

  def draw
    # we're calling storage on the instance of deck. returns the deck instance varible which
    # is an instance of a card, but this a bug because it's return an instance
    # of deck
    storage.shift
  end

  def shuffle
    # returns the mutated storage array
    storage.shuffle!
    # self is pointing to the object of storage
    self
  end

  def deal(cards, *hands)
    # deal the number of cards requested into the number of hands requested
    # one at a time
    # the asterick allows you to pass multiple arguments aka splat
    cards.time do
      hands.each do |hand|
        hand << draw
      end
    end
  end
end

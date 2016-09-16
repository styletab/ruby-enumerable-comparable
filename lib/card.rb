# A simple representation of a playing card.

class Card
  include Comparable

  def <=>(other)
  end

  # %w greates an array of strings
  # starting with a capital tells ruby it's a constant, you can mutate it but
  # you cant redefine it
  # all caps is convention for telling someone that this has been fronzen.
  SUITS = %w(C D H S).freeze
  # .to_a means to array flatten removes nested arrays
  RANKS = [(2..10).to_a, %w(J Q K A)].flatten.freeze =

  attr_reader :suit, :rank

  def initialize(rank, suit)
    raise ArgumentError,
          "Suit: '#{suit}' not in #{SUITS}" unless SUITS.include? suit
    raise ArgumentError,
          "Rank: '#{rank}' not in #{RANKS}" unless RANKS.include? rank

    @suit = suit
    @rank = rank
  end

  def to_s
    "#{rank}:#{suit}"
  end
end

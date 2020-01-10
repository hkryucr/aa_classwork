require_relative "card"

class Deck
    attr_accessor :cards, :discarded

    HASH_NAME = {1=>:ACE, 2 => :TWO, 3=>:THREE, 4=>:FOUR, 5=>:FIVE, 6=>:SIX, 7=>:SEVEN, 8=>:EIGHT, 
9 => :NINE, 10 => :TEN, 11 => :JACK, 12 => :QUEEN, 13 => :KING}

    def initialize
        @cards = []
        @discarded = []
    end

    def fill_deck
        symbols = [:heart, :diamond, :clover, :spade]
        numbers = (1..13).to_a
        numbers.each do |num|
            symbols.each do |sym|
                name = HASH_NAME[num]
                @cards << Card.new(sym, num, name)
            end
        end
    end

    def shuffle
        cards.shuffle!
    end

    def deal(num)
        dealing_cards = []
        num.times {dealing_cards << cards.shift}
        dealing_cards
    end

end

# deck1 = Deck.new
# deck1.fill_deck
# p deck1
require_relative 'deck'

class Hand
    attr_accessor :cards, :value, :hash

    VALUES = {straight_flush: 9, four_of_a_kind: 8, full_house: 7, flush: 6, straight: 5, three_of_kind: 4, two_pair: 3, one_pair: 2, hight_card: 1}

    def initialize
        @cards = []
        # @value = Hand.find_match(@cards)
        @cards.sort!{|a,b| a.value <=> b.value}
        @hash = self.card_hash
    end

    def card_hash
        hash = Hash.new(0)
        cards.each do |card|
            @hash[card.value] +=1
        end
        hash
    end

    def self.check_compare_match
        straight_flush

    end

    def straight_flush 
        (0...cards.length-1).each do |idx|
            if !(cards[idx].symbol == cards[idx+1].symbol && cards[idx].value + 1 == cards[idx+1].value)
                return false
            end
        end
        true
    end

    def four_of_a_kind
        hash.values.include?(4)
        
    end

    def full_house
        hash.values.include?(3) && hash.values.include?(2)

    end

    def flush
        cards.all? { |card| card.symbol == cards[0].symbol }
    end

    def straight
        (cards[0].value - cards[-1].value) == 4
    end

    def three_of_kind
        hash.values.include?(3)
    end

    def two_pair
        hash.count { |k, v| v == 2 } == 2
    end

    def one_pair
        hash.values.include?(2)
    end
end


hand1 = Hand.new
deck1 = Deck.new
hand1.cards = deck1.deal(5)
hand1.straight_flush

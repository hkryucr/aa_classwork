class Card
    attr_reader :symbol, :value, :name
    def initialize(symbol, value, name)
        @symbol = symbol
        @value = value
        @name = name
    end
end
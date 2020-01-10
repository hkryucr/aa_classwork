class TOH
    attr_reader :board

    def initialize(discs)
        @board = Array.new(3){[]}
        @discs = []
        (0...discs).each do |num|
            @discs << [num] # [[1][2][3][4]]
        end     
    end
end
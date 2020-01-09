module Stepable

    KING_DIC = [1,-1,0].product([1,-1,0])[0..-2]
    KNIGHT_DIC = ([2,-2].product([1,-1]) + [1,-1].product([2,-2]))
    
    def moves
        possible_moves = []
        dictionary = move_diffs
        pos_x, pos_y = pos
        dictionary.each do |dir|
            dir_x, dir_y = dir
            cur_x, cur_y = (pos_x + dir_x), (pos_y + dir_y)
            cur_pos = [cur_x, cur_y]
            if (cur_x >= 0) && (cur_x <= 7) && (cur_y >= 0) && (cur_y <= 7) 
                if !(board[cur_pos] != board.sentinel && color == board[cur_pos].color)
                    possible_moves << cur_pos
                end
            end
        end
        possible_moves
    end

    def king_dic 
        KING_DIC
    end

    def knight_dic
        KNIGHT_DIC
    end

    private

    def move_diffs
        case symbol
        when :knight 
            dictionary = knight_dic
        when :king
            dictionary = king_dic
        end
        dictionary
    end

end
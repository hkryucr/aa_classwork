module Slideable
    
    HORIZONTAL_DIRS = [[1,0],[-1,0],[0,1],[0,-1]]
    DIAGNAL_DIRS = [[1,1],[-1,1],[1,-1],[-1,-1]]

    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def diagnal_dirs 
        DIAGNAL_DIRS
    end

    def moves
        move_dirs_arr = move_dirs
        possible_moves = []
        move_dirs_arr.each do |pos|
            dx, dy = pos
            possible_moves += grow_unblocked_moves_in_dir(dx, dy)
        end
        possible_moves
    end

    private

    def move_dirs
        directions = []
        case symbol
        when :queen
            directions = (horizontal_dirs + diagnal_dirs)
        when :rook
            directions = horizontal_dirs
        when :bishop
            directions = diagnal_dirs
        end
        directions
    end

    def grow_unblocked_moves_in_dir(dx, dy)
        unblocked_moves = []
        multi = 1
        pos_x , pos_y = pos
        cur_x = (pos_x + dx * multi) 
        cur_y = (pos_y + dy * multi)
        cur_pos = [cur_x, cur_y]
        while (cur_x < 8) && (cur_x > 0) && (cur_y < 8) && (cur_y > 0) 
            if board[cur_pos] != board.sentinel
                break if color == board[cur_pos].color
                    unblocked_moves << cur_pos
                break 
            else  
                unblocked_moves << cur_pos
                multi += 1
                cur_x = (pos_x + dx * multi) 
                cur_y = (pos_y + dy * multi)
                cur_pos = [cur_x, cur_y]
            end
        end
        unblocked_moves
    end

end 
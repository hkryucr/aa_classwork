def my_uniq(arr)
    new_arr = []
    arr.each do |ele|
        new_arr << ele if !new_arr.include?(ele)
    end
    new_arr
end

class Array

    def two_sum
        new_arr = []
        (0...self.length).each do |first_idx|
            (first_idx + 1...self.length).each do |second_idx|
                new_arr << [first_idx,second_idx] if self[first_idx] + self[second_idx] == 0
            end
        end
        new_arr
    end

end

def my_transpose(arr)

    arr.map.with_index do |row, idx1|
        row.map.with_index do |col, idx2|
            arr[idx2][idx1]
        end
    end
end

def stock_picker(arr)

    max_price = arr[1]
    max_idx = arr.index(arr[1])
    min_price = arr[0]
    min_idx = arr.index(arr[0])
    maximum_profit = 0

    if max_price - min_price > 0
        maximum_profit = max_price - min_price
        profit_days = [min_idx, max_idx]
    end

    (1...arr.length).each do |idx|
        
        if arr[idx] > max_price
            max_price = arr[idx]
            max_idx = idx
        end
        
        if arr[idx] < min_price
            min_price = arr[idx]
            min_idx = idx
        end
            
        if max_idx > min_idx
            current_profit = max_price - min_price 
            if maximum_profit < current_profit
                maximum_profit = current_profit
                profit_days = [min_idx, max_idx]
            end
        end
    end

    profit_days
end
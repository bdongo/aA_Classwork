
def my_uniq(arr)
    ans = []
    (0...arr.length).each do | i | 
        if !ans.include?(arr[i])
            ans << arr[i]
        end
    end
   ans
end

def two_sum(arr)
    ans = []
    (0...arr.length).each do |i|
        (i + 1...arr.length).each do |j|
            if arr[i] + arr[j] == 0
                ans << [i, j]
            end
        end
    end
    ans
end

def my_transpose(matrix)
    ans = Array.new(matrix.length){Array.new(matrix.length)}
    (0...matrix.length).each do |i|
        (0...matrix.length).each do |j|
            ans[j][i] = matrix[i][j]
        end
    end
    ans
end

def stock_picker(prices)
    ans = []
    

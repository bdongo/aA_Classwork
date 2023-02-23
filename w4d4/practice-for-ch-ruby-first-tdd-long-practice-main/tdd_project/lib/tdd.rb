
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

end
def zip(*arrays)
    length = arrays.first.length
    zipped = []

    (0...length).each do |i|
        zipped << arrays.map {|arr| arr[i]}
    end

    zipped
end

def prizz_proc(arr, prc1, prc2)
    arr.select do |ele|
        (prc1.call(ele) == true && prc2.call(ele) == false) || (prc1.call(ele) == false && prc2.call(ele) == true)
    end
end

def zany_zip(*arrays)
    arrays.sort_by {|arr| arr.length}
    max_len = arrays.last.length
    p max_len
end
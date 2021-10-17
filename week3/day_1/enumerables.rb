class Array
    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i+=1
        end
        self
    end

    def my_select(&prc)
        selected=[]
        self.my_each {|ele| selected << ele if prc.call(ele)}
        selected
    end

    def my_reject(&prc)
        self.my_select {|ele| !prc.call(ele)}
    end

    def my_any?(&prc)
        self.my_each {|ele| return true if prc.call(ele)}
        false
    end

    def my_all?(&prc)
        self.my_each {|ele| return false if !prc.call(ele)}
        true
    end

    def my_flatten
        flattened = []
        self.my_each do |ele|
            ele.is_a?(Array) ? flattened.concat(ele.my_flatten) : flattened << ele 
        end
        flattened
    end

    def my_zip(*args)
        zipped = []
        args.unshift(self)
        (0...self.length).my_each do |idx|
            idx_arr = []
            args.my_each do |arr|
                idx_arr << arr[idx]
            end
            zipped << idx_arr
        end
        zipped
    end

    def my_rotate(rots=1)
        idx = rots % self.length
        self.drop(idx) + self.take(idx)
    end

    def my_join(joint='')
        joined = ''
        self.each_with_index do |ele, idx| 
            joined.concat(ele).concat(joint) unless idx == self.length - 1
            joined.concat(ele) if idx == self.length - 1
        end
        joined
    end

    def my_reverse
        reversed = []
        self_dup = self.dup 
        until self_dup.empty?
            reversed << self_dup.pop
        end
        reversed
    end





end
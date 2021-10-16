
# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        return nil if self.empty?
        self.sort.last - self.sort.first
    end

    def average
        return nil if self.empty?
        self.sum * 1.0 / self.length
    end

    def median
        return nil if self.empty?
        if self.length.odd?
            self.sort[(self.length - 1) / 2]
        else 
            self.sort[((self.length - 2) / 2)..(self.length / 2)].average
        end
    end

    def counts
        count = Hash.new(0)
        self.each do |ele|
            count [ele] += 1
        end
        count
    end

    def my_count(val)
        self.counts[val]
    end

    def my_index(val)
        self.each_with_index do |ele, i| 
            if ele == val
                return i
            end
        end
        nil
    end

    def my_uniq
        uniq = []
        self.each {|ele| uniq << ele if !uniq.include?(ele)}
        uniq
    end

    def my_transpose
        length = self.first.length
        transposed = []

        (0...length).each do |i|
            arr = []
            self.each { |ele| arr << ele[i] }
            transposed << arr 
        end

        transposed 
    end
        
end

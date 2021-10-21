class Array
    def deep_dup
        duped = []
        self.each do |ele|
            if ele.is_a?(Array)
                duped << ele.deep_dup
            else
                duped << ele
            end
        end
        duped
    end

    
end

# robot_parts = [
#   ["nuts", "bolts", "washers"],
#   ["capacitors", "resistors", "inductors"]
# ]

# robot_parts_copy = robot_parts.deep_dup

# # shouldn't modify robot_parts
# p robot_parts_copy[1] << "LEDs"
# # but it does
# p robot_parts[1] # => ["capacitors", "resistors", "inductors", "LEDs"]
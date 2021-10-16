class Room
    attr_reader :capacity, :occupants
    
    def initialize(capacity)
        @capacity = capacity
        @occupants = []
    end

    def full?
        if self.occupants.length < self.capacity
            false
        else
            true
        end
    end

    def available_space
        self.capacity - self.occupants.length 
    end

    def add_occupant(name)
        if self.full?
            return false
        else
            self.occupants << name
            return true
        end
    end


end

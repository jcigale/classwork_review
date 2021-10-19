class Card

    def initialize(value, face_up=false)
        @value = value
        @face_up = face_up
    end

    def value
        @value if @face_up
    end

    def hide
        @face_up = false
    end

    def reveal
        @face_up = true
    end

    def ==(card)
        self.value == card.value
    end
end
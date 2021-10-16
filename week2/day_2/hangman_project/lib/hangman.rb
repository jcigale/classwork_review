class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end 

  def already_attempted?(char)
    @attempted_chars.include?(char) ? true : false
  end

  def get_matching_indices(char)
    idxs = []
    @secret_word.each_char.with_index do |let, idx|
      idxs << idx if char == let
    end
    idxs
  end

  def fill_indices(char, idxs)
    idxs.each { |idx| self.guess_word[idx] = char }
  end

  def try_guess(char)
    if self.already_attempted?(char)
      print 'that has already been attempted'
      return false
    else 
      self.attempted_chars << char
      @remaining_incorrect_guesses -= 1 if self.get_matching_indices(char).empty?
      self.fill_indices(char, self.get_matching_indices(char))
      return true
    end
  end

  def ask_user_for_guess
    print "Enter a char:"
    char = gets.chomp
    self.try_guess(char)
  end

  def win?
    if @secret_word == @guess_word.join("")
      puts "YOU WIN"
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "YOU LOSE"
      return true
    else
      return false
    end
  end

  def game_over?
    if win? || lose?
      puts "The word was " + @secret_word
      return true
    else
      return false
    end
  end
end

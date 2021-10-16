class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs 

  def self.valid_pegs?(chars)
    chars.all? {|char| POSSIBLE_PEGS.include?(char.upcase)}
  end

  def self.random(length)
    pegs = Array.new(length) { Code::POSSIBLE_PEGS.keys.sample }
    Code.new(pegs)
  end

  def self.from_string(pegs)
    Code.new(pegs.split(''))
  end

  def initialize(chars)
    if !Code.valid_pegs?(chars) 
      raise 'invalid pegs' 
    else 
      @pegs = chars.map {|char| char.upcase}
      true
    end
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(code)
    exact_matches = 0
    (0...code.length).each { |i| exact_matches += 1 if code[i] == self[i] }
    exact_matches
  end

  def num_near_matches(code)
    near_matches = 0
    code_dup = code.pegs.dup 
    self_dup = self.pegs.dup
    
    (0...code.length).each do |i| 
      if code_dup[i] == self[i] 
        code_dup[i] = nil
        self_dup[i] = nil
      end
    end

    code_dup.delete(nil)
    self_dup.delete(nil)

    code_dup.each do |peg|
      if self_dup.include?(peg)
        near_matches += 1
        self_dup.delete_at(self_dup.index(peg))
      end
    end

    near_matches
  end

  def ==()

  end

  

  

end

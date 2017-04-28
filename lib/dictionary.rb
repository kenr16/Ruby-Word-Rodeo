require('uuid')

class Word
  @@words = []
  @@score = []

  attr_accessor(:string, :id)

  def initialize(string)
    self.string = string
    self.id = UUID.new.generate
    @definitions = []
    @links = []
    @@words.push(self) unless self.string.empty?
    @@score.push("X") unless self.string.empty?
  end

  def self.clear_words
    @@words = []
  end

  def self.all
    @@words
  end

  def self.score
    @@score.length()
  end

  def definitions
    @definitions
  end

  def links
    @links
  end

  def add_definition(definition)
    @definitions.push(definition) unless definition.string.empty?
    @@score.push("X") unless definition.string.empty?
  end

  def add_link(link)
    @links.push(link) unless link == ""
    @@score.push("X") unless link == ""
  end

  def self.find(input)
    @@words.detect {|word| word.id == input}
  end

  def self.find_word(input)
    @@words.detect {|word| word.string.downcase == input.downcase}
  end

  def self.delete(id)
    @@words.delete(self.find(id))
  end

  def self.sort()
  @@words.sort! { |a,b| a.string.downcase <=> b.string.downcase }
  end

  def self.random
    @@words.shuffle[0].id
  end

end

class Definition
  attr_accessor(:string)

  def initialize(string)
    self.string = string
  end
end

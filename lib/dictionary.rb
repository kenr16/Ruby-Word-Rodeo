require('uuid')

class Word
  @@words = []

  attr_accessor(:string, :id)

  def initialize(string)
    self.string = string
    self.id = UUID.new.generate
    @definitions = []
    @@words.push(self) unless self.string.empty?
  end

  def self.clear_words
    @@words = []
  end

  def self.all
    @@words
  end

  def definitions
    @definitions
  end

  def add_definition(definition)
    @definitions.push(definition) unless definition.string.empty?
  end

  def self.find(input)
    @@words.detect {|word| word.id == input}
  end

  def self.delete(id)
    @@words.delete(self.find(id))
  end

end

class Definition
  attr_accessor(:string)

  def initialize(string)
    self.string = string
  end
end

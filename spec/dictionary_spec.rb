require "dictionary"
require "rspec"
require "pry"

describe 'Word' do

  before do
    Word.clear_words
  end

  describe("#initialize") do
    it "Adds an initial word to the list of words" do
      test_word = Word.new("Interesting")
      expect(test_word.string).to eq("Interesting")
    end
  end

  describe(".all") do
    it('is empty at first') do
      expect(Word.all()).to(eq([]))
    end
  end

  describe(".all") do
    it('Add two words and return them both') do
      test_word = Word.new("Interesting")
      test_word2 = Word.new("Amazing")
      expect(Word.all().length).to(eq(2))
    end
  end

  describe("#add_definition") do
    it "Creates a word and inserts a definition into it" do
      test_word = Word.new("Mouse")
      test_definition = Definition.new("A small rodent")
      expect(test_word.string).to eq("Mouse")
      expect(test_definition.string).to eq("A small rodent")
      test_word.add_definition(test_definition)
      expect(test_word.definitions.length).to(eq(1))
    end
  end

  describe("#find") do
    it "Finds and returns a word given the word's ID" do
      test_word = Word.new("Hello")
      id = test_word.id
      expect(Word.find(id)).to eq(test_word)
    end
  end

  describe("#find_word") do
    it "Finds and returns a word given the word's string" do
      test_word = Word.new("Hello")
      expect(Word.find_word("Hello")).to eq(test_word)
    end
  end

  describe("#delete") do
    it "Finds the word from the overall list of words and deletes it" do
      test_word = Word.new("Hello")
      id = test_word.id
      Word.delete(id)
      expect(Word.all).to eq([])
    end
  end

end

describe 'Definition' do
  describe("#initialize") do
    it "Adds an initial object with class Definition" do
      test_definition = Definition.new("A small rodent")
      expect(test_definition.string).to eq("A small rodent")
    end
  end
end

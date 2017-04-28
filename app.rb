require('sinatra')
require('sinatra/reloader')
require('./lib/dictionary')
require('pry')
require('dictionary_lookup')

also_reload('lib/**/*.rb')

get('/') do
  @floating_text = "Welcome to the word rodeo, round up some words and define them to win points!"
  erb(:index)
end





post('/add-word') do
  word_input = params.fetch('word_input')
  results = DictionaryLookup::Base.define(word_input)
  if results.count >= 1
    Word.new(word_input)
    @floating_text = "You've corralled a NEW WORD ranch hand: #{word_input}"
  else
    @floating_text = "This word does not appear in English."
  end
  erb(:index)
end

get("/edit/:id") do
  @word = Word.find(params.fetch('id'))
  display = @word.string
  @floating_text = "#{display}"
  erb(:word)
end

post("/add-definition/:id") do
  definition_input = params.fetch('definition_input')
  new_definition = Definition.new(definition_input)
  @word = Word.find(params.fetch('id'))
  @word.add_definition(new_definition)
  display = @word.string
  @floating_text = "#{display}"
  erb(:word)
end

post("/add-link/:id") do
  link_input = params.fetch('link_input')
  @word = Word.find(params.fetch('id'))
  @word.add_link(link_input)
  display = @word.string
  @floating_text = "#{display}"
  erb(:word)
end

get("/delete/:id") do
  @floating_text = "Word Deleted!"
  Word.delete(params.fetch('id'))
  erb(:index)
end

get("/alphabetize") do
  @floating_text = "Words Alphabetized!"
  Word.sort()
  erb(:index)
end

get("/random") do
  id = Word.random
  @word = Word.find(Word.all.shuffle[0].id)
  display = @word.string
  @floating_text = "#{display}"
  erb(:word)
end

get("/search") do
  word_to_find = params.fetch('search_input')
  @word = Word.find_word(word_to_find)
  if @word != nil
    display = @word.string
    @floating_text = "#{display}"
    erb(:word)
  else
    @floating_text = "Word Not Found!"
    erb(:index)
  end


end

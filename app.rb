require 'sinatra'
require 'sinatra/reloader'
require './lib/dictionary'
require 'pry'

also_reload('lib/**/*.rb')

get('/') do
  @floating_text = "Welcome to the word rodeo, round up some words and define them to win points!"
  erb(:index)
end

post('/add-word') do
  word_input = params.fetch('word_input')
  Word.new(word_input)
  @floating_text = "You've corralled a NEW WORD ranch hand: #{word_input}"
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

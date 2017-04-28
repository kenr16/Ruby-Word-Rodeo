require 'sinatra'
require 'sinatra/reloader'
require './lib/dictionary'
require 'pry'

also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

get('/add-word') do
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

get("/add-definition/:id") do
  definition_input = params.fetch('definition_input')
  new_definition = Definition.new(definition_input)
  @word = Word.find(params.fetch('id'))
  @word.add_definition(new_definition)
  display = @word.string
  @floating_text = "#{display}"
  erb(:word)
end

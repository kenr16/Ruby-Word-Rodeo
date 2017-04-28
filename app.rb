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
  erb(:word)
end

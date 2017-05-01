require 'sinatra'
require 'sinatra/reloader'
require './lib/todo'
require 'pry'

also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

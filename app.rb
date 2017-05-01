require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/task")
require("./lib/list")
require("pg")
require('pry')

DB = PG.connect({:dbname => "to_do"})

get('/') do
  erb(:index)
end

get('/lists/new') do
  erb(:list_form)
end

post('/lists') do
  name = params.fetch('name')
  new_list = List.new({:name => name, :id => nil})
  new_list.save
  erb(:success)
end

get('/lists') do
  @lists = List.all()
  erb(:lists)
end

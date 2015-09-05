require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry'
require 'pg'
require 'httparty'

before do
  @db = PG.connect(dbname: 'movies_app', host: 'localhost')
end

after do
  @db.close
end

get '/' do 
  redirect to '/videos'
end
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry'
require 'pg'
require 'httparty'

before do
  @db = PG.connect(dbname: 'movies', host: 'localhost')
end

after do
  @db.close
end

get '/' do 
  redirect to '/show'
end

# NEW
get '/videos/new' do
  erb :new
end

get '/show' do
  @title = 'Video App'
  sql = 'select * from videos'
  
  @videos = @db.exec(sql)
  puts @videos

  erb :index
end

post '/video' do
  sql = "insert into videos (title, description, urlsnipp) values ('#{params[:title]}', '#{params[:description]}', '#{params[:urlsnipp]}') returning *"
  video = @db.exec(sql).first
  
  redirect to "/videos/#{video['id']}"
end

# SHOW
get '/videos/:id' do
  sql = "select * from videos where id = #{params[:id]}"
  @video = @db.exec(sql).first

  erb :show
end
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
  @title = 'Add a video'
  erb :new
end

get '/show' do
  @title = 'All Videos'
  sql = 'select * from videos'
  
  @videos = @db.exec(sql)
  

  erb :index
end

post '/video' do
  sql = "insert into videos (title, description, urlsnipp) values ('#{params[:title]}', '#{params[:description]}', '#{params[:urlsnipp]}') returning *"
  video = @db.exec(sql).first
  
  redirect to "/videos/#{video['id']}"
end

# SHOW
get '/videos/:id' do
  @title = 'View/Edit Video'
  sql = "select * from videos where id = #{params[:id]}"
  @video = @db.exec(sql).first

  erb :show
end
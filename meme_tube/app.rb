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

# EDIT
# get '/videos/:id/edit' do
#   sql = "select * from videos where id = #{params[:id]}"
#   @todo = @db.exec(sql).first

#   erb :edit
# end

# UPDATE
post '/videos/:id/edit' do
  sql = "update videos set title = '#{params[:editTitle]}', description = '#{params[:editDescription]}' where id = #{params[:id]}"
  @db.exec(sql)

  redirect to "/videos/#{params['id']}"
end

get '/show' do
  @title = 'All Videos'
  sql = 'select * from videos'
  
  @videos = @db.exec(sql)
  

  erb :index
end

post '/video' do

  url = params[:urlsnipp].split('=').last
  sql = "insert into videos (title, description, urlsnipp) values ('#{params[:title]}', '#{params[:description]}', '#{url}') returning *"
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

get '/az' do
  @title = 'A-Z of Videos'
  sql = "select * from videos order by title ASC"
  @videos = @db.exec(sql)

  erb :az
end


# DELETE
post '/videos/:id/delete' do
  sql = "delete from videos where id = #{params[:id]}"
  @db.exec(sql)

  redirect to '/'
end
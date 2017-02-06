require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('./models/albums')

get '/stock' do
 @albums = Album.all
 erb (:index) 
end

get '/stock/new' do
 erb(:new)
end

post '/stock' do
  @albums = Album.new(params)
  @albums.save
  erb(:create)
end  

get '/stock/:id' do
  @albums = Album.find(params[:id])
  erb(:show)
end



post '/stock/:id/delete' do
  @albums = Album.delete(params[:id])
  redirect to ('/stock')
end

get '/stock/:id/edit' do
  @albums = Album.find(params[:id])
  erb (:edit)
end

post '/stock/:id' do
  @albums = Album.update(params)
  redirect to ("/stock/#{params[:id]}")
end
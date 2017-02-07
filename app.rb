require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('./models/albums')
require_relative('controllers/artists_controller')

get '/stock' do
 @albums = Album.all
 erb (:index) 
end

get '/stock/new' do
 erb(:new)
end

post '/stock' do
  @album = Album.new(params)
  @album.save
  erb(:create)
end  

get '/stock/:id' do
  @album = Album.find(params[:id])
  erb(:show)
end

post '/stock/:id/delete' do
  @album = Album.delete(params[:id])
  redirect to ('/stock')
end

get '/stock/:id/edit' do
  @album = Album.find(params[:id])
  erb (:edit)
end

post '/stock/:id' do
  @album = Album.update(params)
  redirect to ("/stock/#{params[:id]}")
end
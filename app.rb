require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('./models/albums')

# get '/stock' do
#  erb (:index) 
# end

get '/stock' do
 # @artists = Artist.all()
 @albums = Album.all
 erb (:index) 
end

get '/stock/new' do
 erb(:new)
end

post '/stock' do
  @albums = Album.new(params)
  @album.save
  erb(:create)
end  

get '/stock/:id' do
  @albums = Album.find(params[:id])
  erb(:show)
end

post '/stock/:id' do
  @albums = Album.update(params)
  redirect to ("/stock/#{params[:id]}")
end

post '/stock/:id/delete' do
@albums = Album.destroy(params[:id])
redirect to ('/stock')
  end
# require( 'sinatra' )
# require( 'sinatra/contrib/all' )
# require_relative( '../models/artists.rb' )
# require_relative( '../models/albums.rb' )

# get '/stock' do
#   @stock = Album.all()
#   erb ( :"stock/index" )
# end

# get '/stock/new' do
#  erb(:new)
# end

# post '/stock' do
#   @album = Album.new(params)
#   @album.save
#   erb(:create)
# end  

# get '/stock/:id' do
#   @album = Album.find(params[:id])
#   erb(:show)
# end

# post '/stock/:id' do
#   @album = Album.update(params)
#   redirect to ("/stock/#{params[:id]}")
# end

# post '/stock/:id/delete' do
# @album = Album.destroy(params[:id])
# redirect to ('/stock')
#   end
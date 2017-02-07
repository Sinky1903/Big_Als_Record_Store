require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug')
require_relative( '../models/artists.rb' )

get '/artist' do
  @artists = Artist.all()
  erb (:"artists/index")
end

get '/artist/new' do
 erb(:"artists/new")
end

post '/artist' do
  @artist = Artist.new(params)
  @artist.save
  erb(:"artists/create")
end  

get '/artist/:id' do
  @artist = Artist.find(params[:id])
  erb(:"artists/show")
end

post '/artist/:id' do
  @artist = Artist.update(params)
  redirect to ("/artist/#{params[:id]}")
end
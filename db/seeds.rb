require('pry-byebug')
require('pg')
require_relative('../models/artists')
require_relative('../models/albums')

Album.delete_all
Artist.delete_all

Artist1 = Artist.new({ 'name' => 'Oasis'})
Artist1.save

Artist2 = Artist.new({ 'name' => 'Blur'})
Artist2.save

Artist3 = Artist.new({ 'name' => 'Cher'})
Artist3.save

Album1 = Album.new({ 'title' => "Definitely Maybe", 'genre' => "Rock/Indie", 'artist_id' => Artist1.id, 'quantity' => 10 })
Album1.save


Album2 = Album.new({ 'title' => "Blur", 'genre' => "Rock/Indie", 'artist_id' => Artist2.id, 'quantity' => 5 })
Album2.save


Album3 = Album.new({ 'title' => "Be Here Now", 'genre' => "Rock/Indie", 'artist_id' => Artist1.id, 'quantity' => 6 })
Album3.save


Album4 = Album.new({ 'title' => "Cher", 'genre' => "Pop", 'artist_id' => Artist3.id, 'quantity' => 10 })
Album4.save

binding.pry

nil
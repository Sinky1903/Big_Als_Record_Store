require_relative('../db/sql_runner')
require_relative('./artists')

class Album

  attr_reader :id
  attr_accessor :title, :genre, :quantity, :price, :artist_id

  def initialize ( options )

    @id = options['id'].to_i if options['id'] != nil
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
    @quantity = options['quantity'].to_i
    @price = options['price'].to_i
  end


  def save()
    sql = "INSERT INTO album (title, genre, artist_id, quantity, price) VALUES ('#{@title}', '#{@genre}', #{@artist_id}, #{@quantity}, #{@price}) RETURNING *;"
    albums = SqlRunner.run(sql).first
    @id = albums['id'].to_i
  end


  def update()
    sql = "UPDATE album SET (title, genre, artist_id, quantity) = ('#{@title}', '#{@genre}', #{@artist_id}, #{@quantity}, #{@price}) WHERE id = #{@id};"
    SqlRunner.run(sql)
  end


  def delete()
    sql = "DELETE * FROM album WHERE id = #{@id};"
    SqlRunner.run(sql)
  end


  def self.all()
    sql = "SELECT * FROM album;"
    # sql = "SELECT alb.*, art.name from album alb JOIN artist art ON alb.artist_id = art.id WHERE artist.id =#{@artist_id}"
    albums = SqlRunner.run(sql)
    result = albums.map { |album| Album.new(album)}
    return result
  end


  def self.delete_all()
    sql = "DELETE FROM album;"
    SqlRunner.run(sql)
  end


  def self.find(id)
    sql = "SELECT * FROM album WHERE id=#{id};"
    album = SqlRunner.run(sql)
    result = Album.new(album.first)
    return result
  end


  def self.delete( id )
    sql = "DELETE FROM album WHERE id=#{id};"
    SqlRunner.run(sql)
  end


  def self.update( options )
    sql = "UPDATE album SET title= '#{options['title']}', 
    genre= '#{options['genre']}', 
    artist_id= #{options['artist_id']}, 
    quantity= #{options['quantity']}, price= #{options['price']} WHERE id=#{options['id']}"
    SqlRunner.run(sql)
  end


  def artist()
    sql = "SELECT * FROM artist WHERE id = #{@artist_id};"
    artist = SqlRunner.run(sql)[0]
    Artist.new( artist )
  end


end




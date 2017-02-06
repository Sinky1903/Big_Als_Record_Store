require_relative('../db/sql_runner')

class Album

  attr_reader :id, :artist_id
  attr_accessor :title, :genre, :quantity

  def initialize ( options )

    @id = options['id'].to_i if options['id'] != nil
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
    @quantity = options['quantity'].to_i
  end


  def save()
    sql = "INSERT INTO album (title, genre, artist_id, quantity) VALUES ('#{@title}', '#{@genre}', #{@artist_id}, #{@quantity}) RETURNING *;"
    album = SqlRunner.run(sql).first
    @id = album['id'].to_i
  end


  def update()
    sql = "UPDATE album SET (title, genre, artist_id, quantity) = ('#{@title}', '#{@genre}', #{@artist_id}, #{@quantity}) WHERE id = #{@id};"
    SqlRunner.run(sql)
  end


  # def delete()
  #   sql = "DELETE * FROM album WHERE id = #{@id};"
  #   SqlRunner.run(sql)
  # end


  def self.all()
    sql = "SELECT * FROM album;"
    albums = SqlRunner.run(sql)
    result = albums.map { |album| Album.new (album)}
    return result
  end


  def self.find(id)
    sql = "SELECT * FROM album WHERE id=#{id};"
    albums = SqlRunner.run(sql)
    result = Album.new(album.first)
    return result
  end


  def self.delete( id )
    sql = "DELETE FROM album WHERE id=#{id};"
    SqlRunner.run(sql)
  end


  def self.update( options )
    sql = "UPDATE album SET title= '#{options['title']}',
    genre= '#{options['genre']}'
    artist_id= #{options['artist_id']}
    quantity= #{options['quantity']} WHERE id=#{options['id']}'"
    SqlRunner.run(sql)
  end


  def artist(artist_id)
    sql = "SELECT * FROM album WHERE id=#{artist_id};"
    student = SqlRunner.run(sql)
  end


  def join
    sql = "SELECT * FROM artist art
          INNER JOIN album alb
          ON alb.artist_id = art.id
          WHERE art.id = #{@artist_id}"
    results = SqlRunner.run( sql )
    return Artist.new( results.first )
  end


end




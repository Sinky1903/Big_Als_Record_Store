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


  def delete()
    sql = "DELETE * FROM album WHERE id = #{@id};"
    SqlRunner.run(sql)
  end


  def self.all()
    sql = "SELECT * FROM album;"
    albums = SqlRunner.run(sql)
    result = albums.map { |album| Album.new (album)}
    return result
  end


  def self.delete_all
    sql = "DELETE FROM album;"
    SqlRunner.run(sql)
  end


  def artist(artist_id)
    sql = "SELECT * FROM albums WHERE id=#{artist_id}"
    student = SqlRunner.run(sql)
  end


  def join
    sql = "SELECT * FROM artists art
          INNER JOIN albums alb
          ON alb.artist_id = art.id
          WHERE art.id = #{@artist_id}"
    results = SqlRunner.run( sql )
    return Artist.new( results.first )
  end


end




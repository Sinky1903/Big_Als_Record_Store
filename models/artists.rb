require_relative('../db/sql_runner')

class Artist

  attr_reader :id
  attr_accessor :name

  def initialize ( options )

    @id = options['id'].to_i if options['id'] != nil
    @name = options['name']
  end


  def save()
    sql = "INSERT INTO artist (name) VALUES ('#{@name}') RETURNING *;"
    artist = SqlRunner.run(sql).first
    @id = artist['id'].to_i
  end


  def update()
    sql = "UPDATE artist SET (name) = ('#{@name}') WHERE id = #{@id};"
    SqlRunner.run(sql)
  end


  def delete()
    sql = "DELETE * FROM artist WHERE id = #{@id};"
    SqlRunner.run(sql)
  end


  def self.all()
    sql = "SELECT * FROM artist;"
    artists = SqlRunner.run(sql)
    result = artists.map { |artist| Artist.new (artist)}
    return result
  end


  def self.delete_all()
    sql = "DELETE FROM artist;"
    SqlRunner.run(sql)
  end


  def self.find(id)
    sql = "SELECT * FROM artists WHERE id=#{id}"
   artist = SqlRunner.run(sql)
   result = Artist.new(artist.first)
   return result
  end



end




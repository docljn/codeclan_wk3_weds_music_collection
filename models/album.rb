require_relative('../db/sql_runner')
require_relative('artist')

class Album

  def initialize(options)
    @id         = options['id'].to_i if options['id']
    @title      = options['title']
    @genre      = options['genre']
    @artist_id  = options['artist_id']
  end

  # class methods


  # instance methods
  def save()
    sql = "INSERT INTO albums (title, genre, artist_id) VALUES ($1, $2, $3) RETURNING id"
    @id = SqlRunner.run(sql, [@title, @genre, @artist_id])[0]['id']
  end



end

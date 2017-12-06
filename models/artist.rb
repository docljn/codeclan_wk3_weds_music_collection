require ('pry-byebug')
require_relative ('../db/sql_runner')

class Artist

  attr_reader :id
  attr_accessor :name

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  # class methods

  # CARE: deleting any item in the artist array will only be successful if the associated album has been deleted first.

  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def self.delete_one(id)
    sql = "DELETE FROM artists WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  # def self.find_all()
  # end



  # instance methods

  def save()
    sql     = "INSERT INTO artists (name) VALUES ($1) RETURNING id"
    values  = [@name]
    @id     = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def update()
    sql     = "UPDATE artists SET (name) = ($1) WHERE id = $2"
    values  = [@name, @id]
    SqlRunner.run(sql, values)
  end



end




# artist.rb

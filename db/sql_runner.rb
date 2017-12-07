require('pg')

class SqlRunner

  # begin - end is used along with ensure
  # ensure guarantees that some code will be run, no matter what else happens.


  def self.run(sql, values)
    begin
      db = PG.connect({dbname: "music_library", host: "localhost"})
      db.prepare("query", sql)
      result = db.exec_prepared("query", values)
    rescue PG::ConnectionBad
      # if database connection doesn't work
      # just for learning here, rather than an actual programming purpose
      p "dealing with PG::ConnectionBad Error"
    ensure
      db.close() if db != nil
    end
    return result
  end

  # def self.run(sql, values = [])
  #   # error handling here
  #   db = PG.connect({dbname: 'music_collection', host: 'localhost'})
  #   db.prepare('query', sql)
  #   result = db.exec_prepared('query', values)
  #   db.close()
  #   return result
  # end


end

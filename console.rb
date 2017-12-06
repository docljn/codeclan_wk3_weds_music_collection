require('pry-byebug')
require_relative('models/artist.rb')
require_relative('models/album.rb')
require_relative('db/sql_runner.rb')

Artist.delete_all()

artist1 = Artist.new({
  'name' => "Bono"
  })

artist2 = Artist.new({
  'name' => "Justin Bieber"
  })

artist1.save()
artist2.save()

artist1.name = "Freddie Mercury"
artist1.update()

Artist.delete_one(artist2.id)

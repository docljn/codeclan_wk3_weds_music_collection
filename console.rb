require('pry-byebug')
require_relative('models/artist.rb')
require_relative('models/album.rb')
require_relative('db/sql_runner.rb')

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({
  'name' => "Bono"
  })

artist2 = Artist.new({
  'name' => "Pink"
  })

artist1.save()
artist2.save()

artist1.name = "Freddie Mercury"
artist1.save()

#Artist.delete_one(artist2.id)

album1 = Album.new({
  'title' => 'Joshua Tree',
  'genre' => 'Rock',
  'artist_id' => artist1.id
  })

album1.save()

album1.genre = "Pop"
album1.save()

artists_list = Artist.find_all().map{|artist| Artist.new(artist)}
p artists_list

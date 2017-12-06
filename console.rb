require('pry-byebug')
require_relative('models/artist.rb')
require_relative('models/album.rb')
require_relative('db/sql_runner.rb')

artist1 = Artist.new({
  'name' => "Bono"
  })

artist1.save()

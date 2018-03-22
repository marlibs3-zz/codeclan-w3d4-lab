require_relative( 'models/movie' )
require_relative( 'models/star' )
require_relative( 'models/casting' )

# require( 'pry-byebug' )

Casting.delete_all()
Movie.delete_all()
Star.delete_all()

star1 = Star.new({ 'first_name' => 'Chris', 'second_name' => 'Pratt'})
star1.save()
star2 = Star.new({ 'first_name' => 'Karen', 'second_name' => 'Gillan'})
star2.save()
star3 = Star.new({ 'first_name' => 'Chris', 'second_name' => 'Hemsworth'})
star3.save()

movie1 = Movie.new({ 'title' => 'Guardians of the Galaxy', 'genre' => 'Fantasy', 'rating' => '8'})
movie1.save()
movie2 = Movie.new({ 'title' => 'Avengers Assemble', 'genre' => 'Action', 'rating' => '7'})
movie2.save()

visit1 = Visit.new({ 'user_id' => user1.id, 'location_id' => location1.id, 'review' => '0 stars, far too hot'})
visit1.save()
visit2 = Visit.new({ 'user_id' => user3.id, 'location_id' => location1.id, 'review' => '5 stars, would visit again if I could'})
visit2.save()
visit3 = Visit.new({ 'user_id' => user1.id, 'location_id' => location2.id, 'review' => '4 stars, plenty of beer available'})
visit3.save()
visit4 = Visit.new({ 'user_id' => user2.id, 'location_id' => location2.id, 'review' => '3 stars, too crowded, could not find my wizard friend'})
visit4.save()

# binding.pry
# nil

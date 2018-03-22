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

movie1 = Movie.new({ 'title' => 'Guardians of the Galaxy', 'genre' => 'Fantasy', 'rating' => '8', 'budget' => '6000000'})
movie1.save()
movie2 = Movie.new({ 'title' => 'Avengers Assemble', 'genre' => 'Action', 'rating' => '7', 'budget' => '8000000'})
movie2.save()
movie3 = Movie.new({ 'title' => 'The Circle', 'genre' => 'Drama', 'rating' => '6', 'budget' => '3000000'})
movie3.save()

casting1 = Casting.new({ 'movie_id' => movie1.id, 'star_id' => star1.id, 'fee' => '1000000'})
casting1.save()
casting2 = Casting.new({ 'movie_id' => movie1.id, 'star_id' => star2.id, 'fee' => '1500000'})
casting2.save()
casting3 = Casting.new({ 'movie_id' => movie2.id, 'star_id' => star3.id, 'fee' => '3000000'})
casting3.save()
casting4 = Casting.new({ 'movie_id' => movie3.id, 'star_id' => star2.id, 'fee' => '1000000'})
casting4.save()

# binding.pry
# nil

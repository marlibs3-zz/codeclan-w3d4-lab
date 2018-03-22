require_relative("../db/sql_runner")
require_relative("movie")
require_relative("star")

class Casting

  attr_reader :id
  attr_accessor :user_id, :location_id, :review

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @movie_id = options['movie_id'].to_i
    @star_id = options['star_id'].to_i
    @fee = options['fee'].to_i
  end

  def self.drop()
    sql = "DROP TABLE IF EXISTS castings;"
    SqlRunner.run(sql)
  end

  def self.create()
    sql = "CREATE TABLE castings (
    id SERIAL4 PRIMARY KEY,
    movie_id INT4 REFERENCES movies(id) ON DELETE CASCADE,
    star_id INT4 REFERENCES stars(id) ON DELETE CASCADE,
    fee INT
    );"
    SqlRunner.run(sql)
  end

  def save()
    sql = "INSERT INTO castings
    (
      movie_id,
      star_id,
      fee
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@movie_id, @star_id, @fee]
    casting = SqlRunner.run( sql,values ).first
    @id = casting['id'].to_i
  end

end

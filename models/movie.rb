require_relative("../db/sql_runner")

class Movie

  attr_reader :id
  attr_accessor :title, :genre, :rating, :budget

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @rating = options['rating'].to_i
    @budget = options['budget'].to_i
  end

  def self.drop()
    sql = "DROP TABLE IF EXISTS movies;"
    SqlRunner.run(sql)
  end

  def self.create()
    sql = "CREATE TABLE movies (
      id SERIAL4 PRIMARY KEY,
      title VARCHAR(255),
      genre VARCHAR(255),
      rating INT,
      budget INT
    );"
    SqlRunner.run(sql)
  end

  def save()
    sql = "INSERT INTO movies
    (
      title,
      genre,
      rating,
      budget
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING id"
    values = [@title, @genre, @rating, @budget]
    movie = SqlRunner.run( sql, values ).first
    @id = movie['id'].to_i
  end

end

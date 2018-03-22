require_relative("../db/sql_runner")

class Star

  attr_reader :id
  attr_accessor :first_name, :second_name

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @second_name = options['second_name']
  end

  def self.drop()
    sql = "DROP TABLE IF EXISTS stars;"
    SqlRunner.run(sql)
  end

  def self.create()
    sql = "CREATE TABLE stars (
    id SERIAL4 PRIMARY KEY,
    first_name VARCHAR(255),
    second_name VARCHAR(255)
    );"
    SqlRunner.run(sql)
  end

  def save()
    sql = "INSERT INTO stars
    (
      first_name,
      second_name
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@first_name, @second_name]
    star = SqlRunner.run( sql, values ).first
    @id = star['id'].to_i
  end

end

require_relative('../db/sql_runner')

class Student

  attr_reader :first_name, :second_name, :house, :age, :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @second_name = options['second_name']
    @house = options['house'].to_i
    @age = options['age'].to_i
  end

  def save()
    sql = "INSERT INTO students
    (
      first_name,
      second_name,
      house,
      age
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING *"
    values = [@first_name, @second_name, @house, @age]
    pg_result = SqlRunner.run(sql, values)
    @id = pg_result.first()['id'].to_i
  end


  def house_name()
    sql = "SELECT name FROM houses WHERE id = $1"
    values = [@house]
    pg_result = SqlRunner.run(sql, values).first
    return pg_result['name']
  end


def self.all()
  sql = "SELECT * FROM students"
  pg_result = SqlRunner.run(sql)
  result = pg_result.map{|student| Student.new(student)}
  return result
end

def self.find(id)
  sql = "SELECT * FROM students WHERE id = $1"
  values = [id]
  pg_result = SqlRunner.run(sql, values)
  result = Student.new(pg_result.first)
  return result
end




end

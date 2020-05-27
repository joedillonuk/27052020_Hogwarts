require_relative('../db/sql_runner')

class House

  attr_reader :name, :logo, :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @logo = options['logo']
  end

  def save()
    sql = "INSERT INTO houses
    (
      name,
      logo
    )
    VALUES
    (
      $1, $2
    )
    RETURNING *"
    values = [@name, @logo]
    pg_result = SqlRunner.run(sql, values)
    @id = pg_result.first()['id'].to_i
  end

def self.all()
  sql = "SELECT * FROM houses"
  pg_result = SqlRunner.run(sql)
  result = pg_result.map{|house| House.new(house)}
  return result
end

def self.find(id)
  sql = "SELECT * FROM houses WHERE id = $1"
  values = [id]
  pg_result = SqlRunner.run(sql, values)
  result = House.new(pg_result.first)
  return result
end



end

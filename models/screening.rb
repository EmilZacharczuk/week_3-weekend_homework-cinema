require_relative('../db/sql_runner')

class Screening

  attr_reader :id
  attr_accessor :show_time

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @show_time = options['show_time']
    @film_id = options['film_id']
  end

  def save()
    sql = 'INSERT INTO screenings (show_time,film_id) VALUES ($1,$2) RETURNING id'
    values = [@show_time,@film_id]
    screening = SqlRunner.run(sql, values).first
    @id = screening['id'].to_i
  end

  def update()
    sql = "UPDATE screenings SET (show_time,film_id) = ($1,$2) WHERE id = $3"
    values = [@show_time,@film_id,@id]
    screening = SqlRunner.run(sql,values).first
  end

  def customers()
    sql = "SELECT customers.* FROM customers INNER JOIN tickets ON tickets.customer_id = customers.id
    WHERE screening_id = $1"
    values = [id]
    customers = SqlRunner.run(sql, values)
    result = customers.map { |customer| Customer.new(customer) }
    return result
  end

  def films()
    sql = "SELECT films.* FROM films
    INNER JOIN tickets
    ON tickets.film_id = films.id
    WHERE screening_id = $1"
    values = [id]
    films = SqlRunner.run(sql, values)
    result = films.map { |film| Film.new(film)}
    return result
  end
  
  def self.all
    sql = "SELECT * FROM screenings"
    values = []
    screenings = SqlRunner.run(sql, values)
    result = screenings.map { |screening| Screening.new(screening)}
    return result
  end

  def self.delete_all
    sql = "DELETE FROM screenings"
    values = []
    SqlRunner.run(sql, values)
  end
end

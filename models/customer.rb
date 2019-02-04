require_relative('../db/sql_runner.rb')

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds']
  end

  def save()
    sql = "INSERT INTO customers(name,funds) VALUES ($1,$2) RETURNING id"
    values = [@name,@funds]
    customer = SqlRunner.run(sql, values).first
    @id = customer['id'].to_i
  end

  def update()
    sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3"
    values = [@name,@funds,@id]
    customer = SqlRunner.run(sql,values).first
  end

  def films()
    sql = "SELECT films.* FROM films INNER JOIN tickets
    ON tickets.film_id = films.id WHERE customer_id = $1"
    values = [id]
    films = SqlRunner.run(sql, values)
    result = films.map { |film| Film.new(film)}
    return result
  end

  def how_many_films()
    self.films.length
  end

  def remaining_funds()
    films = self.films()
    films_cost = films.map{|film| film.price.to_i}
    return @funds - films_cost.sum
  end
  def self.find(id)
    sql = "SELECT * FROM customers WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    customer = Customer.new(result)
    return customer
  end

  def self.all
    sql = "SELECT * FROM customers"
    values = []
    customers = SqlRunner.run(sql, values)
    result = customers.map { |customer| Customer.new(customer)}
    return result
  end
  def self.delete_all
    sql = "DELETE FROM customers"
    values = []
    SqlRunner.run(sql, values)
  end

end

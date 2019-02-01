require_relative('../db/sql_runner.rb')

class Ticket

  attr_reader :id
  attr_accessor :customer_id, :film_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
  end

  def save()
    sql = "INSERT INTO tickets (customer_id, film_id) VALUES ($1,$2) RETURNING id"
    values = [@customer_id, @film_id]
    ticket = SqlRunner.run(sql, values).first
    @id = ticket['id'].to_i
  end

  def update()
    sql = "UPDATE tickets SET (customer_id, film_id) = ($1,$2) WHERE id = $3"
    values = [@customer_id, @film_id, @id]
    ticket = SqlRunner.run(sql, values).first
  end
  def self.all
    sql = "SELECT * FROM tickets"
    values = []
    tickets = SqlRunner.run(sql, values)
    result = tickets.map { |ticket| Ticket.new(ticket)}
    return result
  end
  def self.find(id)
    sql = "SELECT * FROM tickets WHERE id = $1"
    values = [id]
    tickets = SqlRunner.run(sql, values)
    result = Ticket.new(tickets.first)
  end
  def self.delete_all
    sql = "DELETE FROM tickets"
    values = []
    SqlRunner.run(sql, values)
  end
end

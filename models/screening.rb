require_relative('../db/sql_runner')

class Screening

  attr_reader :id
  attr_accessor :film_id, :show_time

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @film_id = options['film_id'].to_i
    @show_time = options['time']
  end

  def save()
    sql = 'INSERT INTO screenings (film_id, show_time) VALUES ($1,$2) RETURNING id'
    values = [@film_id,@show_time]
    screening = SqlRunner.run(sql, values).first
    @id = screening['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM screenings"
    values = []
    screenings = SqlRunner.run(sql, values)
    result = screenings.map { |screening| Screening.new(screening)}
    return result
  end
end

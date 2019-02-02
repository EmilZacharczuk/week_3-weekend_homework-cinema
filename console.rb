require('pry')

require_relative('models/customer.rb')
require_relative('models/film.rb')
require_relative('models/ticket.rb')
require_relative('models/screening.rb')

Customer.delete_all
Film.delete_all

customer_1 = Customer.new({
  'name' => 'Emil',
  'funds' => 50})

customer_2 = Customer.new({
  'name' => 'Mark',
  'funds' => 30})

customer_3 = Customer.new({
  'name' => 'Anna',
  'funds' => 20})

customer_4 = Customer.new({
  'name' => 'Margaret',
  'funds' => 10})
customer_5 = Customer.new({
  'name' => 'John',
  'funds' => 60})

customer_1.save
customer_2.save
customer_3.save
customer_4.save
customer_5.save

film_1 = Film.new({
  'title' => 'Batman',
  'price' => 5})

film_2 = Film.new({
  'title' => 'Superman',
  'price' => 6
  })

film_3 = Film.new({
  'title' => 'Spiderman',
  'price' => 7
  })

film_1.save
film_2.save
film_3.save

ticket_1 = Ticket.new({
  'customer_id' => customer_1.id,
  'film_id' => film_1.id
  })

ticket_2 = Ticket.new({
  'customer_id' => customer_2.id,
  'film_id' => film_2.id
  })

ticket_3 = Ticket.new({
  'customer_id' => customer_3.id,
  'film_id' => film_3.id
  })

ticket_4 = Ticket.new({
  'customer_id' => customer_1.id,
  'film_id' => film_3.id
  })
ticket_5 = Ticket.new({
  'customer_id' => customer_1.id,
  'film_id' => film_1.id
  })
ticket_6 = Ticket.new({
  'customer_id' => customer_1.id,
  'film_id' => film_1.id
  })
ticket_1.save
ticket_2.save
ticket_3.save
ticket_4.save
ticket_5.save
ticket_6.save

screening_1 = Screening.new ({
  'film_id' => film_1.id,
  'time' => '12:00'
  })
screening_2 = Screening.new({
  'film_id' => film_1.id,
  'time' => '16:30'
  })
screening_1.save
screening_2.save

customer_1.name = 'Kamil'
customer_1.update

film_1.title = 'Superwoman'
film_1.update

ticket_1.customer_id = customer_2.id
ticket_1.update

mark = Customer.find(customer_2.id)

superman = Film.find(film_2.id)

lost_ticket = Ticket.find(ticket_1.id)

binding.pry
nil

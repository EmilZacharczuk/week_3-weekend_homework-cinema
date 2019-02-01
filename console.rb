require('pry')

require_relative('models/customer.rb')
require_relative('models/film.rb')
require_relative('models/ticket.rb')

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

customer_1.save
customer_2.save
customer_3.save

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

ticket_1.save
ticket_2.save
ticket_3.save
ticket_4.save

customer_1.name = 'Kamil'
customer_1.update

binding.pry
nil

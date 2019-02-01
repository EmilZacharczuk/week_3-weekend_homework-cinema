require('pry')

require_relative('models/customer.rb')
require_relative('models/film.rb')
require_relative('models/ticket.rb')

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

binding.pry
nil

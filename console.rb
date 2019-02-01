require('pry')

require_relative('..models/custumer')
require_relative('../models/film')
require_relative('../models/ticket')

customer_1 = Customer.new({
  'name' => 'Emil',
  'funds' => 50
})

customer_2 = Customer.new({
  'name' => 'Mark'
  'funds' => 30
  })

customer_3 = Customer.new({
  'name' => 'Anna'
  'funds' => 20
  })

binding.pry
nil

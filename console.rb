require_relative( '../models/pizza' ) 
require_relative( '../models/sales' )
require( 'pry-byebug' )

pizzas = Pizza.all()
sales = Sales.new( pizzas )

binding.pry
nil

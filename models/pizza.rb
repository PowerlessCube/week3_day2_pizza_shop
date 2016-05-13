 require( 'pry-byebug' ) # break point debugger.
 require( 'pg' )# gem for PreSQL

 class Pizza

   attr_accessor( :first_name, :last_name, :topping, :quantity )

   def initialize( options ) #options hash
     @id = options[ 'id' ].to_i
     @first_name = options[ 'first_name' ] #techincally this is a hash
     @last_name = options[ 'last_name' ]
     @topping = options[ 'topping' ]
     @quantity = options[ 'quantity' ].to_i
   end

#save method, instance method.
   def save(  ) #connects to database file
     db = PG.connect( { dbname: 'pizza_shop', host: 'localhost' } ) #tells ruby where your database is located using a hash.
     sql = "INSERT INTO pizzas (
      first_name,
      last_name,
      topping,
      quantity)
      VALUES (
      '#{ @first_name }',
      '#{ @last_name }',
      '#{ @topping }',
      #{@quantity}
      );"
      #above links are ruby instance variables with PreSQL code.

      db.exec( sql ) #executes takes your sql and runs it on your database.
      db.close() #shuts off your db connection(full stop!)
   end

   def self.all() #defining our own class method. #self key-word represents what you're currently in.
     db = PG.connect( { dbname: 'pizza_shop', host: 'localhost' } )
     sql = "SELECT * FROM pizzas"
     pizzas = db.exec( sql )
     db.close(  )
     return pizzas.map { |pizza| Pizza.new( pizza ) } #feeds each row back into our pizza class to convert the values to the required
   end

   def update()
     db = PG.connect( { dbname: 'pizza_shop', host: 'localhost' } )
     sql = "UPDATE pizzas
            SET first_name = '#{@first_name}',
                last_name = '#{@last_name}',
                topping = '#{@topping}',
                quantity = '#{@quantity}
            WHERE id = #{@id}"
     db.exec( sql )
     db.close
   end

   def delete() #instance method - as it's the users responsibility to
     db = PG.connect( { dbname: 'pizza_shop', host: 'localhost' } )
     sql = "DELETE FROM pizzas WHERE id = #{@id}"
     db.exec( sql )
     db.close
   end

end

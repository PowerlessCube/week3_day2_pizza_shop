require 'pry-byebug'
class Sales

  def initialize( pizzas )
    @pizzas = pizzas
  end

  def total_revenue
    # @pizzas.inject { | sum, pizza | sum + pizza.quantity } * 10
    total = 0
    for pizza in @pizzas
      total += ( pizza.quantity * 10 )
    end
    return total
  end


end

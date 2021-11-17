
class Item

  attr_reader :name

  def initialize(attributes)
    @name = attributes[:name]
    @price = attributes[:price]
  end

  def price
    return_price = @price.delete_prefix("$")
    return_price = return_price.to_f.round(2)
    # require "pry"; binding.pry
  end


end

class Item
  attr_reader :name, :price

  def initialize(attributes)
    @name = attributes[:name]
    @price = attributes[:price]
  end

  def price
    @price.delete('$')
    @price.to_i
  end


end

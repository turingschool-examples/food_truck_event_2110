require 'bigdecimal'
class Item
  attr_reader :name, :price
  def initialize(attributes)
    @name = attributes[:name]
    (attributes[:price].slice!(0))
    @price = BigDecimal(attributes[:price])
  end
end

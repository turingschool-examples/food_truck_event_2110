class Item
  attr_reader :name, :price

  def initialize(attributes)
    @name = attributes[:name]
    @price = attributes[:price].split('')[1..4].join.to_f
  end
end

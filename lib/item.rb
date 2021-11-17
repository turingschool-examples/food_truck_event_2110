
class Item
  attr_reader :name, :price

  def initialize(info)
    @name = info[:name]
    @price = info[:price].split('')[1..4].join.to_f
  end
end

class FoodTruck
  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def stock(new_item, count)
    @inventory[new_item] += count
  end

  def check_stock(new_item)
    @inventory[new_item]
  end

  def potential_revenue
    potential_revenue = (@item.price.to_f * @item.item_stock.to_f)
  end
end

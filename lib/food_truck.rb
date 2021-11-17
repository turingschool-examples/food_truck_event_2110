class FoodTruck
  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item_name)
    if @inventory.keys.include? item_name
      @inventory.values.sum
    else
      0
    end
  end

  def stock(item_name, quantity)
    @inventory[item_name] += quantity
  end

  def potential_revenue
    total = 0.0
    @inventory.each do |item, quantity|
      total += (item.price * quantity)
    end
    total
  end
end

class FoodTruck

  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    if @inventory[item] == nil
      return 0
    end

    @inventory[item]
  end

  def stock(item, quantity)
    @inventory[item] ||= 0
    @inventory[item] += quantity
  end

  def potential_revenue
    if @inventory == {}
      return 0
    end

    pot_rev = 0
    @inventory.each_pair do |item, quantity|
      pot_rev += (item.price * quantity)
    end
    pot_rev
  end
end

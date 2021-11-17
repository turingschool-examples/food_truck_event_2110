require './lib/item'

class FoodTruck

  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def stock(item, amount)
    @inventory[item] += amount
  end

  def check_stock(item)
    @inventory[item]
  end

  def potential_revenue
    revenue_total = 0
    @inventory.each do |item, amount|
      revenue_total += item.price.tr('$','').to_f * amount
    end
    revenue_total
  end
end

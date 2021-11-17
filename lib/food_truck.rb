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

  # def get_item_price_as_float(item)
  #   item.price.tr('$', '').to_f
  # end

  def potential_revenue
    revenue_total = 0
    @inventory.each do |item|
      revenue_total += item[0].price.tr('$','').to_f * item[1]
    end
    revenue_total
  end


end

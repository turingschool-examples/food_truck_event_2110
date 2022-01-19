require 'pry'

class FoodTruck
  attr_reader :name, :inventory
  attr_accessor

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, amount)
    @inventory[item] += amount
  end

  def potential_revenue
    collector = []
    @inventory.each do |item, amount|
      money_split = item.price.split('')
      money_split.shift
      float_amount = money_split.join.to_f
      item_total = float_amount * amount
      collector << item_total
    end
    return collector.sum
  end


end

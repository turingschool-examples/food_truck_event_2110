require 'pry'

class FoodTruck
  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = Hash.new { |hash, key| hash[key] = 0 }
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, amount)
    @inventory[item] += amount
  end

  def potential_revenue
    potential = 0
    @inventory.each do |item, amount|
      potential += (item.price * amount)
    end
    potential #still drop trailing 0s for now
  end
end

require 'pry'

class FoodTruck
  attr_reader :name, :inventory

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
    @inventory.each_with_object([]) do |(item,amount),array|
      price_in_array = item.price.scan(/\d+(?:[.,]\d+)?/)
      array << price_in_array.first.to_f * amount
    end.sum
  end
end

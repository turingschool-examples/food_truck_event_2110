require 'pry'
class FoodTruck
  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory.select {|key| key if key.name == item.name}.values.join.to_i
  end

  def stock(item, quantity)
    @inventory[item] += quantity
  end


end

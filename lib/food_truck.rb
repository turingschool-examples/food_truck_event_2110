require 'pry'
require './lib/item'

class FoodTruck
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item_name, quantity)
    @inventory[item_name] += quantity
  end
end

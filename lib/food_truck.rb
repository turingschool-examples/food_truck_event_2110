require 'pry'

class FoodTruck
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    if @inventory.include?(item) == false
      0
    elsif @inventory.include?(item)
      @inventory[item]
    end
  end

  def stock(item, ammount)
    if @inventory.include?(item) == false
      @inventory[item] = ammount
    elsif @inventory.include?(item)
      @inventory[item] += ammount
    end
  end

  def potential_revenue
    a = 0
    @inventory.each do |item|
      item_ammount = item[0].price * item.last.to_f
      a += item_ammount
    end
    a
  end
end

class FoodTruck
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    num = 0
    @inventory.each_pair do |food, count|
      if food.name == item.name
        num = count
      end
    end
    num
  end

  def stock(item, quantity)
    @inventory[item] += quantity
  end

  def potential_revenue
    sum = 0.00
    @inventory.each_pair do |item, quantity|
      sum += item.price * quantity
    end
    sum
  end
end

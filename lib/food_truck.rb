class FoodTruck
  attr_reader :name,
              :inventory

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
    prices = self.inventory.keys.map do |item|
      item.price
    end
    stocks = self.inventory.values
    total = prices.zip(stocks).map do |price, inventory|
      price * inventory
    end
    total.sum
  end

  
end

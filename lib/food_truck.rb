class FoodTruck
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    # require "pry"; binding.pry
    if self.inventory[item].nil? then 0 else self.inventory[item] end
    end

    def stock(item, amount)
      # require "pry"; binding.pry
      if self.inventory[item].nil? then self.inventory[item] = amount else self.inventory[item] += amount end
    end

  def potential_revenue
    @inventory.sum do |key, value|
      key.price * value
          # require "pry"; binding.pry
    end
  end
end
